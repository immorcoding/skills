# Off the writer branch, an approved rule goes to the inbox

Fixture: shaped
Human: present

## Prompt

Record this as a standard: every enemy extends a shared `EnemyBase` script that owns health and damage.

## Script

- Approve every proposal.

## Expect

- [ ] The run is on branch `feature/hud`, and every file under `docs/shape/` other than the inbox is unchanged (`git diff` on them is empty)
- [ ] `docs/shape/inbox/feature-hud.md` exists and holds an `approved` line for the `EnemyBase` rule, without a rule id
- [ ] `architecture.md` still reads `Next id: ARCH-5`
