CREATE TABLE LIBRARY_BRANCH (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(255)
);

-- BORROWER Table
CREATE TABLE BORROWER (
    CardNo INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

-- PUBLISHER Table
CREATE TABLE PUBLISHER (
    PublisherName VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

-- BOOKS Table
CREATE TABLE BOOKS (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    PublisherName VARCHAR(100),
    FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName)
);

-- BOOK_AUTHORS Table
CREATE TABLE BOOK_AUTHORS (
    BookID INT,
    AuthorName VARCHAR(100),
    PRIMARY KEY (BookID, AuthorName),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID)
);

-- BOOK_COPIES Table
CREATE TABLE BOOK_COPIES (
    BookID INT,
    BranchID INT,
    Number_Of_Copies INT,
    PRIMARY KEY (BookID, BranchID),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID)
);

-- BOOK_LOANS Table
CREATE TABLE BOOK_LOANS (
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DateDue DATE,
    PRIMARY KEY (BookID, BranchID, CardNo),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID),
    FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
);
Insert Data:
sql
Copy code
-- LIBRARY_BRANCH
INSERT INTO LIBRARY_BRANCH (BranchID, BranchName, Address) VALUES
(1, 'Sharpstown', '123 Main St'),
(2, 'Westside', '456 Elm St'),
(3, 'Downtown', '789 Maple Ave'),
(4, 'Uptown', '101 Pine St'),
(5, 'Eastside', '202 Oak St'),
(6, 'Northside', '303 Cedar St');

-- BORROWER
INSERT INTO BORROWER (CardNo, Name, Address, Phone) VALUES
(1001, 'John Doe', '111 Birch St', '555-1111'),
(1002, 'Jane Smith', '222 Birch St', '555-2222'),
(1003, 'Alice Johnson', '333 Birch St', '555-3333'),
(1004, 'Bob Brown', '444 Birch St', '555-4444'),
(1005, 'Charlie Davis', '555 Birch St', '555-5555'),
(1006, 'Diana Evans', '666 Birch St', '555-6666'),
(1007, 'Frank Green', '777 Birch St', '555-7777'),
(1008, 'Grace Harris', '888 Birch St', '555-8888');

-- PUBLISHER
INSERT INTO PUBLISHER (PublisherName, Address, Phone) VALUES
('Penguin Random House', '1745 Broadway, New York, NY', '212-782-9000'),
('HarperCollins', '195 Broadway, New York, NY', '212-207-7000'),
('Macmillan', '120 Broadway, New York, NY', '646-307-5151'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY', '212-698-7000'),
('Hachette Book Group', '1290 Avenue of the Americas, New York, NY', '212-364-1100'),
('Scholastic', '557 Broadway, New York, NY', '212-343-6100'),
('McGraw-Hill', '1325 Avenue of the Americas, New York, NY', '212-512-2000'),
('Pearson', '330 Hudson St, New York, NY', '212-641-2400'),
('Wiley', '111 River St, Hoboken, NJ', '201-748-6000'),
('Oxford University Press', '198 Madison Ave, New York, NY', '212-726-6000');

-- BOOKS
INSERT INTO BOOKS (BookID, Title, PublisherName) VALUES
(1, 'The Lost Tribe', 'Penguin Random House'),
(2, '1984', 'HarperCollins'),
(3, 'To Kill a Mockingbird', 'Macmillan'),
(4, 'Pride and Prejudice', 'Simon & Schuster'),
(5, 'The Great Gatsby', 'Hachette Book Group'),
(6, 'Moby Dick', 'Scholastic'),
(7, 'War and Peace', 'McGraw-Hill'),
(8, 'Ulysses', 'Pearson'),
(9, 'The Odyssey', 'Wiley'),
(10, 'Crime and Punishment', 'Oxford University Press'),
(11, 'Anna Karenina', 'Penguin Random House'),
(12, 'The Catcher in the Rye', 'HarperCollins'),
(13, 'Brave New World', 'Macmillan'),
(14, 'The Brothers Karamazov', 'Simon & Schuster'),
(15, 'Madame Bovary', 'Hachette Book Group'),
(16, 'The Iliad', 'Scholastic'),
(17, 'The Sound and the Fury', 'McGraw-Hill'),
(18, 'Great Expectations', 'Pearson'),
(19, 'The Divine Comedy', 'Wiley'),
(20, 'Les Misérables', 'Oxford University Press');

-- BOOK_AUTHORS
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES
(1, 'John Doe'),
(2, 'George Orwell'),
(3, 'Harper Lee'),
(4, 'Jane Austen'),
(5, 'F. Scott Fitzgerald'),
(6, 'Herman Melville'),
(7, 'Leo Tolstoy'),
(8, 'James Joyce'),
(9, 'Homer'),
(10, 'Fyodor Dostoevsky'),
(11, 'Leo Tolstoy'),
(12, 'J.D. Salinger'),
(13, 'Aldous Huxley'),
(14, 'Fyodor Dostoevsky'),
(15, 'Gustave Flaubert'),
(16, 'Homer'),
(17, 'William Faulkner'),
(18, 'Charles Dickens'),
(19, 'Dante Alighieri'),
(20, 'Victor Hugo');

-- BOOK_COPIES
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies) VALUES
(1, 1, 5),
(2, 1, 3),
(3, 2, 2),
(4, 2, 4),
(5, 3, 3),
(6, 3, 2),
(7, 4, 5),
(8, 4, 2),
(9, 5, 3),
(10, 5, 4),
(11, 6, 2),
(12, 6, 3),
(13, 1, 4),
(14, 2, 5),
(15, 3, 2),
(16, 4, 3),
(17, 5, 2),
(18, 6, 4),
(19, 1, 3),
(20, 2, 5);

-- BOOK_LOANS
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES
(1, 1, 1001, '2023-01-01', '2023-01-15'),
(2, 1, 1002, '2023-01-05', '2023-01-20'),
(3, 2, 1003, '2023-01-10', '2023-01-25'),
(4, 2, 1004, '2023-01-15', '2023-01-30'),
(5, 3, 1005, '2023-01-20', '2023-02-04'),
(6, 3, 1006, '2023-01-25', '2023-02-09'),
(7, 4, 1007, '2023-01-30', '2023-02-14'),
(8, 4, 1008, '2023-02-01', '2023-02-16'),
(9, 5, 1001, '2023-02-05', '2023-02-20'),
(10, 5, 1002, '2023-02-10', '2023-02-25');

CREATE PROCEDURE GetLostTribeCopiesAtSharpstown
AS
BEGIN
    SELECT Number_Of_Copies
    FROM BOOK_COPIES
    WHERE BookID = (SELECT BookID FROM BOOKS WHERE Title = 'The Lost Tribe')
    AND BranchID = (SELECT Branch

 CREATE PROCEDURE GetLostTribeCopiesAtSharpstown
AS
BEGIN
    SELECT Number_Of_Copies
    FROM BOOK_COPIES
    WHERE BookID = (SELECT BookID FROM BOOKS WHERE Title = 'The Lost Tribe')
    AND BranchID = (SELECT Branch

    CREATE PROCEDURE GetBorrowersWithoutLoans
AS
BEGIN
    SELECT b.Name
    FROM BORROWER b
    LEFT JOIN BOOK_LOANS bl ON b.CardNo = bl.CardNo
    WHERE bl.CardNo IS NULL;
END;

CREATE PROCEDURE GetAllBooksAndAuthors
AS
BEGIN
    SELECT b.Title, ba.AuthorName
    FROM BOOKS b
    JOIN BOOK_AUTHORS ba ON b.BookID = ba.BookID;
END;

-- How many copies of "The Lost Tribe" are owned by the Sharpstown branch?
EXEC GetLostTribeCopiesAtSharpstown;

-- How many copies of "The Lost Tribe" are owned by each library branch?
EXEC GetLostTribeCopiesPerBranch;

-- Retrieve the names of all borrowers who do not have any books checked out.
EXEC GetBorrowersWithoutLoans;

-- Get all book titles and the authors' names.
EXEC GetAllBooksAndAuthors;