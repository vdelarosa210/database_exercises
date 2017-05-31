USE codeup_test_db;

DROP IF EXISTS albums;

CREATE TABLE albums (
id INT (50),
artist VARCHAR (255) NOT NULL,
name VARCHAR (255) NOT NULL,
release_date DATETIME NOT NULL,
sales FLOAT (),
genre VARCHAR (255)
);