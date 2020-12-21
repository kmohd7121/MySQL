-- Basic Data Types in SQL
-- 1. INT		--Whole Number		
-- 2. DECIMAL(M,N) --Decimal Number - Exact value
-- 3. VARCHAR(N)	--String of text of length N  
-- 4. BLOB		--Binary Large Object, Stores large data
-- 5. DATE		--'YYYY-MM-DD'
-- 6. TIMESTAMP	--'YYYY-MM-DD HH:MM:SS' - used for recording

-- There are four sub-languages
 
-- 1. DDL (Data Defination Language)
CREATE
DROP
ALTER

-- 2. DQL (Data Query Language)
SELECT

-- 3. DML (Data Manipulation Language)
UPDATE
INSERT
DELETE

-- 4. DCL (Data Control Language)
GRANT
REVOKE


-- SQL is not case sensitive

-- This is use for show all database
SHOW DATABASES;

-- This  is use for create new database
CREATE DATABASE college; 

-- This is use for use this database
USE college;


-- Creating Database Table and define database schema
CREATE TABLE student (
	student_id INT AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	major VARCHAR(20) DEFAULT 'Undecided',
	PRIMARY KEY(student_id)
);


-- This is use for describe details about created taible
DESCRIBE student;


-- This is use for delete created table and all details.
DROP TABLE student;


-- This is use for add new column in a table
ALTER TABLE student ADD gpa DECIMAL(3,2);


-- This is use for drop a column in a table
ALTER TABLE student DROP COLUMN gpa;


-- Inserting Data in a Table
INSERT INTO student VALUES(1,'Jack','Biology');
INSERT INTO student VALUES(2,'Charle','Chemistry');
INSERT INTO student VALUES(3,'Kate','Computer');
INSERT INTO student VALUES(4,'Mike','Chemistry');
INSERT INTO student VALUES(5,'Claire','History');


INSERT INTO student (student_id,name) VALUES(6,'Kate');


-- This is for showing data from Table
SELECT * FROM student;


-- This is use for update value from table
UPDATE student
SET major='Bio'
WHERE major='Biology';

UPDATE student
SET major='Chem'
WHERE major='Chemistry';

UPDATE student
SET major='Chem'
WHERE student_id=1;

UPDATE student
SET major='Biochemistry'
WHERE major='Biology' OR major='Chemistry';

UPDATE student
SET name ='Tom', major='History'
WHERE student_id=2;

UPDATE student
SET major='Undecided';


-- This is use for delete a row from table
DELETE FROM student
WHERE student_id =3;

DELETE FROM student
WHERE name ='Tom' AND major='Undecided';



-- Basic Quires

-- This is use for show table details
SELECT *
FROM student;

SELECT name,major
FROM student;

SELECT student.name,student.major
FROM student;


-- This is use for show details in ascending ordered by name
SELECT student.name,student.major
FROM student
ORDER BY name;


-- This is use for show details in descending ordered by name
SELECT student.name,student.major
FROM student
ORDER BY name DESC;

SELECT *
FROM student
ORDER BY major,student_id;


-- This is use for show only 2 rows from table
SELECT *
FROM student
LIMIT 2;

SELECT *
FROM student
ORDER BY student_id DESC
LIMIT 2;


-- This is use for filtering 
SELECT *
FROM student 
WHERE major='Chemistry';

SELECT name, major
FROM student 
WHERE major='Chemistry' OR major= 'Biology';

SELECT name, major
FROM student 
WHERE major='Chemistry' OR name= 'Kate';


-- This is all are comparator operator use for more operations
-- < , > , <= , >= , = , <> , AND , OR
-- <> is use for != operator in sql
SELECT name, major
FROM student 
WHERE major<>'Chemistry'  


-- This is use for IN Keyword for find value from table
SELECT *
FROM student
WHERE name IN ('Claire','Kate','Mike');

SELECT *
FROM student
WHERE major IN ('Biology','Chemistry');

SELECT *
FROM student
WHERE major IN ('Biology','Chemistry') AND student_id > 2;

