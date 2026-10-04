# Hooks

Samples that make the **writer branch** mechanical: off it, area files (`docs/shape/*.md`) cannot change, and every refusal names the branch's inbox. They are POSIX `sh` plus `git`, nothing else; Git for Windows ships `sh`.

| File | Hook | Refuses |
|---|---|---|
| `pre-commit.sh` | git `pre-commit` | staged area files off the writer branch; skips merge commits, which pre-push judges |
| `pre-push.sh` | git `pre-push` | a branch pushed anywhere but the writer branch whose own changes (from its merge-base with the writer branch) touch area files |
| `agent-pretooluse.sh` | Claude Code and Codex `PreToolUse` | an agent edit to an area file off the writer branch |
| `session-start.sh` | Claude Code and Codex `SessionStart` | nothing: on the writer branch, says how many inbox files wait to be drained |
| `routes-check.sh` | git `pre-commit`, or CI | a stale route in `docs/shape/ROUTES.md`: a row whose path is gone, or a routed directory with no row, unless an inbox `route` line covers it. Wire it only when the project keeps `ROUTES.md` |

`ROUTES.md` counts as an area file here, so off the writer branch it changes only through the inbox. The first four source `shape-lib.sh`, so copy the folder whole, e.g. to `scripts/shape-hooks/`. The writer branch is `git config shape.writerBranch`, else the branch `origin/HEAD` points at, else `main`.

## Wiring

Add the hooks to whatever the project already runs; never replace an existing hook.

- **No hook manager**: call them from `.git/hooks/pre-commit` (`routes-check.sh` too, after `pre-commit.sh`) and `.git/hooks/pre-push` (or the folder `core.hooksPath` names), passing pre-push its arguments and stdin: `sh scripts/shape-hooks/pre-push.sh "$@"`.
- **husky, lefthook, pre-commit**: add one command per hook in its config, same invocation.
- **Claude Code** (`.claude/settings.json`):

  ```json
  {
    "hooks": {
      "PreToolUse": [{ "matcher": "Edit|Write|MultiEdit|NotebookEdit",
        "hooks": [{ "type": "command", "command": "sh \"$CLAUDE_PROJECT_DIR/scripts/shape-hooks/agent-pretooluse.sh\"" }] }],
      "SessionStart": [{ "hooks": [{ "type": "command", "command": "sh \"$CLAUDE_PROJECT_DIR/scripts/shape-hooks/session-start.sh\"" }] }]
    }
  }
  ```

- **Codex** (`.codex/hooks.json`): the same two entries with matcher `Edit|Write`, which Codex maps to `apply_patch`; run the script from the repo root (`git rev-parse --show-toplevel`). On Windows, Codex runs commands through `cmd`, so call Git's `sh.exe` by full path or put Git's `usr/bin` on `PATH`.

The agent hook refuses with exit code 2 and the reason on stderr, which both tools honour, and allows on any failure of its own: the git hooks are the backstop.

## Tests

`sh tests/shape-your-project/hooks/run.sh` from the repo root builds throwaway repos and checks every row above, including a branch that merged the writer branch in and a stale `origin` ref.
