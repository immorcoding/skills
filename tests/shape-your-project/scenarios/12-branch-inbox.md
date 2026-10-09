# Off the writer branch, an approved rule goes to the inbox

Fixture: shaped
Human: present

## Prompt

Record this as a standard: every enemy extends a shared `EnemyBase` script that owns health and damage. Also, the bat sprites are approved: settle ART-1.

## Script

- ART-1's approved example: `art/approved/bat_idle.png`.
- Approve every proposal.

## Expect

- [ ] The run is on branch `feature/hud`, and every file under `docs/shape/` other than the inbox is unchanged (`git diff` on them is empty)
- [ ] `docs/shape/inbox/feature-hud.md` exists and holds an `approved` line for the `EnemyBase` rule, without a rule id
- [ ] The inbox holds `approved · level ART-1 settled`
- [ ] `architecture.md` still reads `Next id: ARCH-5`
