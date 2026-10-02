#!/usr/bin/env sh
# shape-your-project PreToolUse hook for Claude Code (Edit, Write, MultiEdit, NotebookEdit)
# and Codex (apply_patch). Off the writer branch it refuses edits to area files and
# names the inbox to write instead. Refusal is exit 2 with the reason on stderr, which
# both tools honour. On any failure of its own it allows: the git hooks still guard.
. "$(dirname "$0")/shape-lib.sh"

input=$(cat)

# One top-level JSON string field, unescaped just enough for paths (\\ and \/ become /).
# An escaped "key" inside another string (\"file_path\") never matches.
json_field() {
    printf '%s' "$input" | tr -d '\r\n' |
        sed -nE "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"(([^\"\\\\]|\\\\.)*)\".*/\1/p" |
        sed 's#\\\\#/#g; s#\\/#/#g'
}

# Git Bash spells E:/x as /e/x.
drive_path() {
    printf '%s' "$1" | sed -E 's#^/([a-zA-Z])/#\1:/#'
}

cwd=$(drive_path "$(json_field cwd)")
[ -n "$cwd" ] || cwd=.

top=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null) || exit 0
branch=$(git -C "$cwd" symbolic-ref --quiet --short HEAD 2>/dev/null) || exit 0
writer=$(cd "$top" && shape_writer_branch)
[ "$branch" = "$writer" ] && exit 0

# Paths: Claude's file_path or notebook_path; else the file headers of a Codex patch.
paths=$(json_field file_path; json_field notebook_path)
if [ -z "$paths" ]; then
    paths=$(printf '%s' "$input" | awk '{ gsub(/\\n/, "\n"); print }' |
        sed -nE 's/^\*\*\* (Add File|Update File|Delete File|Move to): (.*)$/\2/p')
fi

lower() { printf '%s' "$1" | tr 'A-Z' 'a-z'; }
top_lower=$(lower "$top")
bad=$(printf '%s\n' "$paths" | while IFS= read -r path; do
    [ -n "$path" ] || continue
    path=$(drive_path "$path")
    case $path in
        /* | [a-zA-Z]:/*) ;;
        *) path="$cwd/$path" ;;
    esac
    # Windows paths differ in case only; compare lowered, cut by length.
    case $(lower "$path") in
        "$top_lower"/*) ;;
        *) continue ;;
    esac
    printf '%s\n' "$path" | cut -c"$((${#top} + 2))"- | sed 's#^\./##'
done | shape_area_files)

if [ -n "$bad" ]; then
    (cd "$top" && shape_refuse "$branch" "$bad")
    exit 2
fi
exit 0
