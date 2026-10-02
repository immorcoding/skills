# Setup

The project has no `docs/shape/` yet. Find its first shape with the user, in conversation.

1. **Understand the project**: read the repo, including the standards it already keeps (CONTRIBUTING, style guides, lint config, a coding-standards doc). Ask what the project is and where it's headed, and name the standards docs you found. Name its **writer branch**, the one branch area files change on (default: the remote's default branch). Done when you can state its type, stage and writer branch in one line and the user agrees.
2. **Choose areas together**: ask which parts of the work the user wants consistent across sessions. Propose candidates from the repo and the conversation, each with a one-line reason; the user picks. Start with three or four areas; more grow later through Record. Done when the user has confirmed the list.
3. **Interview** each chosen area, one question at a time, each with a recommended answer the user can accept in a word. Ask for fixed constraints first, then pillars, then choices already made. Where an existing doc already holds an area's standards, link it from the area file and interview only for what it leaves open. "Not sure yet" becomes an open question. Done when every chosen area has pillars, rules, a linked doc or open questions.
4. **Draft** one file per area, each with its Next id line, and the entry block from [ENTRY-BLOCK.md](../ENTRY-BLOCK.md) naming the writer branch. Done when the user has seen every draft.
5. **Offer enforcement**: show [hooks/README.md](../hooks/README.md) and ask whether to wire the hooks into the project's existing hook setup; a writer branch other than `main` also goes into `git config shape.writerBranch`. Done when the user has chosen the hooks or declined them.
