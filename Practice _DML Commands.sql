-- Practice - DML (Data Manipulation Language) Questions
-- DML includes INSERT, UPDATE, DELETE, SELECT statements.

-- 1. Inserting Data (INSERT)
-- Insert at least 5 records into the students table.

USE practice;

INSERT INTO students (name, email)
VALUES
('Trupti', 'truptinerkar@gmail.com'),
('Tejas', 'tnerkar@gmail.com'),
('Anushka', 'anerkar@gmail.com'),
('Kunal', 'knerkar@gmail.com'),
('Swaransh', 'snerkar@gmail.com');

-- 2. Updating Data (UPDATE)

-- Update the email of a student with id = 2.
UPDATE  students 
SET email = 'gayu1920@gmail.com'
WHERE id = 2;

-- Increase the age of all students by 1 year.
UPDATE students
SET age = age + 1;

-- Update the course_title of course_id = 3 to "Full Stack Development".
UPDATE courses
SET course_title = 'Full Stack Developer'
WHERE course_id = 3;

-- 3. Deleting Data (DELETE)
-- Delete the student whose id = 4.
DELETE FROM Students WHERE id = 4;

-- Remove all students who are older than 26.
DELETE FROM students WHERE id >=6;

DELETE FROM practice.students
WHERE age >26;

SELECT * FROM practice.students;

-- 4. Selecting Data (SELECT)
USE practice;
-- Fetch all students who are older than 20.
SELECT * FROM students WHERE age > 25;

-- Select students with email containing "gmail.com". 
SELECT * FROM students WHERE email LIKE '%@gmail.com%';

-- Retrieve students sorted by name in ascending order.
SELECT * FROM students 
ORDER BY name ASC;

