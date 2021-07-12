CREATE DATABASE Test;

USE TEST;

CREATE SCHEMA Book;

CREATE TABLE Book.Comment
		(
		CommentID int NOT NULL PRIMARY KEY,
		BooksID int NOT NULL REFERENCES Book.BookInformation(BooksID),
		Comment varchar(40)
		);
CREATE TABLE Book.BookInformation
		(
		BooksID int NOT NULL PRIMARY KEY,
		BooksISBN varchar(255) NOT NULL,
		BooksName varchar(255) NOT NULL,
		AuthorsID int NOT NULL REFERENCES Book.AuthorInformation(AuthorsID),
		PublishingHouse varchar(60) NOT NULL REFERENCES Book.PublishingHouse(PublishingHouse),
		BooksTypeID int NOT NULL REFERENCES Book.BookType(BooksTypeID),
		AvailableStatus varchar(40) NOT NULL
		);
CREATE TABLE Book.AuthorInformation
		(
		AuthorsID int NOT NULL PRIMARY KEY,
		FirstName varchar(40) NOT NULL,
		LastName varchar(40) NOT NULL,
		Gender varchar(40) NOT NULL,
		Nationality varchar(40) NOT NULL
		);
CREATE TABLE Book.BookType
		(
		BooksTypeID int NOT NULL PRIMARY KEY,
		Information varchar(40) NOT NULL
		);
CREATE TABLE Book.PublishingHouse
		(
		PublishingHouse varchar(60) NOT NULL PRIMARY KEY,
		Address1 varchar(60) NOT NULL,
		Address2 varchar(60) NOT NULL,
		ContactNumber int NOT NULL
		);

CREATE SCHEMA Rental;

CREATE TABLE Rental.BookCopy
		(
		CopyID int NOT NULL PRIMARY KEY,
		BooksID int NOT NULL REFERENCES Book.BookInformation(BooksID),
		Availability int,
		Location varchar(40) NOT NULL
		);
CREATE TABLE Rental.LibraryStaff
		(
		StaffID int NOT NULL PRIMARY KEY,
		FirstName varchar(40) NOT NULL,
		LastName varchar(40) NOT NULL,
		ConcatNumber int NOT NULL
		);
CREATE TABLE Rental.Render
		(
		ReturnID int NOT NULL  PRIMARY KEY,
		CopyID int NOT NULL REFERENCES Rental.BookCopy(CopyID),
		StudentID int NOT NULL REFERENCES Student.StudentInformation(StudentID),
		DueDate DATE not null,
		RenderDate DATE,
		OverDue date
		);

CREATE TABLE Rental.Rental
		(
		RentalID int NOT NULL  PRIMARY KEY,
		StudentID int NOT NULL REFERENCES Student.StudentInformation(StudentID),
		CopyID int NOT NULL REFERENCES Rental.BookCopy(CopyID),
		StaffID int NOT NULL REFERENCES Rental.LibraryStaff(StaffID),
		RentalDate date not null,
        Duedate date);
CREATE SCHEMA Student;

CREATE TABLE Student.StudentInformation
		(
		StudentID int NOT NULL PRIMARY KEY,
		FirstName varchar(40) NOT NULL,
		LastName varchar(40) NOT NULL,
		Gender varchar(40) NOT NULL,
		ContactNumber int NOT NULL,
		EmailAddress varchar(40) NOT NULL,
		College varchar(40) NOT NULL REFERENCES Student.CollegeInformation(College),
		CardNumber int NOT NULL REFERENCES Student.CardInformation(CardNumber)
		);
CREATE TABLE Student.CardInformation
		(
		CardNumber int NOT NULL PRIMARY KEY,
		Password varchar(20) NOT NULL,
		CardStatus varchar(20) NOT NULL
		);
CREATE TABLE Student.CollegeInformation
		(
		College varchar(40) NOT NULL PRIMARY KEY,
		Address1 varchar(60) NOT NULL,
		Address2 varchar(60) NOT NULL,
		ContactNumber int NOT NULL
		);
/*INSERT DATA*/
/*
*Book
*Including AuthorInformation, BookInformation, BookType, Comment, PublishingHouse
 */
-- AuthorInformation
INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1111,'Alan','Moore','Male','U.S.');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1112,'Mark','Waid','Male','U.S.');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1113,'Junji','Ito','Male','Japan');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1114,'Alessio','Pipinato','Female','Israel');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1115,'Galit','Shmueli','Female','Israel');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1116,'Thomas','Connoly','Male','U.S.');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1117,'Wilfried','Lemahieu','Male','Belgium');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1118,'Jack','Meredith','Male','U.S.');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1119,'Duan','Petkovi?','Male','German');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1120,'Richard','Daft','Male','U.S.');

UPDATE Book.AuthorInformation 
SET FirstName = 'Alessio', LastName = 'Pipinato', Gender = 'Male', Nationality = 'U.S.'
WHERE AuthorsID = 1115;

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1121,'Douglas','Adams','Male','U.S.');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1122,'	Bernard','Werber','Male','	France');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1122,'Bernard','Werber','Male','France');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1123,'NAHIROBY','BELTRE','FeMale','	France');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1124,'Melchizedek','Mistress Mehmuna Lemuria','FeMale','U.S');

INSERT INTO Book.AuthorInformation (AuthorsID,FirstName,LastName,Gender,Nationality)
VALUES (1125,'Hull','Janet','FeMale','U.S');
SELECT * FROM Book.AuthorInformation ai ;

-- BookInformation
SELECT * FROM Book.BookInformation bi ;
INSERT INTO Book.BookInformation 
VALUES (11,'9781401294052','The Killing Joke',1111,'DC Comics',01,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (12,'9781401220341','Kingdom Come',1112,'DC Comics',01,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (13,'9781974707096','No Longer Human',1113,'Viz Media',01,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (14,'9781118879368','Data Mining Foe Business Analytics',1114,'Wiley',02,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (15,'9780128235508','Innovative Bridge Design Handbook',1115,'Butterworth Heinemann',03,'Available');

INSERT INTO Book.BookInformation 
VALUES (16,'9780132943260','Database Systems-A Practical Approach to Design Implementation and Management',1116,'Pearson Education',02,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (17,'9781107186124','Principles Of DataBase Management',1117,'Cambridge University Press',02,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (18,'9781119369096','Project Management-A strategic Managerial Approach',1118,'Wiley',04,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (19,'9781259641800','Microsoft SQL Server 2016-A beginner Guide',1119,'codeMantra',02,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (20,'9781285861982','Management',1120,'South-Western College Pub',04,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (21,'0330287001','So Long, and Thanks for All the Fish',1121,'Harmony Books',01,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (22,'2226052577','Les Fourmis',1122,'Le Livre de Poche',05,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (23,'9781792366932','MUJER IMPORTANTE E INFLUYENTE',1123,'65 E. Wacker Pl',06,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (24,'9781792367144','Mistress Mehmuna Lemuria',1124,'65 E. Wacker Pl',07,'Available');

INSERT INTO Book.BookInformation (BooksID,BooksISBN,BooksName,AuthorsID,PublishingHouse,BooksTypeID,AvailableStatus)
VALUES (25,' 9781532333118','THE DAY THE TURKEY CAME TO SCHOOL',1125,'65 E. Wacker Pl',05,'Available');
-- PublishingHouse
INSERT INTO Book.PublishingHouse 
VALUES ('DC Comics','NY','1700 Broad Way',516);
INSERT INTO Book.PublishingHouse 
VALUES ('Viz Media','SF','1355 Market Street Suite 200',546);
INSERT INTO Book.PublishingHouse 
VALUES ('Wiley','NJ','111 River Street',748);
INSERT INTO Book.PublishingHouse 
VALUES ('Butterworth Heinemann','Oxford','Linacre House',441);
INSERT INTO Book.PublishingHouse 
VALUES ('Cambridge University Press','NY','One Liberty Plaza,20th Floor',442);
INSERT INTO Book.PublishingHouse 
VALUES ('codeMantra','Burlington','1500 District Ave',769);
INSERT INTO Book.PublishingHouse 
VALUES ('South-Western College Pub','Cincinnati','632 Vine St Ste 200',213);
INSERT INTO Book.PublishingHouse 
VALUES ('Pearson Education','BO','501 Boylston',617);
INSERT INTO Book.PublishingHouse 
VALUES ('Harmony Books','CA','130 Main St',564);
INSERT INTO Book.PublishingHouse 
VALUES ('Le Livre de Poche',' Paris','Le Livre de Poche Librairie Générale Française',3700);
INSERT INTO Book.PublishingHouse 
VALUES ('65 E. Wacker Pl',' IL','Chicago',1800);
SELECT * FROM Book.PublishingHouse ph ;

-- BookType
INSERT INTO Book.BookType 
VALUES (01,'Comic');
INSERT INTO Book.BookType 
VALUES (02,'Computer Application');
INSERT INTO Book.BookType 
VALUES (03,'Civil Engineering');
INSERT INTO Book.BookType 
VALUES (04,'Management');
INSERT INTO Book.BookType 
VALUES (05,'Novel');
INSERT INTO Book.BookType 
VALUES (06,'history');
INSERT INTO Book.BookType 
VALUES (07,'biography');
SELECT * FROM Book.BookType bt ;

-- Comment
INSERT INTO Book.Comment
VALUES 
(101, 11, 'Good'),
(102, 12, 'Perfect'),
(103, 13,'Not Bad'),
(104, 14, 'Awesome!'),
(105, 15, 'I like this comic!'),
(106, 16, 'It is very helpful to my study'),
(107, 17, 'A good book'),
(108, 18, 'It is very helpful'),
(109, 19, 'Boring'),
(110, 20, 'Perfect'),
(111, 21, 'Awesome!'),
(112, 22, 'Incredible!'),
(113, 23, 'Unbelievable!'),
(114, 24, 'Pretty Good!'),
(115, 25, 'I like this story!');
SELECT * FROM Book.Comment;


/*
 * Rental
 *Including BookCopy, LibraryStaff, Render, Rental
 */

 -- LibraryStaff
 INSERT INTO Rental.LibraryStaff 
 VALUES (111,'Bethany','Patrick',123);
 INSERT INTO Rental.LibraryStaff 
 VALUES (112,'Celia','Moody',124);
 INSERT INTO Rental.LibraryStaff 
 VALUES (113,'David','Howell',125);
 INSERT INTO Rental.LibraryStaff 
 VALUES (114,'Stella','Moreno',126);
 INSERT INTO Rental.LibraryStaff 
 VALUES (115,'Ernestine','Collier',127);
 INSERT INTO Rental.LibraryStaff 
 VALUES (116,'Josephine','Knight',128);
 INSERT INTO Rental.LibraryStaff 
 VALUES (117,'Rene','Bates',129);
 INSERT INTO Rental.LibraryStaff 
 VALUES (118,'Ramona','Wilkerson',130);
 INSERT INTO Rental.LibraryStaff 
 VALUES (119,'Mario','Sharp',131);
 INSERT INTO Rental.LibraryStaff 
 VALUES (120,'Phil','Pratt',132);
SELECT * FROM Rental.LibraryStaff ls ;

 -- BookCopy
-- Note that in the 'Availability' column '1' for 'available', '0' for unavailable.
SELECT * FROM Rental.BookCopy bc ;
INSERT INTO Rental.BookCopy 
VALUES(11,11,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(12,11,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(13,11,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(21,12,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(22,12,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(23,12,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(31,13,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(32,13,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(33,13,1,'A1');
INSERT INTO Rental.BookCopy 
VALUES(41,14,1,'B2')
	 ,(42,14,1,'B2')
	 ,(43,14,1,'B2')
	 ,(51,15,1,'C1')
	 ,(52,15,1,'C1')
	 ,(53,15,1,'C1')
	 ,(61,16,1,'B3')
	 ,(62,16,1,'B3')
	 ,(63,16,1,'B3')
	 ,(71,17,1,'B1')
	 ,(72,17,1,'B1')
	 ,(73,17,1,'B1')
	 ,(81,18,1,'D1')
	 ,(82,18,1,'D1')
	 ,(83,18,1,'D1')
	 ,(91,19,1,'B4')
	 ,(92,19,1,'B4')
	 ,(93,19,1,'B4')
	 ,(101,20,1,'D2')
	 ,(102,20,1,'D2')
	 ,(103,20,1,'D2');


-- Rental	
insert into Rental.Rental (RentalID,StudentID,CopyID,StaffID,RentalDate)
values
  (0001,2102,52,112,'2020-01-02'),
  (0002,2102,11,112,'2020-01-02'),
  (0003,2101,61,114,'2020-01-05'),
  (0004,2101,71,114,'2020-01-05'),
  (0005,2101,21,114,'2020-01-05'),
  (0006,2101,51,114,'2020-01-05'),
  (0007,2105,62,116,'2020-01-06'),
  (0008,2105,31,116,'2020-01-06'),
  (0009,2106,63,116,'2020-01-06'),
  (0010,2106,33,116,'2020-01-06'),
  (0011,2110,21,117,'2020-03-15'),
  (0012,2104,32,119,'2020-03-17'),
  (0013,2102,92,115,'2020-08-05'),
  (0014,2108,61,114,'2021-01-05');


/*
 *Student 
 */
-- CardInformation
INSERT INTO Student.CardInformation 
VALUES(12345,'zzasd','Active');
INSERT INTO Student.CardInformation 
VALUES(12341,'zzssd','Active');
INSERT INTO Student.CardInformation 
VALUES(12342,'zzqsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12343,'zzrtsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12344,'zzbsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12346,'zzcxsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12347,'zzvbsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12348,'zzvbsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12349,'zbvzsd','Active');
INSERT INTO Student.CardInformation 
VALUES(12350,'zzbversd','Active');
SELECT * FROM Student.CardInformation ci ;


-- CollegeInformation
INSERT INTO Student.CollegeInformation 
VALUES ('Engineering','BO','360 Huntington Ave',617);
INSERT INTO Student.CollegeInformation 
VALUES ('CS','BO','361 Huntington Ave',618);
INSERT INTO Student.CollegeInformation 
VALUES ('Health','BO','362 Huntington Ave',619);
INSERT INTO Student.CollegeInformation 
VALUES ('Business','BO','363 Huntington Ave',620);
INSERT INTO Student.CollegeInformation 
VALUES ('Art','BO','360 Huntington Ave',621);
SELECT * FROM Student.CollegeInformation ci ;

-- StudentInformation
INSERT INTO Student.StudentInformation 
VALUES (2101,'John','Wick','Male',511,'jw@gmail.com','Engineering',12341);
INSERT INTO Student.StudentInformation 
VALUES (2102,'Michael','Townly','Male',512,'mt@gmail.com','Engineering',12342)
	  ,(2103,'Trever','Philips','Male',513,'tp@gmail.com','CS',12343)
	  ,(2104,'Franklin','Deo','Male',514,'fd@gmail.com','CS',12344)
	  ,(2105,'Beyoneta','Beth','Female',515,'bb@gmail.com','Art',12345)
	  ,(2106,'Jill','Valentine','Femail',516,'jv@gmail.com','Business',12346)
	  ,(2107,'Chris','Redfield','Male',517,'cr@gmail.com','Health',12347)
	  ,(2108,'Laura','Croft','Female',518,'lc@gmail.com','Business',12348)
	  ,(2109,'Nathen','Drake','Male',519,'nd@gmail.com','Engineering',12349)
	  ,(2110,'Sam','Bridges','Male',520,'sam@gmail.com','Engineering',12350);
SELECT * FROM Student.StudentInformation si ;

-- Query 1: Find a book's Name and its Author Name which ISBN is 9780128235508
SELECT a.FirstName, a.LastName, b.BooksName
FROM book.authorinformation AS a  
INNER JOIN book.bookinformation AS b
ON b.AuthorsID = a.AuthorsID
WHERE b.BooksISBN = '9780128235508';
-- Query 2: Find the U.S Author's name and their Book's name
SELECT ai.FirstName, ai.LastName, bi.BooksName
FROM book.AuthorInformation ai 
INNER JOIN Book.BookInformation bi
ON bi.AuthorsID = ai.AuthorsID 
WHERE ai.Nationality = 'U.S.';
-- Query 3: Find which books about computer application
SELECT bi.BooksName
FROM book.BookInformation bi 
INNER JOIN Book.Booktype bt
ON bi.BooksTypeID = bt.BooksTypeID
WHERE bt.Information = 'Computer Application';
-- Query 4: Find some books which names contain 'Data' and show user the author name of these books
SELECT bi.BooksName, ai.FirstName, ai.lastName
FROM book.BookInformation bi
INNER JOIN book.authorinformation AS ai
ON bi.AuthorsID = ai.AuthorsID
WHERE bi.BooksName LIKE '%Data%';
-- Query 5: Given Card Number to find student's name 
SELECT si.FirstName, si.LastName, si.EmailAddress
FROM student.studentinformation as si
INNER JOIN student.cardinformation as sc
ON sc.CardNumber = si.CardNumber
WHERE sc.CardNumber = '12341';
-- Query 6: Given student ID to find student's name and college
SELECT FirstName, LastName, College
FROM student.studentinformation 
WHERE StudentID = '2103';
-- Query 7: Given staff ID to find the student ID which rent books from him
SELECT rr.StudentID
FROM rental.rental AS rr
INNER JOIN rental.librarystaff AS rl
ON rl.StaffID  = rr.StaffID
WHERE rl.StaffID = '112';
