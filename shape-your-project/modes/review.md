# Review

A milestone (vertical slice, release, or on request). Walk the whole shape.

1. Drain any inbox files first ([drain.md](drain.md)), so their signals count as evidence, and bring the entry block up to [ENTRY-BLOCK.md](../ENTRY-BLOCK.md).
2. Sort every rule in every area by evidence:
   - **active**: cite signals, or work in the repo that visibly follows it;
   - **dead**: its subject is gone from the repo (the code or git history shows it removed);
   - **silent**: neither. Rare-but-critical rules and rules for work not yet built look like this.

   Done when every rule has a status and the evidence behind it.
3. Turn each status into a verdict: active → **promote**, **keep** or **demote**; dead → **retire**; silent → ask the user whether it still changes a decision, and **keep** or **retire** on the answer. This step alone moves levels, one step per verdict:
   - **promote** an active rule with no open friction or contradiction signals against it; settled also needs a hand-off to name in its _Check:_ ([SKILL.md](../SKILL.md), Enforcement);
   - **demote** a rule whose friction or contradiction signals keep arising while the work still needs it; a settled rule going down drops its _Check:_ and the hand-off it names ([SKILL.md](../SKILL.md), Levels). An exploring rule the code keeps breaking retires instead.

   Unattended, leave every level and its signals as they are. Each queued conflict (a conflict block, or `retire <id>: conflicts with <id>`) goes to the user as a choice between the two rules; the loser retires as superseded.
4. Check every open question against the work since; each answered one becomes a proposed rule.
5. Present all verdicts as one table (id · rule · status · verdict · evidence). Retirements go through [retire.md](retire.md); newly settled rules go to enforcement.
6. Check the **titles** ([STANDARD-FORMAT.md](../STANDARD-FORMAT.md)): split every unsplit area holding more than 15 rules; give every rule outside a title one, by scope; propose merging or rescoping titles whose scopes overlap, so each rule fits exactly one.
7. With a `ROUTES.md`, fix every stale route, and propose a new Routed line when the layout has outgrown it ([ROUTES-FORMAT.md](../ROUTES-FORMAT.md)).
8. Remove every signal a verdict acted on.

Done when every verdict and title change is applied, no area past 15 rules is unsplit, no acted-on signal remains, and no stale route is left.
