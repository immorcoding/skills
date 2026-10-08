# Workflows

Matt's chain runs `/wayfinder`, `/to-spec`, `/to-ticket`, `/implement-spec`, `/code-review`, `/retro`. Two of its steps trigger the shape's reviews. Both are optional: without them, run the review by hand ([review.md](modes/review.md)).

- **`/wayfinder` ends**: a consistency read. Read the whole shape once and check the session's decisions against every rule. A conflict becomes a `contradiction` proposal, put to the user now ([propose.md](modes/propose.md)). Each lasting decision goes through [record.md](modes/record.md).
- **`/retro` ends**: the review of the whole shape ([review.md](modes/review.md)): level verdicts, contradictions for the user, new rules drafted from correction signals.
- **Branches**: a retro fits once the active branches are merged or closed. A closed branch's inbox never reaches the writer branch, so its decisions never bind.

A drain after a merge reads only its related areas ([SKILL.md](SKILL.md), Reads), so it is not a review.
