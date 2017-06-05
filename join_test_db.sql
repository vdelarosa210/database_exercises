USE employees;

CREATE TABLE roles (
  id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name    VARCHAR(100) NOT NULL,
  email   VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED          DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', NULL),
  ('mike', 'mike@example.com', NULL);

SELECT *
FROM users
  JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
  LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
  RIGHT JOIN roles ON users.role_id = roles.id;

SELECT
  users.name AS user_name,
  roles.name AS role_name
FROM users
  LEFT JOIN roles ON users.role_id = roles.id;

SELECT
  users.name AS user_name,
  roles.name AS role_name
FROM users
  RIGHT JOIN roles ON users.role_id = roles.id;

SELECT
  users.name AS user_name,
  roles.name AS role_name
FROM roles
  LEFT JOIN users ON users.role_id = roles.id;

-- write a query that shows each department along with the name of the current manager for that department.

SELECT
  d.dept_name         AS 'Department Name',
  concat(e.first_name, ' ',
         e.last_name) AS 'Department Manager'
FROM departments AS d
  JOIN dept_emp AS de ON d.dept_no = de.dept_no
  JOIN employees AS e ON e.emp_no = de.emp_no
  JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
WHERE dm.to_date > now()
ORDER BY d.dept_name;

-- Find the name of all departments currently managed by women.
SELECT
  d.dept_name                            AS 'Department Name',
  concat(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM departments d
  JOIN dept_manager dm ON d.dept_no = dm.dept_no
  JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > now()
      AND e.gender = 'F'
ORDER BY d.dept_name ASC;

-- Find the current titles of employees currently working in the Customer Service department.

SELECT
  t.title  AS 'Title',
  count(*) AS 'Count'
FROM titles AS t
  JOIN employees AS e ON t.emp_no = e.emp_no
  JOIN dept_emp AS de ON e.emp_no = de.emp_no
  JOIN departments AS d ON de.dept_no = d.dept_no
WHERE t.to_date > now()
      AND de.to_date > now()
      AND d.dept_name = 'Customer Service'
GROUP BY t.title;

-- Find the current salary of all current managers.

SELECT
  d.dept_name                            AS 'Department Name',
  s.salary                               AS 'Salary',
  concat(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM salaries AS s
  JOIN employees AS e ON s.emp_no = e.emp_no
  JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
  JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE s.to_date > now()
      AND dm.to_date > NOW();

-- Find the name of the departments managed by women and the names of current women managers

SELECT *
FROM departments
WHERE dept_no IN (
  SELECT dept_no
  FROM dept_manager
  WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = 'F')
);

-- Using sub-queries
SELECT *
FROM employees
WHERE gender = 'F'
      AND emp_no IN (
  SELECT emp_no
  FROM dept_manager
  WHERE to_date > now()
);

-- SUB-QUERIES EXERCISE --

-- Find all the employees with the same hire date as employee 101010 using a sub-query.

SELECT *
FROM employees
WHERE hire_date IN (
  SELECT emp_no = 101010
  FROM employees
  WHERE hire_date = TRUE
);

-- Find all the titles held by all employees with the first name Aamod.

SELECT *
FROM employees
WHERE first_name = 'Aamod';

-- Find all the department managers that are female.



-- BONUS Find all the department names that have female managers.

SELECT *
FROM departments
WHERE dept_no IN (
  SELECT dept_no
  FROM dept_manager
  WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = 'F')
);