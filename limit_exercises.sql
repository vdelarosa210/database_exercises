USE employees;

-- List the first 10 distinct last name sorted in descending order.

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;


-- Find your query for employees born on Christmas and hired in the 90s from order_by_exercises.sql. Update it to find just the first 5 employees.



-- Update the query to find the tenth batch of results.