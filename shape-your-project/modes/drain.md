# Drain

Run on the writer branch right after any merge into it, and whenever inbox files wait there or the user asks to drain. Until it runs, the inbox's approved rules bind no other branch.

1. **Mechanical pass.** Read every file in `docs/shape/inbox/` ([INBOX.md](../INBOX.md) has the format). Do what needs no judgement: a signal naming a rule id joins that rule's title's Signals, without the area field; a `route` line is written to `ROUTES.md` when the tree confirms it. Leave `approved` and `proposed` lines and `new` signals for step 2, and list them. When `shape.delegation` is on, run this pass in a subagent on `shape.delegationModel`, giving it only the titles its signals name and the route rows it needs; it reports what it wrote and what it left.
2. **Judgement pass.** When the merge brought inbox lines or changed code, read its related areas in full, once ([SKILL.md](../SKILL.md), Reads); the steps below use that read. A merge with neither has nothing to check.
   - **new** signals join the title their scope fits.
   - **approved** goes through [record.md](record.md) without asking again, taking the next id.
   - **proposed** rule drafts are raised with the user now if they are present, and recorded or deleted on the answer; unattended, a draft moves to its title's Proposed.
   - **level-up, level-down and contradiction** move to their title's Proposed, to be decided at review ([propose.md](propose.md)), unless a contradiction blocks the work; then it is raised now ([INBOX.md](../INBOX.md)).
   - A `route` line the tree contradicts gives way to a row written from the tree.
3. Delete each drained inbox file in the same commit as the area edits it caused.

Done when `docs/shape/inbox/` holds no file and every line sits in an area or title file, in `ROUTES.md`, in Proposed, or was declined.
