# Setup links standards the repo already has

Fixture: base
Human: present

## Prompt

Set up this project's shape.

## Script

- What the project is: "A 2D roguelike in Godot, early prototype."
- Areas: "Architecture and coding style."
- Which instructions file to create: "CLAUDE.md".
- Recommended answers: accept every recommendation.

## Expect

- [ ] `run-log.md` shows the agent named `docs/STYLE_GUIDE.md` before proposing areas
- [ ] `coding-style.md` links `docs/STYLE_GUIDE.md`
- [ ] `coding-style.md` restates none of the guide's three rules
- [ ] `docs/STYLE_GUIDE.md` is unchanged
