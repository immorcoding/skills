---
name: shape-your-project
description: Maintain a project's shape, its living software standards per area (architecture, art direction, coding style…). Use when a decision should bind the project beyond the current task, a pattern or correction recurs a third time, a standard is contradicted or superseded, at a milestone review, or to set up a new project's standards.
---

# Shape your project

A project's **shape** is its current software standards, one file per **area** in `docs/shape/`, in the format of [STANDARD-FORMAT.md](STANDARD-FORMAT.md). Shape is present tense: edit rules in place, and let git hold the history. Hardware, platform and legal facts live in their own documents; a rule cites them as its _Why_ or _Source_.

Propose every edit and write it on the user's approval. In an **unattended** run (nobody can approve), queue each draft in the area's Proposed section and leave every other section as it is.

## Levels

- **exploring**: a bet. Follow it; flag friction.
- **provisional**: likely to hold. Follow it; ask before breaking it.
- **settled**: proven. Enforce it.

Promote only on evidence: work that depends on the rule, and the area's Signals. A rule forced by a fixed constraint (hardware, platform, legal) enters as settled.

## The bar

A rule earns its line only if a future session, starting cold, would choose differently without it. What config or a check already states stays there.

## Enforcement

When a rule becomes settled, hand it off and name the hand-off in the rule's _Check:_

- **mechanical** (syntax, banned API, import shape, file location) → an automated check: lint rule, pre-commit hook or CI job, citing the rule id;
- **judgement** about code → a pointer in the project's coding-standards doc (`CODING_STANDARDS.md` unless one exists), so reviewers, human or agent, apply it;
- **visual or audio** (art, sound, content) → asset review: new assets are compared against the area's References, which hold at least one approved example first.

## ADRs

A hard-to-reverse decision also earns an ADR: its _why_, kept after the rule changes. Write it through an installed `domain-modeling` skill (any namespace, e.g. `supermatt:domain-modeling`); without one, write it yourself as a short paragraph in `docs/adr/NNNN-slug.md`, numbered after the highest existing one.

## Modes

Read the one file for the mode that fits what triggered you:

- No `docs/shape/` yet → [modes/setup.md](modes/setup.md)
- A lasting decision was just made, or a Proposed item was approved → [modes/record.md](modes/record.md)
- A pattern or correction recurred → [modes/propose.md](modes/propose.md)
- A milestone, or the user asks for a review → [modes/review.md](modes/review.md)
- A rule is superseded, dead, contradicted or out of scope → [modes/retire.md](modes/retire.md)
