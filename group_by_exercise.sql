USE employees;

# Use DISTINCT to find the unique titles in the titles table.
SELECT DISTINCT title
FROM titles
GROUP BY title ASC;

SELECT @@GLOBAL.sql_mode;

# Update the previous query to sort the results alphabetically.

# Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY
SELECT DISTINCT last_name LIKE "E%E"
FROM employees
GROUP BY last_name ASC;

# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.


# Find the unique last names with a 'q' but not 'qu'. You may use either DISTINCT or GROUP BY.

#SELECT DISTINCT last_name LIKE '%q%'
 #               AND last_name NOT LIKE '%qu%';
#FROM employees
#GROUP BY last_name;