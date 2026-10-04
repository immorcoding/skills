#!/usr/bin/env sh
# shape-your-project routes check (git pre-commit, or CI): every row of docs/shape/ROUTES.md
# names a path that exists, and every directory its Routed line globs has a row. A `route`
# line in any inbox file covers its path, so a branch can record the fix without editing
# ROUTES.md. Checks the working tree. No ROUTES.md, nothing to check.
set -eu
top=$(git rev-parse --show-toplevel) || exit 0
cd "$top"
routes=docs/shape/ROUTES.md
[ -f "$routes" ] || exit 0

# Paths that start a row (- `path/`: ...), from ROUTES.md and from inbox route lines.
row_paths() {
    sed -nE 's#^- `([^`]+)`:.*#\1#p' "$routes" | tr -d '\r'
}
inbox_paths() {
    cat docs/shape/inbox/*.md 2>/dev/null | tr -d '\r' |
        sed -nE 's#^- [^·]*· *routes *· *route *· *`([^`]+)`:.*#\1#p'
}
# Directories with a trailing slash, so `src/ui` and `src/ui/` compare equal.
norm() { sed -E 's#/*$#/#'; }

covered=$( { row_paths; inbox_paths; } | norm | sort -u)
pending=$(inbox_paths | norm | sort -u)
stale=""

for path in $(row_paths); do
    if [ ! -e "$path" ] && ! printf '%s\n' "$pending" | grep -qxF "$(printf '%s' "$path" | norm)"; then
        stale="$stale
  $path: listed, but gone"
    fi
done

globs=$(sed -nE 's#^Routed:(.*)#\1#p' "$routes" | tr -d '\r' | tr -d '`,')
# Unquoted on purpose: the shell expands each glob; one matching nothing stays literal and is skipped.
for dir in $globs; do
    [ -d "$dir" ] || continue
    if ! printf '%s\n' "$covered" | grep -qxF "$(printf '%s' "$dir" | norm)"; then
        stale="$stale
  $dir: routed, but has no row"
    fi
done

if [ -n "$stale" ]; then
    {
        printf 'shape: %s has stale routes:%s\n' "$routes" "$stale"
        printf 'On the writer branch, fix the rows. Elsewhere, add a `route` line per path to the branch inbox in docs/shape/inbox/ (see shape-your-project INBOX.md).\n'
    } >&2
    exit 1
fi
