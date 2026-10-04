#!/usr/bin/env sh
# Unit tests for shape-your-project/hooks: real git repos in a temp dir, no agent.
# Usage: sh tests/shape-your-project/hooks/run.sh
set -eu
here=$(cd "$(dirname "$0")" && pwd)
hooks=$(cd "$here/../../../shape-your-project/hooks" && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
failures=0

pass() { printf 'ok   %s\n' "$1"; }
fail() { printf 'FAIL %s\n' "$1"; failures=$((failures + 1)); }
# expect <name> <wanted exit> <command...>: runs the command, keeps stderr in $work/err.
expect() {
    name=$1 wanted=$2
    shift 2
    set +e
    "$@" 2>"$work/err" >"$work/out"
    got=$?
    set -e
    if [ "$got" -eq "$wanted" ]; then pass "$name"; else fail "$name (exit $got, wanted $wanted)"; cat "$work/err"; fi
}

# A repo with main, an origin remote, and one area file plus src.
new_repo() {
    repo="$work/$1"
    git init -q --bare "$repo.git"
    git init -q -b main "$repo"
    cd "$repo"
    git config user.name t
    git config user.email t@example.com
    git config core.autocrlf false
    mkdir -p docs/shape src
    printf '# Arch\n\nNext id: ARCH-2\n' >docs/shape/architecture.md
    printf 'x\n' >src/a.gd
    git add -A
    git commit -qm base
    git remote add origin "$repo.git"
    git push -q origin main
    git remote set-head origin main
}

zeros=0000000000000000000000000000000000000000

# --- pre-commit ---
new_repo commit
printf 'more\n' >>docs/shape/architecture.md && git add -A
expect "pre-commit: main may change an area file" 0 sh "$hooks/pre-commit.sh"
git reset -q --hard

git switch -qc feature/pause
printf 'more\n' >>docs/shape/architecture.md && git add -A
expect "pre-commit: a branch may not change an area file" 1 sh "$hooks/pre-commit.sh"
git reset -q --hard
printf '# Arch · enemies
' >docs/shape/architecture.enemies.md && git add -A
expect "pre-commit: a branch may not add a title file" 1 sh "$hooks/pre-commit.sh"
git reset -q --hard
git clean -qfd docs
printf 'more
' >>docs/shape/architecture.md && git add -A
grep -q 'docs/shape/inbox/feature-pause.md' "$work/err" && pass "pre-commit: refusal names the inbox" || fail "pre-commit: refusal names the inbox"
git reset -q --hard

mkdir -p docs/shape/inbox
printf -- '- 2026-10-02 · architecture · cite · ARCH-1 · x\n' >docs/shape/inbox/feature-pause.md && git add -A
expect "pre-commit: a branch may write its inbox" 0 sh "$hooks/pre-commit.sh"
git commit -qm inbox --no-verify

git switch -q main
printf 'decided\n' >>docs/shape/architecture.md && git commit -qam "rule on main"
git switch -q feature/pause
git merge -q --no-commit --no-ff main
expect "pre-commit: merging the writer branch in is left to pre-push" 0 sh "$hooks/pre-commit.sh"
git commit -qm "merge main" --no-verify

git config shape.writerBranch trunk
git switch -q main
printf 'more\n' >>docs/shape/architecture.md && git add -A
expect "pre-commit: shape.writerBranch overrides main" 1 sh "$hooks/pre-commit.sh"
git reset -q --hard
git config --unset shape.writerBranch

# --- pre-push ---
new_repo push
git switch -qc feature/a
printf 'more\n' >>docs/shape/architecture.md && git commit -qam "edit area" --no-verify
expect "pre-push: a branch changing an area file is refused" 1 sh -c "printf 'refs/heads/feature/a %s refs/heads/feature/a $zeros\n' \$(git rev-parse feature/a) | sh '$hooks/pre-push.sh' origin x"

git reset -q --hard HEAD~1
git switch -q main
printf 'decided\n' >>docs/shape/architecture.md && git commit -qam "rule on main"
git push -q origin main
git switch -q feature/a
printf 'y\n' >>src/a.gd && git commit -qam "work"
git merge -q --no-edit main
expect "pre-push: merging the writer branch in is not the branch's change" 0 sh -c "printf 'refs/heads/feature/a %s refs/heads/feature/a $zeros\n' \$(git rev-parse feature/a) | sh '$hooks/pre-push.sh' origin x"

git switch -q main
printf 'again\n' >>docs/shape/architecture.md && git commit -qam "newer rule, not pushed"
git switch -q feature/a
git merge -q --no-edit main
expect "pre-push: a stale origin/main still finds the newest merge-base" 0 sh -c "printf 'refs/heads/feature/a %s refs/heads/feature/a $zeros\n' \$(git rev-parse feature/a) | sh '$hooks/pre-push.sh' origin x"

git switch -q main
expect "pre-push: pushing the writer branch is allowed" 0 sh -c "printf 'refs/heads/main %s refs/heads/main $zeros\n' \$(git rev-parse main) | sh '$hooks/pre-push.sh' origin x"
expect "pre-push: deleting a remote branch is allowed" 0 sh -c "printf '(delete) $zeros refs/heads/feature/a %s\n' \$(git rev-parse main) | sh '$hooks/pre-push.sh' origin x"

# --- agent PreToolUse ---
new_repo agent
top=$(git rev-parse --show-toplevel)
claude_edit() { printf '{"cwd":"%s","tool_name":"Edit","tool_input":{"file_path":"%s","old_string":"a","new_string":"b"}}' "$1" "$2"; }
run_agent() { printf '%s' "$1" | sh "$hooks/agent-pretooluse.sh"; }

expect "agent: main may edit an area file" 0 run_agent "$(claude_edit "$top" "$top/docs/shape/architecture.md")"
git switch -qc feature/b
expect "agent: a branch may not edit an area file" 2 run_agent "$(claude_edit "$top" "$top/docs/shape/architecture.md")"
grep -q 'docs/shape/inbox/feature-b.md' "$work/err" && pass "agent: refusal names the inbox" || fail "agent: refusal names the inbox"
expect "agent: a branch may not edit a title file" 2 run_agent "$(claude_edit "$top" "$top/docs/shape/architecture.enemies.md")"
expect "agent: a branch may not edit ROUTES.md" 2 run_agent "$(claude_edit "$top" "$top/docs/shape/ROUTES.md")"
expect "agent: a relative path resolves against cwd" 2 run_agent "$(claude_edit "$top/docs" "shape/architecture.md")"
expect "agent: a branch may write its inbox" 0 run_agent "$(claude_edit "$top" "$top/docs/shape/inbox/feature-b.md")"
expect "agent: other files are not its business" 0 run_agent "$(claude_edit "$top" "$top/src/a.gd")"
escaped=$(printf '%s' "$top/docs/shape/architecture.md" | sed 's#/#\\\\#g')
expect "agent: JSON-escaped backslash paths are understood" 2 run_agent "$(claude_edit "$top" "$escaped")"
quoted='{"cwd":"'"$top"'","tool_name":"Edit","tool_input":{"file_path":"'"$top"'/src/a.gd","old_string":"a","new_string":"\"file_path\": \"docs/shape/architecture.md\""}}'
expect "agent: a key inside another string is ignored" 0 run_agent "$quoted"
patch='{"cwd":"'"$top"'","tool_name":"apply_patch","tool_input":{"command":"*** Begin Patch\n*** Update File: docs/shape/architecture.md\n@@\n-a\n+b\n*** End Patch"}}'
expect "agent: a Codex patch touching an area file is refused" 2 run_agent "$patch"
patch_ok='{"cwd":"'"$top"'","tool_name":"apply_patch","tool_input":{"command":"*** Begin Patch\n*** Add File: docs/shape/inbox/feature-b.md\n+x\n*** End Patch"}}'
expect "agent: a Codex patch writing the inbox is allowed" 0 run_agent "$patch_ok"

# --- SessionStart ---
git switch -q main
mkdir -p docs/shape/inbox && printf 'x\n' >docs/shape/inbox/feature-b.md
expect "session-start: runs" 0 sh "$hooks/session-start.sh"
grep -q '1 inbox file' "$work/out" && pass "session-start: counts inbox files on the writer branch" || fail "session-start: counts inbox files on the writer branch"

# --- routes check ---
new_repo routes
expect "routes: no ROUTES.md, nothing to check" 0 sh "$hooks/routes-check.sh"
mkdir -p src/ui src/enemies
printf 'x\n' >src/ui/hud.gd
printf 'x\n' >src/enemies/bat.gd
printf '# Routes\n\nRouted: `src/*/`\n\n- `src/ui/`: HUD.\n- `src/enemies`: enemies.\n' >docs/shape/ROUTES.md
expect "routes: every routed directory has a row" 0 sh "$hooks/routes-check.sh"
mkdir -p src/net && printf 'x\n' >src/net/sync.gd
expect "routes: a routed directory without a row is stale" 1 sh "$hooks/routes-check.sh"
grep -q 'src/net/: routed, but has no row' "$work/err" && pass "routes: refusal names the directory" || fail "routes: refusal names the directory"
mkdir -p docs/shape/inbox
printf -- '- 2026-10-03 · routes · route · `src/net/`: multiplayer sync.\n' >docs/shape/inbox/feature-net.md
expect "routes: an inbox route line covers the new directory" 0 sh "$hooks/routes-check.sh"
rm -rf src/ui
expect "routes: a row whose path is gone is stale" 1 sh "$hooks/routes-check.sh"
printf -- '- 2026-10-03 · routes · route · `src/ui/`: gone\n' >>docs/shape/inbox/feature-net.md
expect "routes: an inbox gone line covers the removed directory" 0 sh "$hooks/routes-check.sh"
printf '# Routes\r\n\r\nRouted: `src/*/`\r\n\r\n- `src/enemies/`: enemies.\r\n- `src/net/`: sync.\r\n' >docs/shape/ROUTES.md
rm -rf docs/shape/inbox
expect "routes: CRLF line endings are read" 0 sh "$hooks/routes-check.sh"

cd "$work"
if [ "$failures" -gt 0 ]; then
    printf '%s failure(s)\n' "$failures"
    exit 1
fi
printf 'all hook tests passed\n'
