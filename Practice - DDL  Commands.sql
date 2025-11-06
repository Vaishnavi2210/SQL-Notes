USE practice;

-- CREATE TABLE Students 

CREATE TABLE students(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(50) NOT NULL,
  age INT CHECK(age > 0),
  email VARCHAR(100) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
  INSERT INTO students(name, age, email)
  VALUES
  ('Vaishnavi Nerkar', 26, 'vaish123@gmail.com'),
   ('Gayatri Nerkar', 23, 'gayu19@gmail.com'),
    ('Jaydeep Nerkar', 26, 'jay28@gmail.com'),
     ('Rohan Patil', 28, 'rohan23@gmail.com'),
      ('Sneha Joshi', 26, 'snehajoshi@gmail.com');
      
-- CREATE TABLE courses    

CREATE TABLE courses(
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_name VARCHAR(50) NOT NULL,
  duration_months INT CHECK (duration_months > 0)
  );
  
  INSERT INTO courses(course_name, duration_months)
    VALUES
    ('FRONTEND DEVELOPER', 3),
     ('BACKEND DEVELOPER', 3),
      ('PYTHON DEVELOPER', 4),
       ('JAVA DEVELOPER', 4),
        ('Data Analysis', 3);  
        
-- ALTER TABLE

-- Add a new column phone_number (VARCHAR(15), Unique) to the students table.
ALTER TABLE students
     ADD COLUMN phone_number VARCHAR(50) UNIQUE;
     
-- Modify the name column in students to VARCHAR(100).
ALTER TABLE students
    MODIFY COLUMN name  VARCHAR(100);
 
 -- Rename the column course_name in courses to course_title.
 ALTER TABLE courses
 RENAME  COLUMN course_name TO course_title; 
     
-- Drop the column phone_number from the students table.

ALTER TABLE students
DROP COLUMN phone_number;

-- Dropping and Truncating Tables (DROP & TRUNCATE)

-- Remove the courses table completely.
DROP TABLE courses;

-- Remove all records from the students table but keep its structure.
TRUNCATE TABLE students;
-- DELETE

-- Constraints Practice

-- Create a table `teachers` with:
    -- `id` (Integer, Primary Key)
    -- `name` (VARCHAR(50), Not NULL)
    -- `email` (VARCHAR(100), Unique)
    -- `salary` (Integer, Default 50000, Check salary > 20000)

CREATE TABLE teachers(
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  salary INT DEFAULT 50000 CHECK(salary > 20000)); 

-- Insert a record in teachers and check whether constraints work properly.

INSERT INTO teachers(id, name, email, salary)
 VALUES
 (1, 'Sanjana Karve', 'sanjana@gmail.com', 30000),
  (2, 'Rama Navek', 'rama@gmail.com', 25000),
 (3, 'Kartik Bodhale', 'kartik@gmail.com', 60000),
 (4, 'Divyakshi Bodhale', 'divya@gmail.com', 55000);

DROP TABLE teachers;












        
        