-- SQLite

--//ENABLE FORIGN KEY CONSTRAINT (SHOWID ALWAYS BE UNCOMMENTED)//

PRAGMA foreign_keys = ON;

----------------------------BOOKS--------------------------------------------
-----------------------------------------------------------------------------
--//CREATE TABLE 'BOOKS' INTO THE DATABASE//

CREATE TABLE books(
book_id INTEGER CHECK (book_id>0999) PRIMARY KEY AUTOINCREMENT,
book_title VARCHAR(20) NOT NULL,
author_name VARCHAR(20),
genre VARCHAR(20) NOT NULL,
book_place VARCHAR(20) NOT NULL,
available_quantity INT NOT NULL CHECK (available_quantity >=0),
borrowed_quantity INT DEFAULT 0 CHECK (borrowed_quantity >=0),
UNIQUE(book_title,author_name)
);

--//DELETE TABLE 'BOOKS' FROM THE DATABASE//

-- DROP TABLE books;

-------------------------INSERT INTO BOOKS---------------------------
--//DELETE ALL ROWS FROM THE DATA BASE =>BUT THE NEW DATA WHICH WILL BE INSERTED TO THE DATABASE//
--// WILL HAVE THE NEXT ID OF THE LAST DELETED DATA//

DELETE FROM books;

--//INSERT THE FIRST ITEAM INTO THE DATABASE//
INSERT INTO books (book_id,book_title,author_name,genre,book_place,available_quantity)VALUES(1000,'Nineteen Ways of Looking at Consciousness','Patrick House','Science','SC_SH1',2);

--//INSERT THE REST ITEAMS INTO THE DATABASE//

INSERT INTO books(book_title,author_name,genre,book_place,available_quantity) VALUES
('The Premonition: A Pandemic Story','Michael Lewis','Science','SC_SH1',4),
('Finding the Mother Tree: Discovering the Wisdom of the Forest','Suzanne Simard' ,'Science','SC_SH2',3),
('Genghis Khan and the Making of the Modern World','Jack Weatherford','History','HI_SH1',6),
('Leningrad: The Epic Siege of World War II, 1941-1944','Anna Reid' ,'History','HI_SH1',4),
('The History of the Ancient World','Susan Wise Bauer' ,'History','HI_SH2',2),
('Broken Lives: How Ordinary Germans Experienced the 20th Century','Konrad H. Jarausch','History','HI_SH2',3),
('Reprieve','James Han Mattson','Horror','HO_SH1',8),
('rankenstein','Mary Shelley','Horror','HO-SH1',3),
('It','Stephen King','Horror','HO_SH2',8),
('The Art of Travel','Alain de Botton','Travel','TR_SH1',7),
('On the Road','Jack Kerouac','Travel','TR_SH1',4),
('The Lost City of Z','David Grann','Travel','TR_SH2',3),
('Thinking, Fast and Slow','Daniel Kahneman','Business','BU_SH1',2),
('Business Adventures','John Brooks','Business','BU_SH1',5),
('How to Win Friends & Influence People','Dale Carnegie','Business','BU_SH2',4),
('The Intelligent Investor','Benjamin Graham','Business','BU_SH3',9),
('Emil and the Detectives','Erich Kästner','Children','CH_SH1',4),
('Liccle Bit','Alex Wheatle','Children','CH_SH1',2),
('Northern Lights','Philip Pullman','Children','CH_SH2',5),
('Noughts and Crosses','Malorie Blackman','Children','CH_SH2',2),
('Roll of Thunder, Hear My Cry','Mildred D. Taylor','Children','CH_SH3',8),
('A Beautiful Mind','Sylvia Nasar' ,'Biography','BI_SH1',3),
('Alexander Hamilton','Ron Chernow' ,'Biography','BI_SH1',4),
('Frida: A Biography of Frida Kahlo','Hayden Herrera' ,'Biography','BI_SH2',4),
('Into the Wild','Jon Krakauer' ,'Biography','BI_SH2',6),
('The Pioneer Woman Cooks: Food from My Frontier','Ree Drummond','Cooking','CO_SH1',2),
('The Barefoot Contessa Cookbook','Ina Garten','Cooking','CO_SH1',4),
('Essentials of Classic Italian Cooking','Marcella Hazan','Cooking','CO_SH2',8),
('Veganomicon: The Ultimate Vegan Cookbook','Isa Chandra Moskowitz','Cooking','CO_SH3',9),
('The Big Sleep','Raymond Chandler','Mystery','MY_SH1',2),
('Gone Girl','Gillian Flynn' ,'Mystery','MY_SH2',6),
('The Postman Always Rings Twice','James M. Cain' ,'Mystery','MY_SH2',4),
('In Cold Blood','Truman Capote' ,'Mystery','MY_SH3',3),
('Woman in White','Wilkie Collins' ,'Mystery','MY_SH4',10);

--//DELETE A ROW FROM BOOKS TABLE WHICH HAVE ID =1000//

-- DELETE FROM books WHERE book_id=1000;

 
---------------------SHOW BOOKS ITEAM'S-------------------------------------------
--//SHOW ALL ITEAMS OF THE DATABASE//

-- SELECT *FROM books;


--//SHOW ALL ITEAMS OF THE 'BOOKS' + BORROWED QUANTITY AND AVAILABLE QUANTITY//
 
-- SELECT books.*,
-- count(borrow.book_id) AS borrowed_quantity,
-- (books.quantity-count(borrow.book_id)) AS available_quantity
-- FROM books
-- LEFT JOIN borrow
-- ON books.book_id= borrow.book_id group by books.book_title
-- ORDER BY books.book_id ASC;


--//SHOW ALL ITEAMS THAT HAVE A GENRE EQUAL ='Science'//

-- SELECT *FROM books WHERE genre ='Science';

--//SHOW ALL ITEAMS THAT HAVE A TILE EQUAL ='It'// 

-- SELECT *FROM books WHERE book_title ='It';

-----------------------------MEMBERS----------------------------------------- 
-----------------------------------------------------------------------------

--//CREATE TABLE 'MEMBERS' INTO THE DATABASE//

CREATE TABLE members(
member_id INTEGER  PRIMARY KEY AUTOINCREMENT CHECK(member_id<1000) ,
member_name VARCHAR(20) NOT NULL,
member_phone TEXT NOT NULL UNIQUE 
CHECK (LENGTH(member_phone)==11 AND member_phone NOT GLOB '*[^0-9]*'
AND (SUBSTR(member_phone,1,3)=='010' OR SUBSTR(member_phone,1,3)=='011' 
OR SUBSTR(member_phone,1,3)=='012' OR SUBSTR(member_phone,1,3)=='015' )),
sub_startDate TEXT NOT NULL CHECK(sub_startDate IS DATE(sub_startDate)),
sub_endDate TEXT NOT NULL CHECK(sub_endDate IS DATE(sub_endDate)) 
);

--//DELETE TABLE 'MEMBERS' FROM THE DATABASE//

-- DROP TABLE members;

----------------------INSERT INTO MEMBERS----------------------------------------

--//DELETE ALL ROWS FROM THE DATA BASE =>BUT THE NEW DATA WHICH WILL BE INSERTED TO THE DATABASE//
--// WILL HAVE THE NEXT ID OF THE LAST DELETED DATA//

--DELETE FROM members;

--//INSERT ITEAMS INTO THE DATABASE//

INSERT INTO members (member_name,member_phone,sub_startDate,sub_endDate)VALUES 
('Ahmed Mohamed','01156089211','2022-04-27','2023-05-09'),
('Mohamed Sayed','01045064203','2022-05-03','2023-06-19'),
('Adam Ibrahim' ,'01535080403','2022-05-01','2023-06-24'),
('Nada Mohamed' ,'01267802302','2022-05-06','2023-06-30'),
('Sarah Hassan' ,'01546792021','2022-05-10','2023-08-09'),
('Alaa Gebril'  ,'01136840201','2022-05-13','2023-09-06');
 
 
--//DELETE A ROW FROM MEMBER TABLE WHICH HAVE ID =3//

-- DELETE FROM members WHERE member_id=3;


------------------------SHOW MEMBERS ITEAMS'S--------------------------------------

--//SHOW ALL ITEAMS OF THE DATABASE//

-- SELECT *FROM members;

--//SHOW ALL ITEAMS OF THE DATABASE + SUB_DAYSLEFT//

-- SELECT 
-- member_id,
-- member_name,
-- member_phone,
-- sub_startDate,
-- sub_endDate,
-- Cast ((
-- JULIANDAY(sub_endDate)-JULIANDAY('now')) As Integer)+1 AS sub_daysLeft
-- FROM members;

-----------------------------BORROW----------------------------------------
---------------------------------------------------------------------------

--//CREATE TABLE 'BORROW' INTO THE DATABASE//

CREATE TABLE borrow(
member_id INTEGER NOT NULL,
member_name VARCHAR(20),
member_phone TEXT  
CHECK (LENGTH(member_phone)==11 AND member_phone NOT GLOB '*[^0-9]*'
AND (SUBSTR(member_phone,1,3)=='010' OR SUBSTR(member_phone,1,3)=='011' 
OR SUBSTR(member_phone,1,3)=='012' OR SUBSTR(member_phone,1,3)=='015' )),
book_id INTEGER NOT NULL,
book_title VARCHAR(20)  ,
author_name VARCHAR(20) ,
borrowed_date TEXT NOT NULL CHECK(borrowed_date IS DATE(borrowed_date)),
return_date TEXT NOT NULL CHECK (return_date IS DATE(return_date)),
FOREIGN KEY(member_id) REFERENCES members(member_id) ON DELETE CASCADE ,
FOREIGN KEY(book_id) REFERENCES books(book_id) ON DELETE CASCADE,
PRIMARY KEY(member_id,book_id)
);

--//DELETE TABLE 'BORROW' FROM THE DATABASE//

DROP TABLE borrow;

-----------------------INSERT INTO BORROW------------------------------------

--//DELETE ALL ROWS FROM THE DATA BASE =>BUT THE NEW DATA WHICH WILL BE INSERTED TO THE DATABASE//
--// WILL HAVE THE NEXT ID OF THE LAST DELETED DATA//

DELETE FROM borrow;

--//INSERT THE ITEAMS INTO THE DATABASE//

DELETE FROM borrow WHERE member_id =3 AND book_id=1004;
 
INSERT INTO borrow (member_id,book_id,borrowed_date,return_date) VALUES
(1,1005,'2022-04-27','2022-05-26');
(4,100,'2022-04-29','2022-05-28');
(1,1000,'2022-04-29','2022-05-28');
(4,'1001','2022-05-01','2022-06-01'),
('4','1005','2022-05-02','2022-06-01'),
('5','1000','2022-05-10','2022-06-09'),
-- ('6','1000','2022-05-12','2022-06-11' ),
-- ('1','1005','2022-05-10','2022-06-09');
 

-- DELETE FROM borrow WHERE book_id =1005;

-----------------------SHOW BORROW ITEAM'S------------------------------------

--//SHOW ALL ITEAMS OF THE DATABASE//

--SELECT *FROM borrow;

--//SHOW ALL ITEAMS OF THE 'BORROW' DATABASE + BOOK_TITLE AND AUTHOR_NAME + BORROWED_DAYSLEFT//

-- SELECT 
-- member_id,
-- borrow.book_id,
-- books.book_title, 
-- borrowed_date,
-- return_date,
-- books.author_name,
-- Cast ((
-- JULIANDAY(return_date)-JULIANDAY('now')) As Integer)+1 AS borrowed_daysLeft
-- FROM borrow
-- JOIN books
-- ON borrow.book_id= books.book_id;


--//SHOW ALL ITEAMS OF THE 'BORROW' DATABASE + MEMBER_NAME AND BOOK_TITLE , AUTHOR_NAME + BORROWED_DAYSLEFT// 

-- SELECT 
-- borrow.member_id,
-- members.member_name,
-- borrow.book_id,
-- books.book_title, 
-- books.author_name,
-- borrowed_date,
-- return_date,
-- Cast ((
-- JULIANDAY(return_date)-JULIANDAY('now')) As Integer)+1 AS borrowed_daysLeft
-- FROM borrow
-- JOIN books
-- ON borrow.book_id= books.book_id
-- JOIN members
-- ON borrow.member_id=members.member_id;

 --------------------------------------------------------------------------
 --------------------------TRIGGERS----------------------------------------

 --//SHOW ALL TRIGGERS IN THE DATABASE//

-- select name from sqlite_master where type = 'trigger';


--//CREATE TRUGGER THAT A RAISE WHEN THERE IS NOT ENOUGH COPIES IN THE LIBRARY// 
--//WHEN TRYING TO INSERT INTO THE DATABASE//

-- CREATE TRIGGER not_enough_copies_insert
-- BEFORE INSERT 
-- ON borrow
-- BEGIN
--    SELECT
--       CASE: A Pandemic Story	Michael Lewis	4	Science	SC_SH1
--    WHEN 
--     (SELECT((SELECT 
--      COUNT(*) 
--      FROM borrow
--      WHERE book_id=NEW.book_id)
--      NOT BETWEEN 0 AND 
--     ((SELECT quantity FROM books WHERE books.book_id==NEW.book_id)-1))) THEN
--     RAISE(ABORT,'ERROR!..This book is not available in the library right now')
--     END;
-- END;

--//CREATE TRUGGER THAT A RAISE WHEN THERE IS NOT ENOUGH COPIES IN THE LIBRARY// 
--//WHEN TRYING TO UPDATE THE DATABASE//

-- CREATE TRIGGER not_enough_copies_update
-- BEFORE UPDATE 
-- ON borrow
-- BEGIN
--    SELECT
--       CASE
--    WHEN 
--     (SELECT((SELECT 
--      COUNT(*) 
--      FROM borrow
--      WHERE book_id=NEW.book_id)
--      NOT BETWEEN 0 AND 
--     ((SELECT quantity FROM books WHERE books.book_id==NEW.book_id)-1))) THEN
--     RAISE(ABORT,'ERROR!..This book is not available in the library right now')
--     END;
-- END;


-------------------------------------USED-----------------------------

CREATE TRIGGER plus_borrowed_quantity_insert
AFTER INSERT 
ON borrow
BEGIN
  UPDATE books
  SET available_quantity= available_quantity-1,
      borrowed_quantity= borrowed_quantity+1
  WHERE book_id =NEW.book_id;    
END;  
 

CREATE TRIGGER plus_borrowed_quantity_update
AFTER UPDATE OF book_id 
ON borrow
BEGIN
  UPDATE books
  SET available_quantity= available_quantity+1,
      borrowed_quantity= borrowed_quantity-1
  WHERE book_id =OLD.book_id;

   UPDATE books
  SET available_quantity= available_quantity-1,
      borrowed_quantity= borrowed_quantity+1
  WHERE book_id =NEW.book_id;
    
END; 

CREATE TRIGGER minus_borrowed_quantity_delete
AFTER DELETE 
ON borrow
BEGIN
  UPDATE books
  SET available_quantity= available_quantity+1,
      borrowed_quantity= borrowed_quantity-1
  WHERE book_id =OLD.book_id;    
END;  



CREATE TRIGGER set_extra_column_update
AFTER UPDATE OF member_id,book_id
ON borrow
BEGIN
  UPDATE borrow
    SET member_name =(SELECT member_name FROM members WHERE member_id =NEW.member_id),
    member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
      book_title =(SELECT book_title FROM books WHERE book_id =NEW.book_id),
      author_name =(SELECT author_name FROM books WHERE book_id =NEW.book_id)
      WHERE book_id =NEW.book_id AND member_id=NEW.member_id;
END;  


CREATE TRIGGER set_extra_column_insert
AFTER INSERT
ON borrow
BEGIN
  UPDATE borrow
    SET
       member_name =(SELECT member_name FROM members WHERE member_id =NEW.member_id),
       member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
      book_title =(SELECT book_title FROM books WHERE book_id =NEW.book_id),
      author_name =(SELECT author_name FROM books WHERE book_id =NEW.book_id)
      WHERE book_id =NEW.book_id AND member_id=NEW.member_id;
END;  
 
 


------------------------------------------------------------------------------------
-- CREATE TABLE borrow(
-- member_id INTEGER NOT NULL,
-- member_name VARCHAR(20),
-- member_phone TEXT  
-- CHECK (LENGTH(member_phone)==11 AND member_phone NOT GLOB '*[^0-9]*'
-- AND (SUBSTR(member_phone,1,3)=='010' OR SUBSTR(member_phone,1,3)=='011' 
-- OR SUBSTR(member_phone,1,3)=='012' OR SUBSTR(member_phone,1,3)=='015' )),
-- book_id INTEGER NOT NULL,
-- book_title VARCHAR(20)  ,
-- author_name VARCHAR(20) ,
-- borrowed_date TEXT NOT NULL CHECK(borrowed_date IS DATE(borrowed_date)),
-- return_date TEXT NOT NULL CHECK (return_date IS DATE(return_date)),
-- FOREIGN KEY(member_id) REFERENCES members(member_id) ON DELETE CASCADE ,
-- FOREIGN KEY(book_id) REFERENCES books(book_id) ON DELETE CASCADE,
-- PRIMARY KEY(member_id,book_id)
-- );

-- CREATE TRIGGER set_extra_column_insert
-- BEFORE INSERT
-- ON borrow
-- BEGIN
-- INSERT INTO borrow VALUES(NEW.member_id,
--   UPDATE borrow
--     SET member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
--     member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
--       book_title =(SELECT book_title FROM books WHERE book_id =NEW.book_id),
--       author_name =(SELECT author_name FROM books WHERE book_id =NEW.book_id)
--       WHERE book_id =NEW.book_id AND member_id=NEW.member_id;
--       SELECT RAISE(IGNORE);

-- END; 

-- CREATE TRIGGER set_extra_column_update
-- BEFORE UPDATE OF member_id,book_id
-- ON borrow
-- BEGIN
--   UPDATE borrow
--     SET member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
--     member_phone =(SELECT member_phone FROM members WHERE member_id =NEW.member_id),
--       book_title =(SELECT book_title FROM books WHERE book_id =NEW.book_id),
--       author_name =(SELECT author_name FROM books WHERE book_id =NEW.book_id)
--       WHERE book_id =NEW.book_id AND member_id=NEW.member_id;
--       SELECT RAISE(IGNORE);
-- END;  


  

--  CREATE TRIGGER not_enough_copies_insert
-- BEFORE INSERT 
-- ON borrow
-- BEGIN
--    SELECT
--       CASE
--    WHEN 
--     (SELECT available_quantity FROM books
--     WHERE book_id =NEW.book_id == 0) THEN
--     RAISE(ABORT,'ERROR!..This book is not available in the library right now')
--     END;
-- END;

-- CREATE TRIGGER not_enough_copies_update
-- BEFORE UPDATE OF book_id
-- ON borrow
-- BEGIN
--    SELECT
--       CASE
--    WHEN 
--     (SELECT available_quantity FROM books
--     WHERE book_id =NEW.book_id == 0) THEN
--     RAISE(ABORT,'ERROR!..This book is not available in the library right now')
--     END;
-- END;