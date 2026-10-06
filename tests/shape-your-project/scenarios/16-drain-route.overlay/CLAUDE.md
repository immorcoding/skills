# Lantern

## Project shape

Current standards, one file per area, rules grouped under titles. Before planning, specifying or changing anything that touches an area, read its file (once split, its index and the title files involved), hand those files to any subagent you start, and raise any Proposed items with the user.
Levels: **exploring** is a bet (follow it, note friction); **provisional** is likely to hold (ask before breaking it); **settled** is proven (enforced).
Add a dated line to the area's Signals when a rule decides part of your change, gets in your way or is broken by code, and when the user corrects you; subagents report these, and you write them. Decisions that should bind the project go through the `shape-your-project` skill: at the end of a grill, wayfinder session or retro, gather them, with repeated corrections, and take them through together.
Area files change only on `main` (the writer branch); on any other branch, write those lines and any drafts to `docs/shape/inbox/<branch>.md` instead. Right after a merge brings an inbox to `main`, drain it through the skill.
Before searching the code, read [Routes](docs/shape/ROUTES.md), and name it in any exploration subagent's prompt, asking for the stale routes it meets. Fix a stale route in place on `main`, or as a `route` line in the inbox.

- [Architecture](docs/shape/architecture.md): code structure and boundaries
- [Coding style](docs/shape/coding-style.md): GDScript conventions
- [Art direction](docs/shape/art-direction.md): pixel scale and palette
