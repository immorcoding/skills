# Adopt sorts a mixed glossary into its homes

Fixture: shaped
Human: present

## Prompt

Adopt our CONTEXT.md glossary into the shape.

## Script

- Whether to keep a routing table: "Yes, route `src/*/`."
- Approve everything else.

## Expect

- [ ] `run-log.md` shows one classification table (entry · class · destination) asked before any file was written
- [ ] `CONTEXT.md` still exists under that name and keeps Oil and Shrine as terms, each one or two sentences
- [ ] `docs/shape/ROUTES.md` exists with `Routed:` covering `src/*/` and a row for `src/ui/`
- [ ] The HUD boundary is not a new rule: its routes row cites ARCH-2, which already states it, and no rule in `architecture.md` restates ARCH-2
- [ ] The Save module's "only code that touches save files" boundary is a rule (new, or cited if one already states it)
- [ ] The save file format sits in a doc outside `CONTEXT.md`, linked from a routes row or from ARCH-3
- [ ] The charter line was kept, replaced or dropped, and `run-log.md` shows the user was asked about it
