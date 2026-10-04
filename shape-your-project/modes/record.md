# Record

A lasting decision was just made, or the user approved a Proposed item. Capture it as a rule.

1. Apply **the bar**; a decision below it ends here.
2. Read **every** area and title file for rules the decision overlaps or contradicts. A contradiction is a **supersede**: retire the old rule through [retire.md](retire.md) in the same edit, wherever its area.
3. Draft the rule with a level: tentative → exploring; stated firmly → provisional; forced by a fixed constraint → settled (then hand it to enforcement). Its id is the area's **Next id**; bump the line.
4. Place it under the title whose scope fits; when none does, propose a new title with the rule ([STANDARD-FORMAT.md](../STANDARD-FORMAT.md), Titles). A new area gets its own file and a line in the entry block ([ENTRY-BLOCK.md](../ENTRY-BLOCK.md)). An area that now holds more than 15 rules splits along its titles in the same edit (Split).
5. A hard-to-reverse decision also gets an ADR (see **ADRs**); link it as the rule's _Source_.
6. Remove the Signals the rule answers, and the Proposed item it came from.

Done when the rule sits under its title, Next id is bumped, the area is split if it passed 15 rules, and every rule it supersedes is retired.
