# A merge brings a decision that contradicts another area's rule

Fixture: shaped
Human: present

## Prompt

`feature/tres-enemies` was just merged into main. Drain the shape inbox.

## Script

- When asked which of two rules stands: the decision does.

## Expect

- [ ] `docs/shape/inbox/` holds no file
- [ ] `coding-style.md` holds the decision as a rule, with id STYLE-2
- [ ] The agent asked which rule stands before it retired either
- [ ] ARCH-1 is gone from `architecture.md`, and the `enemies` title with it
- [ ] `architecture.md` still reads `Next id: ARCH-5`
- [ ] `run-log.md` shows the agent read `architecture.md` because the merge changed `src/enemies/`, which routes to ARCH-1
