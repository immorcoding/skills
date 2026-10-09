# Drain

A branch with an inbox file was merged into the writer branch, inbox files wait on the writer branch, or the user asks to drain. Run on the writer branch, right away: until it runs, the inbox's approved rules bind no other branch.

1. **Mechanical pass.** Read every file in `docs/shape/inbox/` ([INBOX.md](../INBOX.md) has the format). A signal naming a rule id joins that rule's title's Signals, without the area field; a `route` line the tree confirms is written to `ROUTES.md` without asking. Leave every other line for step 2, and list them.
2. **Judgement pass.** Read the drain's **related areas** in full, once ([SKILL.md](../SKILL.md), Reads), then apply the listed lines in file order:
   - a `new` signal joins the title its scope fits (an `area/title` field names the title);
   - **approved** goes through [record.md](record.md) or [retire.md](retire.md) without asking again, taking the next id here; a rule lands in the area its line names. An approved rule line that conflicts with a live rule loses its approval, unless an approved `retire <id>` of that rule comes with it: raise it now as record's conflict block; unattended, the block moves to its title's Proposed;
   - **proposed** is raised with the user now and recorded or deleted on the answer; unattended, it moves to its title's Proposed;
   - a **route** line the tree contradicts gives way to a row written from the tree.

   A correction joining Signals may complete a rule of three: count it through [propose.md](propose.md).
3. Delete each drained inbox file, in the same commit as the area edits it caused.

Done when `docs/shape/inbox/` holds no file and every line sits in an area or title file, in `ROUTES.md`, in Proposed, or was declined.
