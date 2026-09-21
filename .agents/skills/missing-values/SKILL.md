---
name: missing-values
description: Quickly profile missingness per DataFrame column, assess plausible MCAR/MAR/MNAR mechanisms, diagnose likely causes, and get the user's handling choice from a short per-column menu.
---

# Missing-value review

Use in a Jupyter notebook with pandas DataFrames.

## Workflow

1. Review the issues one column at a time.
2. Diagnose the missingness issue and offer an explanation for the user. Diagnose this using missing count, distribution, and pattern of missingness. Check the amount of missingness (as a percent of the data) and the relationship between missingness in this column and others (target, if known, and other predictors) to decide if the pattern is MCAR, MAR or MNAR.
3. Based on the severity of the missingness (amount of missingness, and potential bias based on its relationship with other variables), give a recommendation to the user:
   a. Delete the column
   b. Delete the affected rows only
   c. Impute (name the method and rationale)
   d. Keep the nulls
   e. Replace with an appropriate "N/A" value.

## Output

Return:

- A short overall summary.
- A compact table for affected columns: missing count, rate, mechanism, likely cause, confidence, and recommendation.
- A per-column decision prompt.
- Validation results after the user chooses actions.

Do not silently impute, drop rows, convert placeholders, or make a definitive MNAR claim. If no missingness is found, say so and stop.
