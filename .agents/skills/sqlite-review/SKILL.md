---
name: sqlite-review
description: Inspect a SQLite database, identify evidence-backed data-quality issues, and select the appropriate cleaning skills. Use at the start of a data-quality review or when the schema is not understood.
---

# SQLite review

## Purpose

You want to understand what tables exist in the database, what their schemas look like, and what query will give you the dataset you want to clean. Claude helps you work this out. You write the final query into a Jupyter cell yourself and inspect the result in the DataFrame viewer.

## Procedure

1. Discover the database structure using the SQLite MCP tool.
2. Inspect the schema of the chosen table(s), and return this information to the user.
3. Ask the user what they want to achieve.
4. Based on the schema and the user's goal, draft a SQL query. Run this query and return the output.
5. If the user asks you to add a query to a Jupyter notebook, insert it into a cell in the notebook `notebooks/data-cleaning.ipynb` and execute the cell.