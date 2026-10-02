# Review

A milestone (vertical slice, release, or on request). Walk the whole shape.

1. Sort every rule in every area by evidence:
   - **active**: cite signals, or work in the repo that visibly follows it;
   - **dead**: its subject is gone (git history shows it removed), or its area left scope;
   - **silent**: neither. Rare-but-critical rules and rules for work not yet built look like this.

   Done when every rule has a status and the evidence behind it.
2. Turn each status into a verdict: active → **promote** or **keep**; dead → **retire**; silent → ask the user whether it still changes a decision, and **keep** or **retire** on the answer. Friction and contradiction signals weigh on the verdict: a rule the code keeps breaking is either enforced or retired.
3. Check every open question against the work since; each answered one becomes a proposed rule.
4. Present all verdicts as one table (id · rule · status · verdict · evidence). Retirements go through [retire.md](retire.md); newly settled rules go to enforcement.
5. Remove every signal a verdict acted on.
