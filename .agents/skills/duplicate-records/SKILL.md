---
name: duplicate-records
description: Investigate repeated keys or duplicate records, distinguish retries from legitimate repeated events, and propose reversible handling. Use when candidate keys or record combinations repeat.
---

# Duplicate-record review

## Trigger

Use when a candidate key is repeated or records are identical across relevant columns.

## Procedure

1. Identify the suspected key and duplicate groups.
2. Compare timestamps, source, status, and payload fields within each group.
3. Determine whether duplicates represent retries, updates, legitimate repeated events,
   or ingestion errors.
4. Do not delete or deduplicate until the intended grain of the table is established.

## Output

Recommend a reversible action: retain, merge, quarantine, or investigate.
Include the proposed retention rule and the evidence supporting it.

## Validation

Provide before/after duplicate counts and checks for unintended record loss.