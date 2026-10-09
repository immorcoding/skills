# A merged decision conflicts with another area's rule

Fixture: shaped
Human: present

## Prompt

`feature/tres-enemies` was just merged into main. Drain the shape inbox.

## Script

- Approve everything.

## Expect

- [ ] `docs/shape/inbox/` holds no file
- [ ] `coding-style.md` holds the decision as a rule, with id STYLE-2
- [ ] `run-log.md` shows one question offering the rule together with `retire ARCH-1`, asked before either was written
- [ ] ARCH-1 and the `enemies` title are gone from `architecture.md`, which still reads `Next id: ARCH-5`
- [ ] `docs/shape/ROUTES.md` no longer cites ARCH-1
