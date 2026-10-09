# Review splits an area past 15 rules along its titles

Fixture: shaped
Human: present

## Prompt

That's the retro wrapped up. Thanks, everyone.

## Script

- Any question about whether to keep a rule: "Keep it."
- Approve everything else.

## Expect

- [ ] `docs/shape/coding-style.gdscript.md` holds STYLE-1 to STYLE-6 and STYLE-13 to STYLE-15, each under its old id
- [ ] `docs/shape/coding-style.ui.md` holds STYLE-7 to STYLE-12, STYLE-16 and STYLE-17, and the STYLE-9 cite signal unless a verdict acted on it
- [ ] `coding-style.md` is the index: it reads `Next id: STYLE-18`, lists both titles with a scope and a link, and holds no rule line
- [ ] Each title file links back to `coding-style.md`
- [ ] The entry block in `CLAUDE.md` still lists Coding style once and names no title
- [ ] `architecture.md` and `art-direction.md` are not split
