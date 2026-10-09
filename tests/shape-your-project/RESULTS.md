# Results

Latest scenario runs, judged on written files only. Update this table whenever scenarios are run.

The "After #24" column is the scoped-reads-and-levels rework (spec #24); each cell names the commit the run used. Every scenario passed on 417a06f; the ones a later fix touched were re-run on the commit named.

| Scenario | Old skill (8a6b7ce) | Before #24 (220e0cd) | After #24 | Date |
|---|---|---|---|---|
| 01 setup baseline | pass | pass (Expect corrected: accepted hooks add files outside `docs/shape/`) | pass (417a06f) | 2026-10-09 |
| 02 setup, both files | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 03 repeated correction | not run (feature absent) | pass | pass (5b83474) | 2026-10-09 |
| 04 review evidence | not run (feature absent) | pass (Expect reworded: ARCH-3 is active, not asked about) | pass (92c2872; failed on 2ae56c8 until the run prompt logged the verdict table shown with its question) | 2026-10-09 |
| 05 id after retire | fail (no Next id) | pass | pass (417a06f) | 2026-10-09 |
| 06 retire with ADR | pass | pass | pass (417a06f) | 2026-10-09 |
| 07 merged conflict | pass | pass | pass (ae16fe1); the old skill put the rule in architecture as ARCH-5 | 2026-10-09 |
| 08 unattended conflict | not run (feature absent) | pass | pass (5b83474) | 2026-10-09 |
| 09 pending proposal | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 10 settle art | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 11 setup, existing guide | pass | pass | pass (417a06f) | 2026-10-09 |
| 12 branch inbox | not run (feature absent) | pass | pass (ae16fe1) | 2026-10-09 |
| 13 drain | not run (feature absent) | pass | pass (2301586); the old skill kept the repeated correction as a signal | 2026-10-09 |
| 14 retro review | not run (feature absent) | pass | pass (5b83474); the old skill ran no review on the retro prompt | 2026-10-09 |
| 15 route on branch | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 16 drain route | not run (feature absent) | pass | pass (ae16fe1) | 2026-10-09 |
| 17 record title | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 18 record split | not run (feature absent) | pass | pass (417a06f) | 2026-10-09 |
| 19 adopt glossary | not run (feature absent) | pass (Expect corrected after the run: the Save module boundary rightly became ARCH-5) | pass (5b83474) | 2026-10-09 |

06, 07 and 11 passed on the old text too: the model already did those by default, so their changes harden rather than fix.
