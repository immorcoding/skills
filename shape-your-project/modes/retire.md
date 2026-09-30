# Retire

A rule no longer holds. It retires when it is:

- **superseded**: a newer decision replaces it;
- **unused**: nothing follows or depends on it;
- **contradicted**: the code keeps breaking it and nobody objects;
- **out of scope**: its area left the project.

1. Name the reason and propose the retirement. A settled rule needs the user's explicit yes.
2. Delete the rule. Move it to **Rejected** when someone is likely to propose it again.
3. **Cascade** through everything that enforces or cites it: the check, the `CODING_STANDARDS.md` pointer, reference assets, its ADR (the `domain-modeling` skill marks it superseded), and the area's entry line once the area is empty. Done when a search of the repo for the rule id finds nothing live.
