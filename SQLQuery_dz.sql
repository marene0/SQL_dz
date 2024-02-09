use Library;

CREATE TABLE Books (
    [Id] INT primary key,
    BookName VARCHAR(50),
    Author VARCHAR(50),
    Genre VARCHAR(50),
    [Year] INT,
    Price INT
);

INSERT INTO Books ([Id], BookName, Author, Genre, [Year], Price)
VALUES (1, 'normal people', 'Salli Rooney', 'Novel', 2018, 314 ), 
(2, 'theatre', 'william somerset maugham', 'Fiction', 1937, 200 ),
(3, 'zaduvliays v tvoi zinuci', 'sumomemko', 'romantic', 2018, 180 ),
(4, 'trusta poeziu', 'kostenko', 'romantic', 2019, 420 ),
(5, 'normal 123', 'Salli Rooney', 'Novel', 2018, 314 ),
(6, '2 stories', 'Salli Rooney', 'Novel', 2016, 220 );

CREATE TABLE Authors (
    [Id] INT primary key,
    Author VARCHAR(50),
    Gender VARCHAR(50),
    [Year] INT
);

INSERT INTO Authors ([Id], Author, Gender, [Year])
VALUES (1, 'Rilke', 'male', 1899), 
(2, 'Salli Rooney', 'female', 1869), 
(3, 'Kostenko', 'female', 1569), 
(4, 'Salli Rooney', 'female', 1869),
(5, 'Villiam Sommert', 'male', 1879), 
(6, 'Salli Rooney', 'female', 1869),  
(7, 'Sumonenko', 'male', 1877); 

CREATE TABLE Genres (
    [Id] INT primary key,
    BookName VARCHAR(50),
    Genre VARCHAR(50),
);

INSERT INTO Genres ([Id], BookName, Genre)
VALUES (1, 'normal people',  'Novel'), 
(2, 'theatre','Fiction'),
(3, 'zaduvliays v tvoi zinuci',  'romantic' ),
 (4, 'trusta poeziu',  'romantic' ),
 (5, 'normal 123', 'Novel'),
 (6, '2 stories', 'Novel');

SELECT *  FROM Books 
SELECT *  FROM Authors 
SELECT *  FROM Genres 

CREATE TRIGGER InsertGenreTrigger
ON Books
AFTER INSERT
AS
BEGIN
    INSERT INTO Genres ([Id], BookName, Genre)
    SELECT [Id], BookName, Genre FROM inserted;
END;

INSERT INTO Books ([Id], BookName, Author, Genre, [Year], Price)
VALUES (7, 'new book', 'Oleg Wine', 'Novel', 2002, 230 ); 

SELECT *  FROM Books 
SELECT *  FROM Genres 

SELECT SUM(Price) AS TotalPrice FROM Books;
