-- SQL Assignment

CREATE DATABASE assignment;

USE assignment;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE
);

INSERT INTO students (student_id, name, email, enrollment_date) VALUES
(1, 'Alice Johnson', 'alice@email.com', '2023-01-15'),
(2, 'Bob Smith', 'bob@email.com', '2023-03-20'),
(3, 'Charlie Brown', 'charlie@email.com', '2022-08-12'),
(4, 'David White', 'david@email.com', '2024-02-05'),
(5, 'Eva Green', 'eva@email.com', '2023-05-25');

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE,
    duration INT, -- in weeks
    fee DECIMAL(10,2)
);
INSERT INTO courses (course_id, course_name, duration, fee, instructor_id) VALUES
(101, 'Web Development', 12, 15000),
(102, 'Data Science', 16, 20000),
(103, 'Cyber Security', 10, 18000),
(104, 'Machine Learning', 14, 22000),
(105, 'Cloud Computing', 12, 19000);

ALTER TABLE courses
  ADD COLUMN instructor_id INT,
  ADD CONSTRAINT
  FOREIGN KEY (instructor_id)
  REFERENCES instructors(instructor_id);
  
  
  UPDATE courses SET instructor_id = 1
     WHERE course_id = 101 OR course_id =102 OR course_id= 105;
  
  UPDATE courses SET instructor_id = 2
     WHERE course_id = 103 OR course_id =104 ;
     

     
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 101, '2023-01-16'),
(2, 102, '2023-03-21'),
(3, 103, '2022-08-13'),
(4, 101, '2024-02-06'),
(5, 104, '2023-05-26');

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO payments (student_id, amount_paid, payment_date) VALUES
(1, 15000, '2023-02-01'),
(2, 5000, '2023-03-25'),
(3, 18000, '2022-08-20'),
(4, 0, NULL),
(5, 22000, '2023-06-01');

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO instructors (instructor_id, name, email) VALUES
(1, 'John Miller', 'john.miller@email.com'),
(2, 'Sarah Brown', 'sarah.brown@email.com'),
(3, 'Mark Davis', 'mark.davis@email.com');



CREATE TABLE assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    status ENUM('Completed', 'Pending'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO assignments (student_id, course_id, status) VALUES
(1, 101, 'Completed'),
(2, 102, 'Pending'),
(3, 103, 'Completed'),
(4, 101, 'Pending'),
(5, 104, 'Completed');

## **Beginner Level Questions**

-- 1. **Retrieve the names and emails of all students.**
    -- *Hint:* Select specific columns from the `students` table.
    SELECT name, email FROM students;
    
-- 2. **List all courses along with their duration and fees.**
    -- *Hint:* Use `SELECT * FROM courses`.
    SELECT course_name, duration, fee FROM courses;
    
-- 3. **Find the total number of students enrolled in each course.**
    -- *Hint:* Use `COUNT()` with `GROUP BY`.
    SELECT  COUNT(*) , course_id
    FROM enrollments
    GROUP BY course_id;
    
    
-- 4. **Show the details of students who have enrolled in the "Web Development" course.**
    -- *Hint:* Use `JOIN` between `students` and `enrollments`.
    SELECT 
        students.name, 
        enrollments.course_id, 
        courses.course_name 
	FROM 
        students
    INNER JOIN 
        enrollments
    ON students.student_id = enrollments.student_id
    INNER JOIN
        courses
    ON courses.course_id = enrollments.course_id
    WHERE
        courses.course_name = 'Web Development';
   
    
-- 5. **Retrieve all students who have not made any payment.**
    -- *Hint:* Use `LEFT JOIN` and check for `NULL` payments.
SELECT  
     students.name,  
     payments.amount_paid
 FROM 
     students 
LEFT JOIN
	payments
ON students.student_id = payments.student_id
WHERE payments.amount_paid IS NULL;
    
    -- payments.amount_paid = 0.00;
    
 
 ## **Intermediate Level Questions**

-- 1. **Find the average payment amount made by students.**
    
 SELECT  AVG(amount_paid)
 FROM payments;
 
 
-- 2. **List all instructors who have not been assigned to any course.**
SELECT * FROM 
    instructors
LEFT JOIN 
    courses
ON instructors.instructor_id = courses.instructor_id
WHERE course_id IS NULL;    
 
 
-- 3. **Retrieve the details of students who have enrolled in more than one course.**
    -- *Hint:* Use `GROUP BY` and `HAVING COUNT(course_id) > 1`.
 SELECT 
 
 
-- 4. **Identify students who have completed all assignments.**
    -- *Hint:* Use `WHERE status = 'Completed'`.
 
 
 
-- 5. **Find the instructor who teaches the most courses.**
    -- *Hint:* Use `COUNT()` and `GROUP BY instructor_id`   
 
 
 
    ## **Advanced Level Questions**

-- 1. **Create a view that displays student names, course names, and enrollment dates.**
    -- *Hint:* Use `CREATE VIEW` with `JOIN`.
    
    
-- 2. **Write a stored procedure to enroll a student in a course.**
    -- *Hint:* Use `INSERT INTO enrollments` inside a procedure.


-- 3. **Create a trigger that prevents enrollment if a course is full (limit: 50 students).**
    -- *Hint:* Use `BEFORE INSERT` trigger with `COUNT()`.
    
    
-- 4. **Write a query to retrieve students who have made partial payments.**
    -- *Hint:* Compare `amount_paid` with `fee`.
    
-- 5. **Create an index on the `email` column in the `students` table to optimize searches.**
    -- *Hint:* Use `CREATE INDEX idx_email ON students(email)`.
    
    
-- 6. **Develop a stored procedure to update the payment status of a student.**
    -- *Hint:* Use `UPDATE payments` inside a procedure.
   
   
-- 7. **Write a query to retrieve students who have not made any payment within 30 days of enrollment.**
    -- *Hint:* Use `DATEDIFF()` in the `WHERE` clause.
    
-- 8. **Implement a trigger to prevent duplicate enrollments in the same course.**
    -- *Hint:* Use `BEFORE INSERT` trigger.
    
-- 9. **Retrieve the names of students who have completed all assignments but have not paid their full fee.**
    -- *Hint:* Use `JOIN` between `assignments` and `payments`.

-- 10. **Write a query to find students who are enrolled in at least one course taught by a specific instructor.**
    -- *Hint:* Use `JOIN` between `courses`, `enrollments`, and `instructors`.