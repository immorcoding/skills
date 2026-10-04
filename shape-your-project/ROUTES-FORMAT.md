# Routes format

`docs/shape/ROUTES.md` is the project's optional **routing table**: one row per directory saying what lives there and where to read next, so a session, or an exploration subagent that never sees the agent instructions file, finds the right code and docs before searching. It sits beside the area and title files but is not one: no Next id, levels, Signals or Proposed.

## Template

```md
# Routes

Where the code lives, and what to read before changing it.

Routed: `src/*/`, `addons/*/`

- `src/enemies/`: enemy behaviours, one script per enemy. Entry: `bat.gd`. Areas: [Architecture](architecture.md)
- `src/save/`: save files and their migrations. Entry: `save.gd`. Rules: ARCH-3 · [ADR-0001](../adr/0001-versioned-saves.md)
- `src/ui/`: HUD and menus, display only. Areas: [Coding style · ui](coding-style.ui.md) · Rules: ARCH-2
```

## Rules

- **Routed** names, as globs, the directories that each need a row. Its depth follows the project's scale: a top level that reads at a glance needs no table; a few modules route `src/*/`; a multi-package repo routes each package and lets the package keep its own table. The hook checks rows against it.
- **One row per routed directory**: `` `path/`: `` what lives there, then what `ls` cannot show: the entry point and what to read before changing it (areas, or the title files of a split area; rule ids, ADRs, the module's README, its glossary). Name a domain glossary by the file the repo already uses (`docs/agents/domain.md` names it; else the `GLOSSARY.md` or `CONTEXT.md` at the root or in the module).
- **Rows describe; rules decide.** A boundary ("game logic lives outside `src/ui`") is a rule in an area file, and the row cites its id. So a row is a fact the tree can confirm, and a stale one never blocks work.

## Keeping it current

A **stale route** is a row whose path is gone, a row that misdescribes its directory, or a routed directory with no row. Whoever meets one fixes it:

- on the writer branch, edit the row directly, without asking: the tree is the approval;
- on any other branch, add a `route` line to the branch's inbox ([INBOX.md](INBOX.md));
- a read-only subagent names the stale route in its report, and the session that dispatched it writes the line.
