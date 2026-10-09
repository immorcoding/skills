# Standard format

One file per area: `docs/shape/<area>.md`. Inside it, every rule sits under a **title**, a named slice of the area with a one-line scope. Omit empty sections.

## Template

```md
# Art direction

{One line: what this area governs.}

Next id: ART-4

## Pillars

- Readable at a glance: silhouette before detail.
- Warm world, cold threats.

## Open questions

- Lighting: baked or dynamic? Waits on the performance budget.

## sprites

Sprite size, grid and animation.

### Rules

- **ART-1** · settled · Sprites are 32×32 on a 16px grid. _Why:_ reads at 1080p, cheap to produce. _Source:_ [ADR-0003](../adr/0003-pixel-scale.md) _Check:_ asset review against References.

### References

- `art/approved/bat_idle.png`: approved at the vertical slice (ART-1)

### Signals

- 2026-10-02 · cite · ART-1 · Spider sprite drawn at 32×32.

### Rejected

- Hand-drawn HD sprites: tried in prototype, too slow to produce at our scope. (was ART-3)

## palette

Colours and the palette files they come from.

### Rules

- **ART-2** · exploring · Limit the palette to 32 colours from `art/reference/palette.png`. _Why:_ keeps the world cohesive.

### References

- `art/reference/palette.png`: master palette (ART-2)

### Proposed

- 2026-10-02 · exploring · Night levels use a separate 16-colour palette. _Why:_ the main palette reads too dark. (queued: unattended run)

### Signals

- 2026-10-01 · friction · ART-2 · Night levels look muddy within 32 colours.
```

## Titles

- **Name**: short, lowercase letters, digits and hyphens (`palette`, `ui-layout`), no dots, since a dot separates area from title in a file name.
- **Scope**: the line under the heading says what the title covers. Scopes in one area are disjoint: a rule fits exactly one title.
- **Placement**: a new rule goes under the title whose scope fits it. When none fits, propose a new title (name and scope) with the rule, as one approval. A title whose last rule retires goes, with its heading or file.
- Area-wide sections (Next id, Pillars, Open questions, and a Proposed for drafts that need a new title) sit above the titles; everything about a rule (Rules, References, Proposed, Signals, Rejected) sits under its title.

## Split

An area holding more than 15 rules splits along its titles, all at once, into flat files `docs/shape/<area>.<title>.md`. A split area stays split.

- `<area>.md` becomes the **index**: the one-line purpose, Next id, Pillars, Open questions, its Proposed for drafts that need a new title, and a Titles list, one line per title: link and scope.
- `<area>.<title>.md` holds one title's block, headed `# <Area> · <title>` with its scope line and a link back to the index.
- Ids keep the area prefix and never change on a move: an id names a rule, not a file.
- The files are flat beside the old one, so every relative link moves unchanged.

```md
# Art direction

How the game looks.

Next id: ART-21

## Pillars

- Readable at a glance: silhouette before detail.

## Titles

- [sprites](art-direction.sprites.md): sprite size, grid and animation.
- [palette](art-direction.palette.md): colours and the palette files they come from.
```

## Rules

- **One line per rule**: id · level · the rule · _Why:_ one line · _Source:_ optional link (ADR, ticket, commit, external doc) · _Check:_ the enforcement, once settled.
- **State the target**: "Sprites are 32×32", not "Don't use other sizes".
- **Next id** is the id the next rule takes, one line per area, in `<area>.md`. Take it, then bump it, on the writer branch only ([INBOX.md](INBOX.md)); it only ever rises, so a retired id stays retired. An area without the line gets one: one past the highest id in its files, in Rejected, or in their git history.
- **Pillars** are 3–5 lines of intent that settle ties the rules don't cover.
- **References** carry what prose can't: images, example files, approved assets. Visual areas lean on references over rules.
- **Proposed** holds drafts awaiting the user, each with why it was queued: a new rule is a rule line without an id; a retirement is `retire <id>: <reason>`; a rule needing a new title is prefixed `title <name> (<scope>):`. An approved rule takes the next id; an approved retirement goes through retire; a declined draft is deleted. A new rule followed by `retire <id>: superseded by the draft above` is approved or declined as one; `retire <id>: conflicts with <id>` is put to the user as the choice in [review.md](modes/review.md), not approved on its own.
- **Signals** are evidence for later sessions, under the title of the rule they name (a `new` signal under the title its subject fits): date · kind · rule id or `new` · one-line note. The kinds:
  - **cite**: a rule decided part of a change;
  - **friction**: a rule got in the way;
  - **contradiction**: code breaks a rule;
  - **correction**: the user corrected the agent.

  A signal is removed once a rule, a review verdict, a retirement or a direct order acts on it, or once a draft resting on it is approved or declined.
