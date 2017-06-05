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

SELECT users.name AS user_name, roles.name AS role_name
FROM users
  RIGHT JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM roles
  LEFT JOIN users ON users.role_id = roles.id;

-- write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name, e.first_name, e.last_name
FROM departments as d
  JOIN  dept_emp as de on d.dept_no = de.dept_no
  JOIN employees as e on e.emp_no = de.emp_no
JOIN dept_manager as dm on e.emp_no = dm.emp_no
WHERE dm.to_date > now()
ORDER BY d.dept_name;


-- Find the name of all departments currently managed by women.


-- Find the current titles of employees currently working in the Customer Service department.


-- Find the current salary of all current managers.