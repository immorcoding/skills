# Drain applies a confirmed link line without asking

Fixture: shaped
Human: present

## Prompt

`feature/mobs` was just merged into main. Drain the shape inbox.

## Script

- If asked about the link to the deleted palette notes: "Make it plain text."
- Approve everything else.

## Expect

- [ ] `architecture.md` ARCH-1 links `../../src/mobs/bat.gd`, and no `src/enemies` is left in the file
- [ ] `run-log.md` holds no question about the `bat.gd` link
- [ ] `art-direction.md` ART-2 no longer links `palette-notes.md`: "palette notes" stays as plain text, and the rest of the rule is unchanged
- [ ] `docs/shape/inbox/` holds no file
- [ ] In the area files, `git diff` shows only those two link edits: both `Next id` lines are unchanged, and no rule, Signals line or Proposed item was added or removed
