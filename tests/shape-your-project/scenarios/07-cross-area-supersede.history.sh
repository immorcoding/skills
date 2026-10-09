git switch -qc feature/tres-enemies
mkdir -p docs/shape/inbox
cat > docs/shape/inbox/feature-tres-enemies.md <<'EOF'
# Inbox: feature/tres-enemies

- 2026-10-06 · coding-style · approved · provisional · Enemy behaviour lives in data-driven `.tres` behaviour resources; enemy scripts hold no behaviour logic of their own.
EOF
echo '# Behaviour is read from bat_behaviour.tres.' >> src/enemies/bat.gd
git add -A
git commit -qm "Move bat behaviour into a .tres resource"
git switch -q main
git merge -q --no-ff feature/tres-enemies -m "Merge feature/tres-enemies"
