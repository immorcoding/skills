# skills

Agent skills for Claude Code (and Codex). 给编程智能体用的 skill 合集。

| Skill | What it does |
|---|---|
| [shape-your-project](shape-your-project/) | Keeps a project's **shape**: its living software standards per area (architecture, art direction, coding style…). Sets them up in conversation, records lasting decisions, proposes conventions on the rule of three, reviews them at milestones, and retires the ones that no longer hold. [How to use it →](shape-your-project/README.md) |

## Install

Clone the repo, then link a skill into your skills folder so updates apply with a `git pull`.

**Windows (PowerShell)**

```powershell
git clone https://github.com/immorcoding/skills.git
New-Item -ItemType Junction -Path "$HOME\.claude\skills\shape-your-project" -Target "$PWD\skills\shape-your-project"
```

**macOS / Linux**

```sh
git clone https://github.com/immorcoding/skills.git
ln -s "$PWD/skills/shape-your-project" ~/.claude/skills/shape-your-project
```

Restart Claude Code; the skill appears as `/shape-your-project` and fires on its own when a decision should bind the project.

## License

[MIT](LICENSE)
