#!/usr/bin/env sh
# shape-your-project pre-commit: off the writer branch, the index may not change area files.
set -eu
. "$(dirname "$0")/shape-lib.sh"

# A merge commit brings the writer branch's own changes; pre-push judges merges.
if git rev-parse -q --verify MERGE_HEAD >/dev/null; then
    exit 0
fi
branch=$(git symbolic-ref --quiet --short HEAD) || exit 0
if [ "$branch" = "$(shape_writer_branch)" ]; then
    exit 0
fi

bad=$(git diff --cached --name-only --no-renames | shape_area_files)
if [ -n "$bad" ]; then
    shape_refuse "$branch" "$bad"
    exit 1
fi
