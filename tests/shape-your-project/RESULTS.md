# Results

Latest scenario runs, judged on written files only. Update this table whenever scenarios are run.

Every row below predates the scoped-reads-and-levels rework (#24): every scenario needs a re-run against it.

| Scenario | Old skill (8a6b7ce) | Current skill | Date |
|---|---|---|---|
| 01 setup baseline | pass | pass (Expect corrected: accepted hooks add files outside `docs/shape/`) | 2026-10-04 |
| 02 setup, both files | not run (feature absent) | pass | 2026-10-04 |
| 03 third correction | not run (feature absent) | pass | 2026-10-04 |
| 04 review evidence | not run (feature absent) | pass (Expect reworded: ARCH-3 is active, not asked about) | 2026-10-04 |
| 05 id after retire | fail (no Next id) | pass | 2026-10-04 |
| 06 retire with ADR | pass | pass | 2026-10-04 |
| 07 cross-area supersede | pass | pass | 2026-10-04 |
| 08 unattended record | not run (feature absent) | pass | 2026-10-04 |
| 09 pending proposal | not run (feature absent) | pass | 2026-10-04 |
| 10 settle art | not run (feature absent) | pass | 2026-10-04 |
| 11 setup, existing guide | pass | pass | 2026-10-04 |
| 12 branch inbox | not run (feature absent) | pass | 2026-10-04 |
| 13 drain | not run (feature absent) | pass | 2026-10-04 |
| 14 review split | not run (feature absent) | pass | 2026-10-04 |
| 15 route on branch | not run (feature absent) | pass | 2026-10-04 |
| 16 drain route | not run (feature absent) | pass | 2026-10-04 |
| 17 record title | not run (feature absent) | pass | 2026-10-04 |
| 18 record split | not run (feature absent) | pass | 2026-10-04 |
| 19 adopt glossary | not run (feature absent) | pass (Expect corrected after the run: the Save module boundary rightly became ARCH-5) | 2026-10-04 |

06, 07 and 11 passed on the old text too: the model already did those by default, so their changes harden rather than fix.
