# Drain

A branch with an inbox file was merged into the writer branch, inbox files wait on the writer branch, or the user asks to drain. Run on the writer branch, right away: until it runs, the inbox's approved rules bind no other branch.

1. **Mechanical pass.** Read every file in `docs/shape/inbox/` ([INBOX.md](../INBOX.md) has the format). A signal naming a rule id joins that rule's title's Signals, without the area field; a `route` line the tree confirms is written to `ROUTES.md` without asking. Leave every other line for step 2, and list them.

   **Delegation** is set once per clone, in local git config. When `shape.delegation` is `on`, run this pass as one batched subagent on the model `shape.delegationModel` names, however small the pass, and take its report of what it wrote and what it left. Hand it this step, [INBOX.md](../INBOX.md), the inbox files, and only the titles its signals name and the `ROUTES.md` rows its route lines touch: for this subagent, that replaces the whole area files the entry block hands over. When `shape.delegation` is unset and someone is present, first ask whether a lower-tier model should run this pass, and which; store `git config shape.delegation on` with `git config shape.delegationModel <name>`, or `git config shape.delegation off` on a no. Unset and unattended, run the pass yourself, write no config and say nothing. When this harness can't start the stored model, run the pass yourself and say so in the session; unattended, say so in the drain commit's message.
2. **Judgement pass**, always on the main agent. Read the drain's **related areas** in full, once ([SKILL.md](../SKILL.md), Reads), then apply the listed lines in file order:
   - a `new` signal joins the title its scope fits (an `area/title` field names the title);
   - **approved** goes through [record.md](record.md) or [retire.md](retire.md) without asking again, taking the next id here; a rule lands in the area its line names. An approved rule line that conflicts with a live rule loses its approval, unless an approved `retire <id>` of that rule comes with it: raise it now as record's conflict block; unattended, the block moves to its title's Proposed;
   - **approved · level** `<id> <level>` sets the rule's level as a direct order does ([SKILL.md](../SKILL.md), Levels): settling hands it to enforcement, and leaving settled drops its _Check:_ and the hand-off;
   - **proposed** is raised with the user now and recorded or deleted on the answer; unattended, it moves to its title's Proposed;
   - a **route** line the tree contradicts gives way to a row written from the tree.

   A correction joining Signals may complete a rule of three: count it through [propose.md](propose.md).
3. Delete each drained inbox file, in the same commit as the area edits it caused.

Done when `docs/shape/inbox/` holds no file and every line sits in an area or title file, in `ROUTES.md`, in Proposed, or was declined.
