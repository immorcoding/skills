# shape-your-project

Early decisions (how the code is structured, what the art looks like, which style rules hold) tend to get lost in chat logs and closed tickets. The next session starts cold and decides differently. This skill writes those decisions down as a project's **shape**: short, living standards, one file per area, that every agent session reads before touching that area.

It works on its own, in Claude Code and in Codex. It also plays well with Matt Pocock's skills (`wayfinder`, `grill-with-docs`, `domain-modeling`, `code-review`) if you have them, but none are required.

## What you get in your project

```
your-repo/
├── AGENTS.md / CLAUDE.md  ← gains a short "## Project shape" block (see below)
└── docs/shape/
    ├── architecture.md    ← one file per area you chose
    ├── coding-style.md    ← past 15 rules, an area splits: coding-style.md (index) + coding-style.<title>.md
    ├── art-direction.md
    ├── ROUTES.md          ← optional: what each directory holds and what to read first
    └── inbox/             ← per-branch queues, drained on the writer branch
```

The **Project shape block** is what makes the shape work in every session, even on a machine without this skill. It lists the areas, explains the levels, and asks agents to leave signals (below). If you use both Claude Code and Codex, the block goes in `AGENTS.md` and `CLAUDE.md` imports it, so both tools see it.

Each **area file** holds a few **pillars** (the intent) and **open questions**, then its rules grouped under short **titles** (`sprites`, `palette`), each with a one-line scope. Under a title sit its one-line **rules**, **references** (example files, images), **proposed** rules waiting for you, **signals**, and **rejected** ideas. Every rule has a permanent id and a level:

```md
Next id: ART-3

## sprites

Sprite size, grid and animation.

### Rules

- **ART-1** · settled · Sprites are 32×32 on a 16px grid. _Why:_ reads at 1080p. _Check:_ asset review against References.

## palette

Colours and the palette files they come from.

### Rules

- **ART-2** · exploring · Limit the palette to 32 colours. _Why:_ keeps the world cohesive.
```

A new rule joins the title its scope fits; when none fits, the agent proposes a new title with it. Once an area passes 15 rules it splits into one file per title (`art-direction.palette.md`), and `art-direction.md` becomes the index, so agents read only the titles their work touches.

| Level | Meaning | How agents treat it |
|---|---|---|
| exploring | a bet | follow it, note friction |
| provisional | likely to hold | follow it, ask before breaking it |
| settled | proven by real work | enforced |

Rules move up only on evidence, when real work depends on them.

### Signals: the shape's memory

Agents forget everything between sessions, so they leave **signals**: one dated line under the rule's title whenever a rule decides part of a change (`cite`), gets in the way (`friction`), is broken by code (`contradiction`), or you correct the agent (`correction`).

```md
- 2026-10-01 · friction · ART-2 · Night levels look muddy within 32 colours.
```

Signals are how a correction counts toward "the third time" across sessions, and what a review uses as evidence. They are cleared once acted on.

## How to use it

Nothing becomes a rule without your approval: the agent always shows you the change first. When an agent runs with nobody watching (a background job, an unattended ticket), it queues its draft under **Proposed** instead, and the next session that works in that area asks you about it first.

### 1. Set up (once per project)

In your project folder, start Claude Code or Codex and say:

> Set up this project's shape.

The agent reads the repo, including standards you already keep (CONTRIBUTING, a style guide), which it links instead of copying. It asks what the project is, suggests 3–4 areas worth keeping consistent (with a reason for each), and interviews you about each one, one question at a time with a recommended answer. Answer "not sure yet" freely: it becomes an open question, not a guess.

### 2. Day to day

Two things keep the shape growing while you work:

- **The Project shape block**, read by every session: agents leave signals and raise pending proposals.
- **The skill itself**, where installed: the agent reaches for it when a decision sounds like it should last ("let's always use signals for UI events"), when a pattern or correction reaches its third instance, or when a decision contradicts an existing rule (in any area).

Agents can miss a moment, so say it when it matters:

> Record this as a standard: enemies use the StateMachine component.

### 3. Review at milestones

Reviews happen when you ask for one: at a vertical slice, a release, or whenever the shape feels stale.

> Review the project's shape.

The agent sorts every rule by evidence:

- **active**: signals or code show it's being used, so it's kept or promoted;
- **dead**: its subject is gone from the repo, so it's retired;
- **silent**: there's no evidence either way, so **it asks you**. Rare-but-critical rules (like save-file migrations) live here, so they're never retired just for being quiet.

You get one table with the verdicts and the evidence. Areas past 15 rules are split along their titles, and overlapping titles are proposed for merging. Newly settled rules get enforced: mechanical ones become lint/CI checks, code judgement goes into your coding-standards doc for review, and art or audio rules are checked against approved reference assets.

Want a nudge? Ask Claude Code to schedule one, e.g. *"remind me to review the project's shape every two weeks"*.

### 4. Retire rules that no longer hold

> Retire ARCH-3, we switched to behaviour trees.

The agent deletes the rule and cleans up everything that cites it (checks, standards pointers, ADRs, signals). Retired ids are never reused, so an old commit or note citing `ARCH-3` never points at a different rule.

### 5. Work on branches in parallel

Area files have one writer, the **writer branch** (usually `main`), so parallel branches never fight over them. On any other branch, agents write their signals, drafts and your approvals to the branch's **inbox**, `docs/shape/inbox/<branch>.md`, which merges with the code. Once it reaches the writer branch, the agent **drains** it right away, after merging or as soon as it finds the inbox there: signals join their areas, approved drafts become rules with the next id, the rest are put to you.

> Drain the shape inbox.

A rule that blocks the work can't wait for the merge: the agent opens a decision issue for you (or asks in the session), and the blocked tickets wait on it.

### 6. Route agents to the right code (optional)

At setup the agent asks whether your project needs a **routing table**, `docs/shape/ROUTES.md`: one line per directory saying what lives there, its entry point, and which areas, rules or glossary to read before changing it. Small projects skip it. Agents read it before searching the code and hand it to the exploration subagents they start, which never see your `CLAUDE.md` or `AGENTS.md`.

Rows only describe; boundaries stay rules in the area files. So when an agent finds a row out of date, it just fixes it (on a branch, as a `route` line in the inbox), never blocks on it, and never asks you. `hooks/routes-check.sh` catches the rows nobody fixed.

### 7. Adopt an existing glossary (optional)

A long-lived `GLOSSARY.md` or `CONTEXT.md` often collects more than words: module descriptions, boundaries, register maps. When you want it lean, say:

> Adopt our glossary into the shape.

The agent sorts every entry into **term** (stays, trimmed), **module** (becomes a routes row), **boundary** (becomes a rule) or **detail** (moves to the module's docs), shows you the whole table once, and moves only what you accept. The glossary keeps its name, so Matt's skills still find it. Nothing happens unless you ask.

Want it enforced rather than asked? [hooks/](hooks/README.md) holds git and agent hooks (plain `sh`) that refuse area-file edits off the writer branch and point at the inbox instead.

## With or without Matt Pocock's skills

| If you have… | shape-your-project… |
|---|---|
| `domain-modeling` | uses it to write ADRs for hard-to-reverse decisions; routes link its glossary (`GLOSSARY.md` or `CONTEXT.md`, whichever you have) |
| nothing | writes those ADRs itself as short paragraphs in `docs/adr/` |
| `wayfinder` / `grill-with-docs` | can catch lasting decisions while you plan or grill; say "record this" to be sure |
| `code-review` | its settled rules in your coding-standards doc get checked on every review |

## Tips

- **Start small.** Three or four areas is plenty; new ones appear when a decision needs a home.
- **Software only.** Hardware, platform and legal facts stay in their own docs; a rule links to them as its reason.
- **Show, don't tell** for visual areas: a reference image beats a paragraph of rules.
- The shape is present tense. Edit rules in place; git keeps the history.
