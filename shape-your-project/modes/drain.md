# Drain

A branch with an inbox file was merged into the writer branch, or the user asks to drain. Run on the writer branch.

1. Read every file in `docs/shape/inbox/` ([INBOX.md](../INBOX.md) has the format).
2. Apply every line, in file order:
   - a signal joins its area's Signals, without the area field;
   - **approved** goes through [record.md](record.md) or [retire.md](retire.md) without asking again, taking the next id here;
   - **proposed** is raised with the user now and recorded or deleted on the answer; unattended, it moves to the area's Proposed.

   A correction joining Signals may complete a rule of three: count it through [propose.md](propose.md).
3. Delete each drained inbox file, in the same commit as the area edits it caused.

Done when `docs/shape/inbox/` holds no file and every line sits in an area file, in Proposed, or was declined.
