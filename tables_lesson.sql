  -- Tables Lesson

USE codeup_test_db;

DROP TABLE IF EXISTS quote;
DROP TABLE IF EXISTS airport;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS users;

CREATE TABLE quotes (
author_first_name VARCHAR(50),
author_last_name VARCHAR (100) NOT NULL,
content TEXT NOT NULL,
created_at DATETIME_INTERVAL_CODE,
updated_at DATETIME_INTERVAL_CODE
);

CREATE TABLE airlines (
airport_code CHAR(3),
location VARCHAR (255),
description TEXT
);

CREATE TABLE people (
name VARCHAR (255) NOT NULL,
age DECIMAL(4, 1) NOT NULL
-- 7.6
-- 100.5
-- 1000.5 mysql would reject this type of number for age
);

CREATE TABLE users (
username VARCHAR (255) NOT NULL,
password VARCHAR (255) NOT NULL,
is_admin TINYINT NOT NULL
);

