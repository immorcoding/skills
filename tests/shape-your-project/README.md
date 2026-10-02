# Scenario runs

Tests for `shape-your-project`. A **scenario run** gives a fresh agent the skill, a fixture repo and one prompt, then judges the run by the files it wrote, never by its reasoning.

## Layout

- `fixtures/base/`: Lantern, a tiny Godot roguelike with no shape.
- `fixtures/shaped/`: the same repo with a shape: three areas, an ADR, an entry block in `CLAUDE.md`.
- `scenarios/*.md`: one scenario per file. A scenario's overlay, if any, is the directory beside it with the same name plus `.overlay/`, copied over the fixture.
- `scenarios/<name>.history.sh` (optional, beside the scenario): run inside the prepared repo after the fixture commit, to add history the scenario depends on.
- `prepare.sh <scenario>`: builds a run directory and prints its path.
- `hooks/run.sh`: unit tests for the sample hooks in `shape-your-project/hooks/`; plain `sh`, no agent, run them on every hook change.

## Scenario format

```md
# <name>

Fixture: base | shaped
Human: present | absent

## Prompt
<what the user says>

## Script
<the user's answers to questions the agent may ask; "approve everything else">

## Expect
- [ ] <a check on the written files>
```

## Running one

1. `./prepare.sh scenarios/<name>.md [parent dir]`: copies the fixture and overlay into a fresh `repo/` and commits it, so the run's changes show in `git diff`.
2. Start a fresh subagent with the prompt below, filled in.
3. Judge every Expect line against `git status` and `git diff` in the run directory. A scenario passes when every line holds.

```text
You are an agent working in the repo at <run dir>. Read its CLAUDE.md or AGENTS.md first, if present: they are your project instructions.
The skill `shape-your-project` is installed at <skill path>; to use it, read its SKILL.md and follow it exactly, reading other skill files only when it points you to them. Use it whenever its description or the project instructions call for it:
<the skill's description line>
Never read anything under the tests folder. Act on this user message:

<Prompt>

Human: <present | absent>.
If present: the user's answers are scripted below. Wherever the skill has you ask the user, take the matching scripted answer and continue; anything unscripted is answered "approve". Log each question you asked and the answer you used to <run dir>/../run-log.md.
If absent: nobody can answer you. Do not ask questions; act as the skill directs for unattended runs.

Script:
<Script>

Finish by listing the files you changed.
```

Run scenarios one at a time on a change to the skill; run the whole set once before release.
