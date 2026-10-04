# Inbox

Area and title files have one writer: the **writer branch**, `git config shape.writerBranch` if set, else the branch `origin/HEAD` points at, else `main`. Ids are taken only there, so parallel branches can never write the same id. On any other branch, every shape write goes to that branch's **inbox**; the area files stay as they are.

## The inbox file

`docs/shape/inbox/<branch>.md`, the branch name with `/` turned into `-`, one per branch. Commit it with the branch's work so it merges with the code.

```md
# Inbox: feature/pause-menu

- 2026-10-02 · coding-style/gdscript · cite · STYLE-1 · Pause menu is typed throughout.
- 2026-10-02 · coding-style/gdscript · correction · new · Signals are named in the past tense.
- 2026-10-02 · architecture · proposed · provisional · Enemies extend `EnemyBase`, which owns health and damage. _Why:_ three enemies duplicate it.
- 2026-10-02 · architecture · approved · retire ARCH-3: saves are wiped on each update during early access.
- 2026-10-02 · routes · route · `src/ui/pause/`: the pause menu. Entry: `pause_menu.gd`. Rules: ARCH-2
```

A line is date · area (or `area/title`, when the title is known) · kind · then the rest:

- **cite**, **friction**, **contradiction**, **correction**: a signal, rule id or `new`, one-line note, as in the area's Signals;
- **proposed**: a draft (a rule line without an id, or `retire <id>: <reason>`) that nobody has approved;
- **approved**: a draft the user approved in this session. Drain writes it without asking again.
- **route**: a stale route ([ROUTES-FORMAT.md](ROUTES-FORMAT.md)), area field `routes`, as the corrected row, or `` `path/`: gone `` to drop one.

## Working off the writer branch

Every mode runs as usual; only its write lands in the inbox. Read the area and title files as the standard in force, apply the bar and the overlap checks, and count instances across shape files and inboxes alike, each event once.

## When a rule blocks the work

A queued line waits for the merge. A rule that stops the work in front of you cannot wait, so escalate:

1. On a configured issue tracker, open a **decision issue**: the rule, the requirement it collides with, and what each choice costs. Give it the tracker's human-decision state, and mark every ticket it stops as blocked by it. A later branch that hits the same rule comments on the open issue and adds its own blocking link. With no tracker, ask the user in the session.
2. Unattended, leave the blocked work stopped and the rule standing; the decision belongs to the user.
3. Once the user decides, change the rule once, on the writer branch, then close the issue.
4. A blocked branch resumes by merging the writer branch in (merge, so pushed history stays as it is), and so reads the decided rule before its next change.

## Enforcement

Projects with git or agent hooks can make the writer branch mechanical: [hooks/README.md](hooks/README.md).
