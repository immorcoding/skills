---
name: shape-your-project
description: Maintain a project's shape, its living software standards per area (architecture, art direction, coding style…) in docs/shape/. Use when a decision should bind the project's future work ("from now on", "always"), a user correction recurs, a decision conflicts with a standard, a standard is contradicted or superseded, a grill, wayfinder session or retro ends, a branch's shape inbox is merged, at a milestone review, to set up a new project's standards, or to adopt an existing glossary into them.
---

# Shape your project

A project's **shape** is its current software standards, one file per **area** in `docs/shape/`, each rule under a **title** within its area; an area past 15 rules splits into one file per title. Read [STANDARD-FORMAT.md](STANDARD-FORMAT.md) before writing to an area or title file. Beside them, an optional `ROUTES.md` routes each directory to what to read before changing it; it is not an area, and [ROUTES-FORMAT.md](ROUTES-FORMAT.md) governs it. Shape is present tense: edit rules in place, and let git hold the history. Hardware, platform and legal facts live in their own documents; a rule cites them as its _Why_ or _Source_.

Propose every edit and write it on the user's approval; a `ROUTES.md` row, which the tree confirms, needs none. Area and title files change only on the **writer branch** (usually `main`); on any other branch, read [INBOX.md](INBOX.md) first, because every write there goes to the branch's inbox instead. An inbox binds no other branch until it is drained, so drain as soon as one reaches the writer branch: right after you merge a branch that carries one, or before other work when you find files in `docs/shape/inbox/` on the writer branch. A **conflict** (a decision or rule that can't hold alongside a live rule) goes to whoever can approve as soon as it is found, at record, drain or review, and is queued in Proposed when nobody can; until the answer, nothing in Rules changes and the live rule binds. In an **unattended** run on the writer branch (nobody can approve), queue each draft (a new rule, a retirement, or a conflict block: the new rule line plus `retire <id>: superseded by the draft above`) in its title's Proposed section; when two live rules conflict, queue `retire <id>: conflicts with <other id>` under the lower-level rule's title, or either title at equal levels; signals are evidence, so add them as usual, and leave every other section as it is.

## Levels

- **exploring**: a bet. Follow it; flag friction.
- **provisional**: likely to hold. Follow it; ask before breaking it.
- **settled**: proven. Enforce it.

Levels move one step per review verdict, up or down, on evidence ([modes/review.md](modes/review.md)), or at once by the user's **direct order** ("Settle ART-1"). The order is the approval, so it applies now, with no gates: first name any open friction or contradiction signals against the rule, then write the level; settling still goes to enforcement. Off the writer branch, the order becomes one inbox line, `approved · level <id> <level>`, with any approved example the hand-off needs as a trailing note. A settled rule moving down drops its _Check:_ and removes the hand-off it names; the rule stays, so this is not retire's cascade. A rule forced by a fixed constraint (hardware, platform, legal) enters as settled.

## Reads

Read what a change touches, not the whole shape:

- A decision reads its **touched titles**, the titles whose scope covers its subject, in any area ([modes/record.md](modes/record.md), step 2).
- A drain reads its **related areas** in full, once: the areas its non-route inbox lines name. `ROUTES.md` plays no part in them.
- Only a review reads the whole shape.

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
- The user corrected you → [modes/propose.md](modes/propose.md)
- A milestone, a retro ending, or the user asks for a review → [modes/review.md](modes/review.md)
- A rule is superseded (or lost a conflict), dead, contradicted or out of scope → [modes/retire.md](modes/retire.md)
- A branch with an inbox file was merged, inbox files wait on the writer branch, or the user asks to drain → [modes/drain.md](modes/drain.md)
- The user asks to move an existing glossary onto the shape → [modes/adopt.md](modes/adopt.md)
