# Off the writer branch, a new directory's route goes to the inbox

Fixture: shaped
Human: present

## Prompt

Add a stub for multiplayer sync in a new `src/net/` folder: one `sync.gd` that extends Node and does nothing yet.

## Script

- Approve everything.

## Expect

- [ ] `src/net/sync.gd` exists
- [ ] `docs/shape/ROUTES.md` is unchanged
- [ ] `docs/shape/inbox/feature-net.md` holds a `routes · route` line for `src/net/`
- [ ] `run-log.md` holds no question about the route
