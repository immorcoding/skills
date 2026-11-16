# Off the writer branch, a moved link's fix goes to the inbox

Fixture: shaped
Human: present

## Prompt

Rename `src/enemies/` to `src/mobs/`, then make sure nothing in the repo, docs included, still points at the old path.

## Script

- Approve everything.

## Expect

- [ ] `src/mobs/bat.gd` exists and `src/enemies/` does not
- [ ] `docs/shape/architecture.md` is unchanged, and still links `../../src/enemies/bat.gd`
- [ ] No other area file under `docs/shape/` changed
- [ ] `docs/shape/inbox/feature-mobs.md` holds a `link` line for `architecture` (or `architecture/enemies`) that names `src/enemies/bat.gd` and `src/mobs/bat.gd`
- [ ] `run-log.md` holds no question about the link
