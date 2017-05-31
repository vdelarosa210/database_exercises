USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
id INT (50),
artist VARCHAR (255) NOT NULL,
name VARCHAR (255) NOT NULL,
release_date YEAR NOT NULL,
sales FLOAT (4, 2),
genre VARCHAR (255)
);