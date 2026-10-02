# Retire

A rule no longer holds. It retires when it is:

- **superseded**: a newer decision replaces it;
- **dead**: its subject is gone from the repo, or the user confirms it never changes a decision;
- **contradicted**: the code keeps breaking it (contradiction signals pile up) and nobody wants it enforced;
- **out of scope**: its area left the project.

1. Name the reason and propose the retirement. A settled rule needs the user's explicit yes.
2. Delete the rule; Next id stays where it is. Move the rule to **Rejected** when someone is likely to propose it again.
3. **Cascade** along the rule's own _Source_ and _Check_ links, then everything else that cites its id: the check, the coding-standards pointer, reference assets, its ADR (marked superseded or deprecated, pointing at what replaced it), its signals, and the area's entry line once the area is empty. Done when a repo search for the id finds it nowhere outside Rejected.
