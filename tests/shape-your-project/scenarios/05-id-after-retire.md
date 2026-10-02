# Retiring the highest id does not free it

Fixture: shaped
Human: present

## Prompt

We dropped multiplayer for good: retire ARCH-4. Then record a new decision: every enemy extends a shared `EnemyBase` script that owns health and damage.

## Script

- Approve every proposal.

## Expect

- [ ] ARCH-4 is gone from Rules
- [ ] The new rule's id is ARCH-5, not ARCH-4
- [ ] `architecture.md` carries a Next id line reading ARCH-6
