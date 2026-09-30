# shape-your-project

Early decisions (how the code is structured, what the art looks like, which style rules hold) tend to get lost in chat logs and closed tickets. The next session starts cold and decides differently. This skill writes those decisions down as a project's **shape**: short, living standards, one file per area, that every agent session reads before touching that area.

It works on its own. It also plays well with Matt Pocock's skills (`wayfinder`, `grill-with-docs`, `domain-modeling`, `code-review`) if you have them, but none are required.

## What you get in your project

```
your-repo/
├── CLAUDE.md             ← gains a short "## Project shape" block listing the areas
└── docs/shape/
    ├── architecture.md   ← one file per area you chose
    ├── coding-style.md
    └── art-direction.md
```

Each area file holds a few **pillars** (the intent), one-line **rules**, **references** (example files, images), **open questions**, and **rejected** ideas. Every rule has an id and a level:

```md
- **ART-1** · settled · Sprites are 32×32 on a 16px grid. _Why:_ reads at 1080p, cheap to produce.
- **ART-2** · exploring · Limit the palette to 32 colours. _Why:_ keeps the world cohesive.
```

| Level | Meaning | How agents treat it |
|---|---|---|
| exploring | a bet | follow it, say when it hurts |
| provisional | likely to hold | follow it, ask before breaking it |
| settled | proven by real work | enforce it |

Rules move up only on evidence, when real work depends on them.

## How to use it

Nothing is written without your approval: the agent always shows you the change first.

### 1. Set up (once per project)

In your project folder, start Claude Code and say:

> Set up this project's shape.

The agent reads the repo, asks what the project is, suggests 3–4 areas worth keeping consistent (with a reason for each), and interviews you about each one, one question at a time with a recommended answer. Answer "not sure yet" freely: it becomes an open question, not a guess.

### 2. Just work

After setup, the skill mostly runs by itself:

- **A lasting decision comes up** ("let's always use signals for UI events"): the agent offers to record it as a rule.
- **Something happens a third time** (the same pattern, or you correcting the same mistake): the agent proposes turning it into a rule.
- **Code contradicts a rule**: the agent asks whether to fix the code or retire the rule.

You can also ask directly:

> Record this as a standard: enemies use the StateMachine component.

### 3. Review at milestones

At a vertical slice, a release, or whenever the shape feels stale:

> Review the project's shape.

You get one table: every rule with a verdict (**promote**, **keep** or **retire**) and the evidence for it. Newly settled rules get enforced: mechanical ones become lint/CI checks, judgement ones go into `CODING_STANDARDS.md` for code review.

### 4. Retire rules that no longer hold

> Retire ARCH-3, we switched to behaviour trees.

The agent deletes the rule and cleans up everything that cites it (checks, standards pointers, ADRs), so no stale rule keeps steering agents.

## With or without Matt Pocock's skills

| If you have… | shape-your-project… |
|---|---|
| `domain-modeling` | uses it to write ADRs for hard-to-reverse decisions |
| nothing | writes those ADRs itself as short paragraphs in `docs/adr/` |
| `wayfinder` / `grill-with-docs` | notices lasting decisions while you plan or grill, and offers to record them |
| `code-review` | its settled rules in `CODING_STANDARDS.md` get checked on every review |

## Tips

- **Start small.** Three or four areas is plenty; new ones appear when a decision needs a home.
- **Software only.** Hardware, platform and legal facts stay in their own docs; a rule links to them as its reason.
- **Show, don't tell** for visual areas: a reference image beats a paragraph of rules.
- The shape is present tense. Edit rules in place; git keeps the history.
