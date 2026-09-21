---
name: numeric-anomalies
description: Profile numeric fields and distinguish invalid values from legitimate statistical outliers before proposing reversible handling. Use when numeric values are negative, extreme, unexpected, or highly skewed.
---

# Numeric-anomaly review

## Trigger

Use when a numeric field contains negative, zero, extreme, or otherwise unexpected values.

## Procedure

1. Profile count, nulls, quantiles, min/max, and meaningful groups.
2. Distinguish statistical outliers from invalid values.
3. Check units, scale, currency, and business constraints.
4. Never treat an outlier as an error solely because it is rare.

## Output

Separate invalid values, review-worthy outliers, and valid extremes.
Recommend correction, capping, quarantine, or retention with justification.

## Validation

Provide distribution and constraint checks before and after any proposed transformation.