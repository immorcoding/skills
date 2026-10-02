# Shared by the shape-your-project hooks. Source it; do not run it.

# The one branch whose commits may change area files.
shape_writer_branch() {
    configured=$(git config --get shape.writerBranch 2>/dev/null || true)
    if [ -n "$configured" ]; then
        printf '%s\n' "$configured"
        return
    fi
    remote_head=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || true)
    if [ -n "$remote_head" ]; then
        printf '%s\n' "${remote_head#origin/}"
        return
    fi
    printf 'main\n'
}

# Filter repo-relative paths on stdin down to area files: docs/shape/*.md, inbox excluded.
shape_area_files() {
    grep -E '^docs/shape/[^/]+\.md$' || true
}

# The inbox path for a branch: docs/shape/inbox/<branch>.md, with / turned into -.
shape_inbox_path() {
    printf 'docs/shape/inbox/%s.md\n' "$(printf '%s' "$1" | tr '/' '-')"
}

# Explain a refusal on stderr. $1: branch, $2: offending paths, one per line.
shape_refuse() {
    {
        printf 'shape: area files change only on %s, and this is %s:\n' "$(shape_writer_branch)" "$1"
        printf '%s\n' "$2" | sed 's/^/  /'
        printf 'Write signals and drafts to %s instead; they are drained on %s after the merge.\n' \
            "$(shape_inbox_path "$1")" "$(shape_writer_branch)"
    } >&2
}
