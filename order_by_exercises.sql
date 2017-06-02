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

# Add a condition to find everybody with those names who is also male
SELECT count(*)
FROM employees
WHERE (first_name = 'Irena'
      OR first_name = 'Vidya'
      OR first_name = 'Maya')
GROUP BY gender;

-- Employees whose last name starts and ends with 'E'
SELECT concat(first_name, last_name)
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no DESC;

-- Employees hired in the 90s and born on xmas —
-- Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT *
FROM employees
WHERE birth_date like '%12-25'
AND hire_date LIKE '199%'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45;

SELECT concat(datediff(curdate(),hire_date), ' ', 'days')
FROM employees
WHERE birth_date like '%12-25'
      AND hire_date LIKE '199%';


-- other option is WHERE hire_date between '1990-01-01' AND '1999-12-31'

-- Employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT count(DISTINCT first_name), count(DISTINCT last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
ORDER BY first_name, last_name;

SELECT distinct first_name, last_name, count(last_name)
FROM employees
WHERE last_name LIKE '%q%'
      AND last_name NOT LIKE '%qu%'
GROUP BY first_name, last_name;

SELECT concat(emp_no, " - ", last_name, '', '', first_name) as full_name, birth_date as DOB
FROM employees
LIMIT 10;
