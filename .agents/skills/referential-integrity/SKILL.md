---
name: referential-integrity
description: Find and interpret unmatched identifiers between parent and child tables, distinguishing orphan records from late-arriving or malformed data. Use when relationships between tables need validation.
---

# Referential-integrity review

## Trigger

Use when a fact/event table contains identifiers that should map to a dimension or parent table.

## Procedure

1. Identify the candidate parent-child relationship.
2. Use a bounded left join to find unmatched identifiers.
3. Check whether unmatched values are expected, late-arriving, malformed, or orphaned.
4. Compare unmatched rates across source and time period.

## Output

Separate confirmed orphan records from records that may simply be late-arriving.
Recommend quarantine, correction, backfill, or acceptance with an explicit rationale.

## Validation

Provide the unmatched-row query and the reconciliation metric to re-run after remediation.