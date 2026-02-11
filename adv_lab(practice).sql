create database Adv_lab;
use Adv_lab;
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    available_copies INT
);
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    membership_type VARCHAR(50)
);
CREATE TABLE IssuedBooks (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books VALUES
(1, 'Java Programming', 'James Gosling', 'Programming', 650, 5),
(2, 'Python Basics', 'Guido van Rossum', 'Programming', 480, 3),
(3, 'Database System', 'Elmasri', 'Database', 720, 2),
(4, 'Operating System', 'Galvin', 'Computer', 550, 0),
(5, 'C Language', 'Dennis Ritchie', 'Programming', 400, 4);

INSERT INTO Members VALUES
(1, 'Rahul Sharma', 'Regular'),
(2, 'Anita Verma', 'Premium'),
(3, 'Amit Singh', 'Regular');

INSERT INTO IssuedBooks VALUES
(101, 1, 1, '2025-01-01', '2025-01-10'),
(102, 2, 3, '2025-01-05', '2025-01-12'),
(103, 3, 4, '2025-01-08', NULL);

DELIMITER $$

CREATE PROCEDURE ShowAllBooks()
BEGIN
    SELECT * FROM Books;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE BooksByCategory(IN p_category VARCHAR(50))
BEGIN
    SELECT *
    FROM Books
    WHERE category = p_category;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE CheckBookAvailability()
BEGIN
    SELECT 
        title,
        CASE 
            WHEN available_copies > 0 THEN 'Available'
            ELSE 'Not Available'
        END AS status
    FROM Books;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE IssueBook(IN p_book_id INT)
BEGIN
    UPDATE Books
    SET available_copies = available_copies - 1
    WHERE book_id = p_book_id
      AND available_copies > 0;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE TotalBooksInCategory(
    IN p_category VARCHAR(50),
    OUT total_books INT
)
BEGIN
    SELECT COUNT(*)
    INTO total_books
    FROM Books
    WHERE category = p_category;
END$$

DELIMITER ;

CALL TotalBooksInCategory('Programming', @total);
SELECT @total AS TotalBooks;

DELIMITER $$

CREATE FUNCTION CalculateFine(days_late INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN days_late * 5;
END$$

DELIMITER ;

SELECT issue_id, CalculateFine(4) AS fine
FROM IssuedBooks;

DELIMITER $$

CREATE FUNCTION BookDiscount(book_price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF book_price > 500 THEN
        RETURN book_price * 0.10;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

SELECT title, price, BookDiscount(price) AS discount
FROM Books;

SELECT title, price, BookDiscount(price) AS discount
FROM Books
WHERE BookDiscount(price) > 0;

DELIMITER $$

CREATE PROCEDURE IssuedBooksWithMembers()
BEGIN
    SELECT 
        i.issue_id,
        m.member_name,
        b.title,
        i.issue_date,
        i.return_date
    FROM IssuedBooks i
    JOIN Members m ON i.member_id = m.member_id
    JOIN Books b ON i.book_id = b.book_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION TotalFine(days_late INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN days_late * 5;
END$$

DELIMITER ;

SELECT 
    m.member_name,
    b.title,
    TotalFine(DATEDIFF(CURDATE(), i.return_date)) AS total_fine
FROM IssuedBooks i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
WHERE i.return_date IS NOT NULL
  AND CURDATE() > i.return_date;
  
  SHOW PROCEDURE STATUS WHERE Db = DATABASE();
  
-- Drop Procedure if Exists SHOWALLBOOKS;
-- Drop Function if EXISTS BookDiscount;

drop function TotalFine;


