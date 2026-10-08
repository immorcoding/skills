# Propose

Corrections and evidence go into signals. Levels move by proposal, decided at review. Nothing is counted.

- **A correction** from the user: add a `correction` signal under the title it belongs to, or with rule id `new` when no title fits. Off the writer branch it goes to the inbox. A code pattern needs no signal; the repo already holds it.
- **A level change**, when the signals and the work show a rule holding or breaking:
  - `level-up <id>: <reason>` moves one step up. It needs `cite` signals from work that depended on the rule, and no open `friction` or `contradiction` against it. Moving to settled also needs a Check that names the hand-off ([SKILL.md](../SKILL.md), Enforcement).
  - `level-up <id> twice: <reason>` moves exploring to settled, with the evidence for both steps.
  - `level-down <id>: <reason>` moves one step down, when open `friction` or `contradiction` signals keep arising and the work still needs the rule. An exploring rule the code keeps breaking goes to [retire.md](retire.md) instead.
- **A contradiction** between two rules is never settled by the agent: write `contradiction <id> / <id>: <reason>` in Proposed. Until the user decides, the higher-level rule binds. At equal levels, the work asks the user; if nobody can answer, the work stops at the conflict, as in [INBOX.md](../INBOX.md).
- **A new rule** drafted from correction signals is a rule line without an id, in Proposed, drafted at review. It takes no effect before the user approves it, because exploring rules bind the work.

Review decides the Proposed items in this order: contradictions (the user picks; the losing rule retires), level changes, new rules. Acted-on signals are removed.

Done when the correction is a signal, or the proposal is in Proposed or the inbox.
