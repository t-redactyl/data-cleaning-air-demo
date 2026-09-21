---
name: categorical-normalization
description: Review spelling, casing, whitespace, abbreviation, and synonym variants in categorical fields and propose an explicit mapping. Use when categorical values appear inconsistent.
---

# Categorical-value review

## Trigger

Use when a field contains spelling, casing, whitespace, abbreviation, or synonym variants.

## Procedure

1. List distinct values with counts.
2. Group likely variants without treating them as equivalent automatically.
3. Check the source system and business vocabulary if available.
4. Propose a mapping table rather than embedding a hidden replacement rule.

## Output

Return the proposed canonical vocabulary, source-to-target mapping, ambiguous values,
and a count of affected rows.

## Validation

Check that all mapped values are in the approved vocabulary and that unmapped values are visible.