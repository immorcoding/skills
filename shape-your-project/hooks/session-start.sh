#!/usr/bin/env sh
# shape-your-project SessionStart hook: on the writer branch, say how many inbox files
# wait to be drained. Both Claude Code and Codex inject its stdout as context.
. "$(dirname "$0")/shape-lib.sh"

top=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
cd "$top" || exit 0
branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || exit 0
[ "$branch" = "$(shape_writer_branch)" ] || exit 0

count=$(ls docs/shape/inbox/*.md 2>/dev/null | wc -l | tr -d ' ')
if [ "$count" -gt 0 ]; then
    printf 'shape: %s inbox file(s) in docs/shape/inbox/ wait to be drained (shape-your-project, drain mode).\n' "$count"
fi
exit 0
