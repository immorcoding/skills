#!/usr/bin/env sh
# shape-your-project pre-push: a branch pushed anywhere but the writer branch may not
# change area files. Only the branch's own changes count: the diff runs from its
# merge-base with the writer branch, so merging the writer branch in is never flagged.
# Git calls it as: pre-push <remote name> <remote url>, with ref lines on stdin.
set -eu
. "$(dirname "$0")/shape-lib.sh"

remote=${1:-origin}
writer=$(shape_writer_branch)
status=0

while read -r local_ref local_sha remote_ref remote_sha; do
    case $remote_ref in refs/heads/*) ;; *) continue ;; esac
    case $local_sha in *[!0]*) ;; *) continue ;; esac   # deleting a remote branch
    target=${remote_ref#refs/heads/}
    if [ "$target" = "$writer" ]; then
        continue
    fi

    # Diff from the newest merge-base, local or remote writer branch, so a stale
    # remote-tracking ref never makes merged writer-branch work look like the branch's.
    base=""
    for ref in "refs/remotes/$remote/$writer" "refs/heads/$writer"; do
        git rev-parse -q --verify "$ref" >/dev/null || continue
        candidate=$(git merge-base "$ref" "$local_sha" 2>/dev/null) || continue
        if [ -z "$base" ] || git merge-base --is-ancestor "$base" "$candidate"; then
            base=$candidate
        fi
    done
    if [ -z "$base" ]; then
        continue
    fi

    bad=$(git diff --name-only --no-renames "$base" "$local_sha" | shape_area_files)
    if [ -n "$bad" ]; then
        shape_refuse "$target" "$bad"
        status=1
    fi
done

exit $status
