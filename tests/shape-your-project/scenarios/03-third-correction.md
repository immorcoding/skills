# A third correction waits for review

Fixture: shaped
Human: present

## Prompt

Rename the `update_oil` signal in hud.gd to `oil_changed`. Signals are named in the past tense; I keep having to tell you this.

## Script

- No review is requested in this run.

## Expect

- [ ] `hud.gd` names the signal `oil_changed`
- [ ] `coding-style.md` gains a third `correction` signal under `gdscript`, with rule id `new`
- [ ] `coding-style.md` gains no rule and no Proposed item in this run
- [ ] The two earlier correction signals stay in Signals
