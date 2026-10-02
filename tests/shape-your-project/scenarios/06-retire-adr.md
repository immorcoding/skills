# Retiring a rule follows its Source to the ADR

Fixture: shaped
Human: present

## Prompt

During early access we wipe saves on every update instead of migrating them. Retire ARCH-3.

## Script

- Whether the new policy is a rule: "Yes, record it."
- Approve every proposal.

## Expect

- [ ] ARCH-3 is gone from Rules
- [ ] ADR-0001 is marked superseded or deprecated, with a pointer to what replaced it
- [ ] Outside Rejected, no file in the repo still cites ARCH-3 as live
