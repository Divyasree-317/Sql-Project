SQL Operations on Country and Persons Tables

Overview :

This repository demonstrates various SQL operations on Country and Persons tables, showcasing join operations, distinct value extraction, duplicate listing, and data manipulation.

Tables Used
Country Table
Columns: CountryId (Primary Key), CountryName
Persons Table
Columns: PersonId (Primary Key), PersonName, CountryId (Foreign Key), Rating
Operations
Join Operations

INNER JOIN: Retrieves records where there is a match between the CountryId in both tables.
LEFT JOIN: Retrieves all records from Persons and matches from Country. Unmatched rows will have NULL for CountryName.
RIGHT JOIN: Retrieves all records from Country and matches from Persons. Unmatched rows will have NULL for PersonName.
Distinct Country Names

Lists unique country names across both tables using a UNION query.
All Country Names with Duplicates

Lists all country names, including duplicates, from both tables using UNION ALL.
Rounding Ratings

Rounds the Rating column in the Persons table to the nearest integer using the ROUND function.
