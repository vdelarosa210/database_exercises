USE employees;


# Employees with first names 'Irena', 'Vidya', or 'Maya' - 709 rows
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
or first_name = 'Maya';

SELECT first_name, last_name
FROM employees
WHERE first_name OR ('Vidya', 'Irena', 'Maya');


-- Employees whose last name starts with 'E' — 7,330 rows.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE "E%";


-- Employees hired in the 90s — 135,214 rows.
SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%';
-- other option is WHERE hire_date between '1990-01-01' AND '1999-12-31'

-- Employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';


-- Employees with a 'q' in their last name — 1,873 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';