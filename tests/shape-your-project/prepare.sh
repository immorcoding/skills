#!/usr/bin/env sh
# Build a run directory for one scenario: fixture + overlay, committed,
# then the scenario's history script, if any, for commits the run should see.
# Usage: prepare.sh scenarios/<name>.md [parent dir]
set -eu
here=$(cd "$(dirname "$0")" && pwd)
case $1 in /*|?:/*) scenario=$1 ;; *) scenario="$here/${1#./}" ;; esac
parent=${2:-$(mktemp -d)}
fixture=$(sed -n 's/^Fixture: *//p' "$scenario" | tr -d '\r')
[ -n "$fixture" ] && [ -d "$here/fixtures/$fixture" ] || { echo "no valid Fixture: line in $scenario" >&2; exit 1; }
run="$parent/repo"
rm -rf "$run" "$parent/run-log.md"
mkdir -p "$run"
cp -r "$here/fixtures/$fixture/." "$run/"
overlay="${scenario%.md}.overlay"
if [ -d "$overlay" ]; then cp -r "$overlay/." "$run/"; fi
git -C "$run" init -q
git -C "$run" config core.autocrlf false
git -C "$run" config user.name fixture
git -C "$run" config user.email fixture@example.com
git -C "$run" add -A
git -C "$run" commit -qm fixture
history="${scenario%.md}.history.sh"
if [ -f "$history" ]; then (cd "$run" && sh "$history"); fi
echo "$run"
