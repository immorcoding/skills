# Standard format

One file per area: `docs/shape/<area>.md`. Omit empty sections.

## Template

```md
# Art direction

{One line: what this area governs.}

## Pillars

- Readable at a glance: silhouette before detail.
- Warm world, cold threats.

## Rules

- **ART-1** · settled · Sprites are 32×32 on a 16px grid. _Why:_ reads at 1080p, cheap to produce. _Source:_ [ADR-0003](../adr/0003-pixel-scale.md)
- **ART-2** · exploring · Limit the palette to 32 colours from `art/reference/palette.png`. _Why:_ keeps the world cohesive.

## References

- `art/reference/palette.png`: master palette (ART-2)
- `art/approved/`: assets approved at the vertical slice; new assets match these.

## Open questions

- Lighting: baked or dynamic? Waits on the performance budget.

## Rejected

- Hand-drawn HD sprites: tried in prototype, too slow to produce at our scope. (was ART-4)
```

## Rules

- **One line per rule**: id · level · the rule · _Why:_ one line · _Source:_ optional link (ADR, ticket, commit, external doc).
- **State the target**: "Sprites are 32×32", not "Don't use other sizes".
- **Ids are permanent**: `<AREA>-<n>`, incrementing per area; a retired id stays retired.
- **Pillars** are 3–5 lines of intent that settle ties the rules don't cover.
- **References** carry what prose can't: images, example files, approved assets. Visual areas lean on references over rules.
