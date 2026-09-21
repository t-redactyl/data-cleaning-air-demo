---
name: timestamp-validation
description: Validate timestamp parsing, timezone assumptions, ranges, future dates, and event ordering without silently clipping or rewriting values. Use when timestamps may be malformed or inconsistent.
---

# Timestamp review

## Trigger

Use when timestamps are missing, malformed, outside the expected window, or inconsistent across sources.

## Procedure

1. Check parseability, timezone assumptions, minimum, maximum, and future dates.
2. Compare event time with ingestion time when both exist.
3. Look for daylight-saving or timezone conversion issues.
4. Do not clip timestamps to a range without evidence that clipping is valid.

## Output

Report invalid and suspicious timestamps separately, with a proposed correction or quarantine rule.

## Validation

Provide parseability, range, timezone, and ordering checks.