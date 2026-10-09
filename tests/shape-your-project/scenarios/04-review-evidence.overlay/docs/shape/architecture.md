# Architecture

How Lantern's code is structured.

## enemies

How enemy behaviour is built.

### Rules

- **ARCH-1** · provisional · Enemies use an enum-driven state machine inside their own script. _Why:_ simple and debuggable at our scale.

### Signals

- 2026-09-12 · cite · ARCH-1 · Bat AI built as an enum state machine.
- 2026-09-24 · cite · ARCH-1 · Spider AI followed the same pattern.

## ui

What UI scripts may do.

### Rules

- **ARCH-2** · exploring · UI scripts only display state; game logic lives outside `src/ui`. _Why:_ keeps logic testable.

### Signals

- 2026-09-15 · cite · ARCH-2 · HUD only displays health; damage stays in `player.gd`.
- 2026-09-26 · cite · ARCH-2 · Pause overlay kept its logic outside `src/ui`.

## persistence

Save files and what survives an update.

### Rules

- **ARCH-3** · settled · Save files carry a version number and a migration path. _Why:_ players' saves must survive updates. _Source:_ [ADR-0001](../adr/0001-versioned-saves.md) _Check:_ pointer in [CODING_STANDARDS.md](../../CODING_STANDARDS.md).

### Signals

- 2026-09-18 · friction · ARCH-3 · A one-field save tweak for playtests needed a full migration step.
- 2026-09-27 · friction · ARCH-3 · Each playtest build's inventory rebalance needed its own migration.

## netcode

Multiplayer sync.

### Rules

- **ARCH-4** · exploring · Multiplayer sync goes through one netcode module in `src/net`. _Why:_ one place for netcode.
