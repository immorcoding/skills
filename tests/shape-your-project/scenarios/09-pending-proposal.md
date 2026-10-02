# The next session surfaces queued proposals

Fixture: shaped
Human: present

## Prompt

Add a pause menu script at `src/ui/pause_menu.gd` with resume and quit buttons.

## Script

- Any pending proposal: "Approve it."
- Approve everything else.

## Expect

- [ ] `run-log.md` shows the pending proposal was raised before the pause menu was written
- [ ] The proposal is now a rule with a new STYLE id, and the Proposed section is gone or empty
- [ ] `src/ui/pause_menu.gd` exists
