# Lantern domain context

> Charter: look entries up one at a time; never read this file whole at the start of a session.

## Oil

**Oil** is the lantern fuel the player carries; it shrinks as the player takes damage and refills at shrines.
_Avoid_: ember, fuel, light meter

## Shrine

A **Shrine** is a checkpoint where Oil refills and the game saves.

## Save module

The **Save module** lives in `src/save.gd`. It writes and reads the player's progress and is the only code that touches save files. Entry point: `save.gd`.

## HUD

The **HUD** lives in `src/ui/`. It shows Oil and health. HUD scripts only display state; they never change game state.

## Save file format

Save files are JSON with keys `version` (int), `ember` (float 0–1) and `shrine_id` (string); the file is written to `user://save.json` atomically through a temp file.
