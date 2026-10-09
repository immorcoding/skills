---
name: shape-your-project
description: Maintain a project's shape, its living software standards per area (architecture, art direction, coding style…) in docs/shape/. Use when a decision should bind the project's future work ("from now on", "always"), a pattern or user correction recurs, a standard is contradicted or superseded, a grill, wayfinder session or retro ends, a branch's shape inbox is merged, at a milestone review, to set up a new project's standards, or to adopt an existing glossary into them.
---

# Shape your project

A project's **shape** is its current software standards, one file per **area** in `docs/shape/`, each rule under a **title** within its area; an area past 15 rules splits into one file per title. Read [STANDARD-FORMAT.md](STANDARD-FORMAT.md) before writing to an area or title file. Beside them, an optional `ROUTES.md` routes each directory to what to read before changing it; it is not an area, and [ROUTES-FORMAT.md](ROUTES-FORMAT.md) governs it. Shape is present tense: edit rules in place, and let git hold the history. Hardware, platform and legal facts live in their own documents; a rule cites them as its _Why_ or _Source_.

Propose every edit and write it on the user's approval; a `ROUTES.md` row, which the tree confirms, needs none. Area and title files change only on the **writer branch** (usually `main`); on any other branch, read [INBOX.md](INBOX.md) first, because every write there goes to the branch's inbox instead. An inbox binds no other branch until it is drained, so drain as soon as one reaches the writer branch: right after you merge a branch that carries one, or before other work when you find files in `docs/shape/inbox/` on the writer branch. In an **unattended** run on the writer branch (nobody can approve), queue each draft (a new rule, or a retirement) in its title's Proposed section; signals are evidence, so add them as usual, and leave every other section as it is.

## Levels

- **exploring**: a bet. Follow it; flag friction.
- **provisional**: likely to hold. Follow it; ask before breaking it.
- **settled**: proven. Enforce it.

Promote only on evidence: work that depends on the rule, and its title's Signals. A rule forced by a fixed constraint (hardware, platform, legal) enters as settled.

## The bar

A rule earns its line only if a future session, starting cold, would choose differently without it. What config or a check already states stays there.

## Enforcement

When a rule becomes settled, hand it off and name the hand-off in the rule's _Check:_

- **mechanical** (syntax, banned API, import shape, file location) → an automated check: lint rule, pre-commit hook or CI job, citing the rule id;
- **judgement** about code → a pointer in the project's coding-standards doc (`CODING_STANDARDS.md` unless one exists), so reviewers, human or agent, apply it;
- **visual or audio** (art, sound, content) → asset review: new assets are compared against the area's References, which hold at least one approved example first.

The coding-standards doc holds pointers, never rules: each names the area or title file to cite, and one line asks reviewers to flag code that breaks a provisional rule there. Add that line when it is missing; a rule written straight into the doc (by a retro, say) moves into its area, leaving a pointer.

## ADRs

A hard-to-reverse decision also earns an ADR: its _why_, kept after the rule changes. Write it through an installed `domain-modeling` skill (any namespace, e.g. `supermatt:domain-modeling`); without one, write it yourself as a short paragraph in `docs/adr/NNNN-slug.md`, numbered after the highest existing one.

## Modes

Read the one file for the mode that fits what triggered you:

- No `docs/shape/` yet → [modes/setup.md](modes/setup.md)
- A lasting decision was just made, or a Proposed item was approved → [modes/record.md](modes/record.md)
- A pattern or correction recurred → [modes/propose.md](modes/propose.md)
- A milestone, a retro ending, or the user asks for a review → [modes/review.md](modes/review.md)
- A rule is superseded, dead, contradicted or out of scope → [modes/retire.md](modes/retire.md)
- A branch with an inbox file was merged, inbox files wait on the writer branch, or the user asks to drain → [modes/drain.md](modes/drain.md)
- The user asks to move an existing glossary onto the shape → [modes/adopt.md](modes/adopt.md)
