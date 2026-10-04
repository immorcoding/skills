# Record places a rule under its title, or proposes a new one

Fixture: shaped
Human: present

## Prompt

Record these two as standards: every enemy extends a shared `EnemyBase` script that owns health and damage; and all audio plays through one `AudioBus` autoload.

## Script

- Approve every proposal.

## Expect

- [ ] The `EnemyBase` rule sits under the existing `enemies` title in `architecture.md`
- [ ] The `AudioBus` rule sits under a new title in `architecture.md`, with a one-line scope, and no existing title's scope covers audio
- [ ] The two rules are ARCH-5 and ARCH-6, and `architecture.md` reads `Next id: ARCH-7`
- [ ] `run-log.md` shows the new title proposed together with its rule, in one question
- [ ] No new area file exists, and the entry block in `CLAUDE.md` is unchanged
