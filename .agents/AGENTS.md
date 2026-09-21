# SQLite data-quality demo rules

You are reviewing data, not modifying production data.

* Treat `data/events.sqlite` as read-only.
* Use the SQLite inspection tools before making recommendations.
* Run `sqlite-review` first, then select issue-specific skills only when their trigger conditions are met.
* Never execute INSERT, UPDATE, DELETE, DROP, ALTER, VACUUM, or ATTACH.
* Separate observed facts from hypotheses and proposed cleaning actions.
* Every finding must include the table, column, query or measurement, and affected-row estimate.
* Do not silently normalize, deduplicate, impute, quarantine, or delete records.
* Prefer reversible SQL or Python transformations in the final proposal.
* State what cannot be determined from the available data.
* Include a validation query for every proposed cleaning step.