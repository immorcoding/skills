# Retire

A rule no longer holds. It retires when it is:

- **superseded**: a newer decision replaces it, including the one the user picked over it in a contradiction;
- **dead**: its subject is gone from the repo, or the user confirms it never changes a decision (review's silent rules land here on a "retire");
- **contradicted**: the code keeps breaking an exploring rule (contradiction signals pile up) and nobody wants it enforced; a provisional or settled rule goes down a level first ([propose.md](propose.md));
- **out of scope**: its area left the project.

1. Name the reason and propose the retirement. A settled rule needs the user's explicit yes.
2. Delete the rule. Move the rule to **Rejected** when someone is likely to propose it again.
3. **Cascade** along the rule's own _Source_ and _Check_ links, then everything else that cites its id: the check, the coding-standards pointer, reference assets, its ADR (marked superseded or deprecated, pointing at what replaced it), its signals, the title (heading or file, and its index line) once the title is empty, and the area's entry line once the area is empty. Done when no file in the repo cites the id as a live rule. History may still name it (a Rejected entry, a superseded ADR), since ids are never reused.
