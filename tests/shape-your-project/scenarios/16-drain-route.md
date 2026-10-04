# Drain writes a route line without asking

Fixture: shaped
Human: present

## Prompt

`feature/net` was just merged into main. Drain the shape inbox.

## Script

- Approve everything.

## Expect

- [ ] `docs/shape/ROUTES.md` has a row for `src/net/` naming `sync.gd`
- [ ] `docs/shape/inbox/` holds no file
- [ ] No area file under `docs/shape/` changed, and none gained a Next id or Signals line about routes
- [ ] `run-log.md` holds no question about the route
