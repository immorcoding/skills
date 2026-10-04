# Drain

A branch with an inbox file was merged into the writer branch, inbox files wait on the writer branch, or the user asks to drain. Run on the writer branch, right away: until it runs, the inbox's approved rules bind no other branch.

1. Read every file in `docs/shape/inbox/` ([INBOX.md](../INBOX.md) has the format).
2. Apply every line, in file order:
   - a signal joins its title's Signals, without the area field (an `area/title` field names the title; a bare `area` is placed by scope);
   - **approved** goes through [record.md](record.md) or [retire.md](retire.md) without asking again, taking the next id here;
   - **proposed** is raised with the user now and recorded or deleted on the answer; unattended, it moves to its title's Proposed;
   - **route** is checked against the tree and written to `ROUTES.md` without asking; a line the tree contradicts gives way to a row written from the tree.

   A correction joining Signals may complete a rule of three: count it through [propose.md](propose.md).
3. Delete each drained inbox file, in the same commit as the area edits it caused.

Done when `docs/shape/inbox/` holds no file and every line sits in an area or title file, in `ROUTES.md`, in Proposed, or was declined.
