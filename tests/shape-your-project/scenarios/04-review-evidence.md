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
- [ ] ARCH-3, ART-1 and ART-2 are still rules: their subjects exist or are not yet built, so they were asked about, not retired
- [ ] `run-log.md` shows a question about every silent rule
- [ ] The cite signals for ARCH-1 are gone from Signals
- [ ] `run-log.md` holds a verdict table sorting rules as active, silent or dead
