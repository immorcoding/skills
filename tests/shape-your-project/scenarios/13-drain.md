# Draining an inbox on the writer branch

Fixture: shaped
Human: present

## Prompt

`feature/hud` was just merged into main. Drain the shape inbox.

## Script

- The `proposed` draft about HUD colours: "Decline it."
- ART-1's approved example: `art/approved/bat_idle.png`.
- Approve everything else.

## Expect

- [ ] `docs/shape/inbox/feature-hud.md` is gone, and `docs/shape/inbox/` holds no file
- [ ] `architecture.md` has an ARCH-5 rule saying enemies extend `EnemyBase`, and reads `Next id: ARCH-6`
- [ ] `coding-style.md` Signals holds the STYLE-1 cite line from the inbox
- [ ] ART-1 is settled, with a `_Check:_` naming asset review
- [ ] The HUD colour draft appears in no file under `docs/shape/`
- [ ] `coding-style.md` has a STYLE-2 rule saying signals are named in the past tense, and reads `Next id: STYLE-3`
- [ ] Both past-tense correction signals are gone from every file under `docs/shape/`
