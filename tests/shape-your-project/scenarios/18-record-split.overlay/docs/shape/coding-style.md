# Coding style

GDScript conventions.

Next id: STYLE-16

## gdscript

Typing, naming and structure of GDScript code.

### Rules

- **STYLE-1** · provisional · Use static typing for every variable, parameter and return value. _Why:_ catches errors in the editor.
- **STYLE-2** · provisional · Name signals in past tense (`died`, `item_picked`). _Why:_ reads as an event, not a command.
- **STYLE-3** · exploring · Prefix private members with `_`. _Why:_ GDScript has no access modifiers.
- **STYLE-4** · provisional · One class per file, file named after the class in snake_case. _Why:_ the editor finds scripts by name.
- **STYLE-5** · exploring · Keep functions under 30 lines. _Why:_ long `_process` bodies hide state changes.
- **STYLE-6** · provisional · Use `@onready` for node references, never `get_node` in `_process`. _Why:_ avoids per-frame lookups.
- **STYLE-13** · provisional · Constants are UPPER_SNAKE_CASE. _Why:_ the GDScript style guide, and they read apart from variables.
- **STYLE-14** · exploring · Enums are named in PascalCase, their values in UPPER_SNAKE_CASE. _Why:_ matches the engine's own enums.
- **STYLE-15** · provisional · Every exported variable has a type hint and a default. _Why:_ the inspector shows the right widget.

## ui

HUD and menu layout, theming and navigation.

### Rules

- **STYLE-7** · provisional · HUD controls anchor to screen corners, never absolute positions. _Why:_ survives resolution changes.
- **STYLE-8** · exploring · Every UI font size comes from `ui/theme.tres`. _Why:_ one place to rescale text.
- **STYLE-9** · provisional · Every menu is navigable by gamepad focus alone. _Why:_ the game ships on handhelds.
- **STYLE-10** · exploring · HUD numbers animate over 0.2 s on change. _Why:_ abrupt jumps read as glitches.
- **STYLE-11** · provisional · Menus pause the tree with `get_tree().paused`, never by stopping nodes one by one. _Why:_ one switch to undo.
- **STYLE-12** · exploring · Tooltips appear after 0.5 s hover or focus. _Why:_ instant tooltips flicker during navigation.
