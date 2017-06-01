USE employees;

# Employees with first names 'Irena', 'Vidya', or 'Maya' - 709 rows
SELECT
  first_name,
  last_name
FROM employees
WHERE first_name = 'Irena'
      OR first_name = 'Vidya'
      OR first_name = 'Maya'
ORDER BY last_name ASC, first_name ASC;

# Add a condition to find everybody with those names who is also male — 441 rows.
SELECT
  first_name,
  last_name,
  emp_no
FROM employees
WHERE (first_name = 'Irena'
      OR first_name = 'Vidya'
      OR first_name = 'Maya')
AND gender = 'M';

-- Employees whose last name starts or ends with 'E' — 7,330 rows.
SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no DESC;

-- Employees hired in the 90s and born on xmas — 362 rows.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date like '%12-25'
-- other option is WHERE hire_date between '1990-01-01' AND '1999-12-31'

-- Employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';