# Setup on a fresh repo

Fixture: base
Human: present

## Prompt

Set up this project's shape.

## Script

- What the project is: "A 2D roguelike in Godot, early prototype."
- Areas: "Architecture, coding style and art direction."
- Which tools the user works with: "Claude Code only."
- Recommended answers: accept every recommendation.

## Expect

- [ ] `docs/shape/` holds one file per chosen area: architecture, coding style, art direction
- [ ] Every rule line has the form id · level · rule · _Why:_
- [ ] Rule ids use one prefix per area, starting at 1
- [ ] `CLAUDE.md` exists with a `## Project shape` block listing all three areas, one line each
- [ ] No files outside `docs/shape/` and `CLAUDE.md` changed
