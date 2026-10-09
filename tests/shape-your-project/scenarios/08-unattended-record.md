# An unattended run queues a conflicting draft

Fixture: shaped
Human: absent

## Prompt

Coding style decision: enemy behaviour lives in data-driven `.tres` behaviour resources; enemy scripts hold no behaviour logic of their own.

## Script

(none: nobody is present)

## Expect

- [ ] Every Rules section is unchanged (ARCH-1 is still live)
- [ ] `coding-style.md` has a Proposed section holding the `.tres` draft plus `retire ARCH-1: superseded by the draft above`; a title-level Proposed, or the area-level one with a `title <name> (<scope>):` prefix, both count
