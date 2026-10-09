# Adopt

The user asked to move the project's existing glossary onto the shape's layout. Run only on the user's request, on the writer branch; elsewhere, ask the user to switch first, since every destination is a writer-branch file.

1. **Find the glossary**: the file `docs/agents/domain.md` names, else every `GLOSSARY.md` or `CONTEXT.md` (and `-MAP.md`) at the root or in a module. Done when every glossary file is read whole, including any charter at its top.
2. **Classify every entry** into one home:
   - **term**: domain language, what a word means here → stays in the glossary, trimmed to one or two sentences;
   - **module**: what a directory or module holds and where it starts → a `ROUTES.md` row ([ROUTES-FORMAT.md](../ROUTES-FORMAT.md));
   - **boundary**: what must or must not happen across modules → a rule, drafted through [record.md](record.md);
   - **detail**: registers, parameters, call chains, file formats → the module's README or a doc under `docs/`, linked from its row or rule.

   An entry mixing classes splits along them. Charter lines get a home too: kept, replaced by what this run builds, or dropped. Done when every entry and charter line has a class.
3. **Ask once**: show the classification as one table (entry · class · destination), and let the user accept, move entries, or leave whole classes where they are. Declining the routing table leaves module entries in the glossary. Done when the user has answered the table.
4. **Move** what the user accepted. Rules go through record, so they take ids, titles and its read of the touched titles: a boundary an existing rule already states is cited, not duplicated. The glossary keeps its file name, so every reader of `docs/agents/domain.md` still finds it; edit it through an installed `domain-modeling` skill (any namespace), or yourself, changing only the entries this run moved or trimmed. Done when every accepted entry sits in its destination, and every link to a moved entry (`git grep` its heading) points at the new home.
