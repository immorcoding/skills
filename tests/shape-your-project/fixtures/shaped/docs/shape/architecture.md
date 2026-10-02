# Architecture

How Lantern's code is structured.

## Rules

- **ARCH-1** · provisional · Enemies use an enum-driven state machine inside their own script. _Why:_ simple and debuggable at our scale.
- **ARCH-2** · exploring · UI scripts only display state; game logic lives outside `src/ui`. _Why:_ keeps logic testable.
- **ARCH-3** · settled · Save files carry a version number and a migration path. _Why:_ players' saves must survive updates. _Source:_ [ADR-0001](../adr/0001-versioned-saves.md)
- **ARCH-4** · exploring · Multiplayer sync goes through one netcode module in `src/net`. _Why:_ one place for netcode.
