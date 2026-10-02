# Setup in a repo used by Claude Code and Codex

Fixture: base
Human: present

## Prompt

Set up this project's shape. I use both Claude Code and Codex here.

## Script

- What the project is: "A 2D roguelike in Godot, early prototype."
- Areas: "Architecture and coding style."
- Recommended answers: accept every recommendation.

## Expect

- [ ] `AGENTS.md` holds the `## Project shape` block
- [ ] `CLAUDE.md` imports it with an `@AGENTS.md` line and holds no second copy of the block
- [ ] The block defines exploring, provisional and settled in one line
- [ ] The block tells agents to notice decisions that should bind the project
- [ ] The original contents of both files are kept
