CREATE SCHEMA LibraryManagement;
USE LibraryManagement;

CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(45) NOT NULL
);

CREATE TABLE genres (
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
	genre_name VARCHAR(45) NOT NULL
);

CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(45) NOT NULL,
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
     FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE   
);

CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(45) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE borrowed_books (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
	book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books (book_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
     FOREIGN KEY (user_id) REFERENCES users (user_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE     
);

