INSERT INTO authors (author_name)
VALUES 
('Stephenie Meyer'),
('J.K. Rowling');

INSERT INTO genres (genre_name)
VALUES 
('Fantasy'),
('Romance'),
('History');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES 
('Twilight', 2005, 1, 2),
('New Moon', 2006, 1, 2),
('Eclipse', 2007, 1, 2),
('Breaking Dawn', 2008, 1, 2),
('Life and Death', 2010, 1, 2),
('Midnight Sun', 2020, 1, 2),
("Harry Potter and the Philosopher's Stone", 1998, 2, 1),
('Harry Potter and the Chamber of Secrets', 1999, 2, 1),
('Harry Potter and the Prisoner of Azkaban', 1999, 2, 1),
('Harry Potter and the Goblet of Fire', 2000, 2, 1),
('Harry Potter and the Order of the Phoenix', 2003, 2, 1),
('Harry Potter and the Half-Blood Prince', 2005, 2, 1),
('Harry Potter and the Deathly Hallows', 2007, 2, 1);

INSERT INTO users (username, email)
VALUES 
('Ivan Ivanov', 'ivan.ivanov@gmail.com'),
('Tom Toman', 'tom.toman@gmail.com'),
('Alen Rolan', 'alen.rolan@gmail.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES 
(1, 1, '2024-06-12', '2024-07-02'),
(7, 2, '2024-05-17', '2024-06-22'),
(6, 3, '2024-07-12', NULL);


