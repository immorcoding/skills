# Entry block

The project's pointer to its shape: a `## Project shape` block in the agent instructions file, loaded every session. It lists areas only; rules stay in the area files, read on demand.

## Which file

- `CLAUDE.md` exists → edit it.
- Else `AGENTS.md` exists → edit it.
- Neither → ask the user which to create.

An existing `## Project shape` block is updated in place, surrounding sections untouched.

## Template

```markdown
## Project shape

Current standards, one file per area; read an area's file before work that touches it. Changes go through the `shape-your-project` skill.

- [Pillars](docs/shape/pillars.md): <gist>
- [Art direction](docs/shape/art-direction.md): <gist>
```

One line per area, in the order a newcomer should read them. Gists stay under ten words: this block costs context every turn.
