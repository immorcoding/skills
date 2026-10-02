mkdir -p src/net
printf 'extends Node\n' > src/net/sync.gd
git add -A && git commit -qm "feat: add multiplayer sync"
git rm -rq src/net && git commit -qm "chore: drop multiplayer"
