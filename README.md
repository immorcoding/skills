# skills

Agent skills for Claude Code (and Codex). 给编程智能体用的 skill 合集。

| Skill | What it does |
|---|---|
| [shape-your-project](shape-your-project/) | Keeps a project's **shape**: its living software standards per area (architecture, art direction, coding style…). Sets them up in conversation, records lasting decisions, reviews them at milestones, retires the ones that no longer hold, and queues work from parallel branches in an inbox, with sample hooks to enforce it. [How to use it →](shape-your-project/README.md) |

## Install

Clone the repo, then link a skill into your skills folder so updates apply with a `git pull`. Claude Code reads `~/.claude/skills`, Codex reads `~/.codex/skills`; link into whichever you use, or both.

**Windows (PowerShell)**

```powershell
git clone https://github.com/immorcoding/skills.git
New-Item -ItemType Junction -Path "$HOME\.claude\skills\shape-your-project" -Target "$PWD\skills\shape-your-project"
New-Item -ItemType Junction -Path "$HOME\.codex\skills\shape-your-project" -Target "$PWD\skills\shape-your-project"
```

**macOS / Linux**

```sh
git clone https://github.com/immorcoding/skills.git
ln -s "$PWD/skills/shape-your-project" ~/.claude/skills/shape-your-project
ln -s "$PWD/skills/shape-your-project" ~/.codex/skills/shape-your-project
```

Restart the tool; the skill appears as `/shape-your-project` (Codex: `$shape-your-project`). Start with *"Set up this project's shape"*; after that, agents reach for it when a decision sounds lasting, and you can always say *"record this as a standard"*.

## License

[MIT](LICENSE)
