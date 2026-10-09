# Record

A lasting decision was just made, or the user approved a Proposed item. Capture it as a rule.

1. Apply **the bar**; a decision below it ends here.
2. Skim every area's title headings and scope lines (a split area's index Titles list), then read in full the decision's **touched titles**: every title whose scope covers its subject, in any area. The title the rule lands in is one of them. During a drain, skip the titles its related-area read already covered.
   - A **conflict** with a live rule there is offered as one block under the new rule's title: the new rule line without an id, then `retire <id>: superseded by the draft above`. One approval writes both lines: the rule takes the next id, and the retirement goes through [retire.md](retire.md). A decline deletes both.
   - Off the writer branch, the block goes to the inbox as `approved` lines on an in-session yes, as `proposed` lines otherwise. A conflict with a queued, unapproved draft is raised together with it.
   - If the work can't go on under the live rule meanwhile, follow [INBOX.md](../INBOX.md), "When a rule blocks the work".
3. Draft the rule with a level: tentative → exploring; stated firmly → provisional; forced by a fixed constraint → settled (then hand it to enforcement). Its id is the area's **Next id**; bump the line.
4. Place it in the area the decision names, if it names one, under the title whose scope fits; when none does, propose a new title with the rule ([STANDARD-FORMAT.md](../STANDARD-FORMAT.md), Titles). A new area gets its own file and a line in the entry block ([ENTRY-BLOCK.md](../ENTRY-BLOCK.md)). An area that now holds more than 15 rules splits along its titles in the same edit (Split).
5. A hard-to-reverse decision also gets an ADR (see **ADRs**); link it as the rule's _Source_.
6. Remove the Signals the rule answers, and the Proposed item it came from.

Done when the rule sits under its title, Next id is bumped, the area is split if it passed 15 rules, and every conflict is answered or queued.
