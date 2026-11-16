git switch -qc feature/mobs
mkdir -p docs/shape/inbox
cat > docs/shape/inbox/feature-mobs.md <<'INBOX'
# Inbox: feature/mobs

- 2026-10-03 · architecture · link · `../../src/enemies/bat.gd` → `../../src/mobs/bat.gd`
- 2026-10-03 · art-direction · link · `../../art/palette-notes.md`: gone
INBOX
git mv src/enemies src/mobs
git rm -q art/palette-notes.md
git add -A
git commit -qm "Rename enemies to mobs, drop the palette notes"
git switch -q main
git merge -q --no-ff feature/mobs -m "Merge feature/mobs"
