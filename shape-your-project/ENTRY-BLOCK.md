# Entry block

The project's pointer to its shape: a `## Project shape` block in the agent instructions file, loaded every session, with or without this skill installed. It carries what every session needs (the levels, signals, pending proposals) and lists areas only; rules stay in the area files, read on demand.

## Which file

- The repo is used with both Claude Code and Codex (both files exist, or the user says so) → the block goes in `AGENTS.md`, and `CLAUDE.md` gains an `@AGENTS.md` import line, added beside its existing content, so the block lives in one file.
- Else `CLAUDE.md` exists → edit it.
- Else `AGENTS.md` exists → edit it.
- Neither → ask which tools the user works with, then apply the rules above.

Every line already in either file stays, even where the two files repeat each other; an existing `## Project shape` block is updated in place.

## Template

```markdown
## Project shape

Current standards, one file per area, rules grouped under titles. Before work that touches an area, read its file (once split, its index and the title files your work touches) and raise any Proposed items with the user.
Levels: **exploring** is a bet (follow it, note friction); **provisional** is likely to hold (ask before breaking it); **settled** is proven (enforced).
Add a dated line to the area's Signals when a rule decides part of your change, gets in your way or is broken by code, and when the user corrects you. Decisions that should bind the project go through the `shape-your-project` skill.
Area files change only on `main` (the writer branch); on any other branch, write those lines and any drafts to `docs/shape/inbox/<branch>.md` instead.
Before searching the code, read [Routes](docs/shape/ROUTES.md), and name it in any exploration subagent's prompt, asking for the stale routes it meets. Fix a stale route in place on `main`, or as a `route` line in the inbox.

- [Pillars](docs/shape/pillars.md): <gist>
- [Art direction](docs/shape/art-direction.md): <gist>
```

The Routes line stays only while the project keeps `ROUTES.md`. One line per area, in the order a newcomer should read them. Gists stay under ten words: this block costs context every turn.
