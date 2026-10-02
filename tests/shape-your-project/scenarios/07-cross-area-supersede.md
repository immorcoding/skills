# A decision in one area supersedes a rule in another

Fixture: shaped
Human: present

## Prompt

Coding style decision: enemy behaviour lives in data-driven `.tres` behaviour resources; enemy scripts hold no behaviour logic of their own.

## Script

- Approve every proposal.

## Expect

- [ ] A rule capturing the decision exists in one area file
- [ ] ARCH-1 (enum state machine inside each enemy script) is retired or rewritten in the same run
- [ ] `run-log.md` shows the agent named ARCH-1 as superseded
