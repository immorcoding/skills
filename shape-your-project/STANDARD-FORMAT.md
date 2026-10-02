# Standard format

One file per area: `docs/shape/<area>.md`. Omit empty sections.

## Template

```md
# Art direction

{One line: what this area governs.}

Next id: ART-4

## Pillars

- Readable at a glance: silhouette before detail.
- Warm world, cold threats.

## Rules

- **ART-1** · settled · Sprites are 32×32 on a 16px grid. _Why:_ reads at 1080p, cheap to produce. _Source:_ [ADR-0003](../adr/0003-pixel-scale.md) _Check:_ asset review against References.
- **ART-2** · exploring · Limit the palette to 32 colours from `art/reference/palette.png`. _Why:_ keeps the world cohesive.

## References

- `art/reference/palette.png`: master palette (ART-2)
- `art/approved/bat_idle.png`: approved at the vertical slice (ART-1)

## Open questions

- Lighting: baked or dynamic? Waits on the performance budget.

## Proposed

- 2026-10-02 · exploring · Night levels use a separate 16-colour palette. _Why:_ the main palette reads too dark. (queued: unattended run)

## Signals

- 2026-10-01 · friction · ART-2 · Night levels look muddy within 32 colours.
- 2026-10-02 · cite · ART-1 · Spider sprite drawn at 32×32.

## Rejected

- Hand-drawn HD sprites: tried in prototype, too slow to produce at our scope. (was ART-3)
```

## Rules

- **One line per rule**: id · level · the rule · _Why:_ one line · _Source:_ optional link (ADR, ticket, commit, external doc) · _Check:_ the enforcement, once settled.
- **State the target**: "Sprites are 32×32", not "Don't use other sizes".
- **Next id** is the id the next rule takes. Take it, then bump it; it only ever rises, so a retired id stays retired. A file without the line gets one: one past the highest id in the file, in Rejected, or in the file's git history.
- **Pillars** are 3–5 lines of intent that settle ties the rules don't cover.
- **References** carry what prose can't: images, example files, approved assets. Visual areas lean on references over rules.
- **Proposed** holds drafts awaiting the user, each with why it was queued: a new rule is a rule line without an id; a retirement is `retire <id>: <reason>`. An approved rule takes the next id; an approved retirement goes through retire; a declined draft is deleted.
- **Signals** are evidence for later sessions: date · kind · rule id or `new` · one-line note. The kinds:
  - **cite**: a rule decided part of a change;
  - **friction**: a rule got in the way;
  - **contradiction**: code breaks a rule;
  - **correction**: the user corrected the agent.

  A signal is removed once a rule, a review verdict or a retirement acts on it.
