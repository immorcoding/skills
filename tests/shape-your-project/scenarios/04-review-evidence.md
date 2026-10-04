# Review sorts rules by evidence

Fixture: shaped
Human: present

## Prompt

Review the project's shape. We just finished the vertical slice.

## Script

- Any question about whether to keep a rule: "Keep it."
- Approve everything else.

## Expect

- [ ] ARCH-4 is retired: its subject (`src/net`) was deleted in history
- [ ] ARCH-3, ART-1 and ART-2 are still rules: ARCH-3's subject exists (active), and ART-1 and ART-2 are not yet built, so they were asked about, not retired
- [ ] `run-log.md` shows a question about every silent rule
- [ ] The cite signals for ARCH-1 are gone from Signals
- [ ] `run-log.md` holds a verdict table sorting rules as active, silent or dead
- [ ] No `<area>.<title>.md` file exists: no area holds more than 15 rules
