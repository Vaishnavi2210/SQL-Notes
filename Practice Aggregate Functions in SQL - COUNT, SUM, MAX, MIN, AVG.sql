-- practice Aggregate Functions in SQL - COUNT, SUM, MAX, MIN, AVG
USE company;
-- to create table

/* CREATE TABLE employees(
   emp_id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50) NOT NULL,
     employees department VARCHAR(10) NOT NULL,
     salary INT CHECK(salary > 10000),
     experience INT DEFAULT 0,
     joining_date DATE
 ); */
 
 CREATE TABLE employees(
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(10) NOT NULL,
     salary INT CHECK(salary > 10000),
     experience INT DEFAULT 0,
      joining_date DATE
 );

-- to insert some sample data

/* INSERT INTO employees VALUES 
(1, "Alice",   "HR",    50000, 5, "2018-06-10"),
(2, "Bob",     "IT",    60000, 3, "2020-07-15"),
(3, "Charlie", "IT",    55000, 4, "2019-08-20"),
(4, "Dave",    "HR",    NULL,  2, "2021-05-05"),
(5, "Eve" ,    "Sales", 70000, 7, "2016-04-25"),
(6, "Frank",   "IT",    65000, 6, "2017-03-10"),
(7, "Grace",   "Sales", 75000, 8, "2015-02-18");
*/
USE company;
INSERT INTO employees
  VALUES
  (1, "Alice",   "HR",    50000, 5, "2018-06-10"),
(2, "Bob",     "IT",    60000, 3, "2020-07-15"),
(3, "Charlie", "IT",    55000, 4, "2019-08-20"),
(4, "Dave",    "HR",    NULL,  2, "2021-05-05"),
(5, "Eve" ,    "Sales", 70000, 7, "2016-04-25"),
(6, "Frank",   "IT",    65000, 6, "2017-03-10"),
(7, "Grace",   "Sales", 75000, 8, "2015-02-18");
  
-- ## **Basic Aggregate Questions**

-- 1️. Count total employees in the company.**
   -- 👉 **Hint:** Use `COUNT()` on the table.


-- 2. Find the total salary paid to all employees.**
   -- 👉 **Hint:** Use `SUM()` on the `salary` column.


-- 3. Calculate the average salary of employees.**
    -- 👉 **Hint:** Use `AVG()` and make sure NULL salaries are handled properly.


-- 4. Find the highest and lowest salary in the company.**
   -- 👉 **Hint:** Use `MAX()` and `MIN()`.


-- 5. Count the number of employees in the IT department.**
  -- 👉 **Hint:** Use `COUNT()` with a `WHERE` condition.





## **Intermediate Aggregate Questions**

### Find the total number of employees in each department.**
    -- 👉 **Hint:** Use `COUNT()` with `GROUP BY`.



-- 7. Find the average salary in each department.**
   -- 👉 **Hint:** Use `AVG()` with `GROUP BY department`.



-- 8. Show departments where the average salary is more than 60,000.**
   -- 👉 **Hint:** Use `HAVING` with `AVG() > 60000`.



-- 9. Find the total salary paid to employees in each department, sorted in descending order.**
     -- 👉 **Hint:** Use `SUM()` with `GROUP BY department`, then sort using `ORDER BY`.



-- 10. Find the department with the highest total salary.**
   -- **Hint:** Use `SUM()`, `GROUP BY`, and `ORDER BY` with `LIMIT 1`.
   
   
   
   
   ## **Advanced Aggregate Questions**

### 11. Find the number of employees who have more than 5 years of experience.**
    -- 👉 **Hint:** Use `COUNT()` with `WHERE experience > 5`.



### 12. Find the average salary of employees who joined before 2018.**
   --  👉 **Hint:** Use `AVG()` with `WHERE joining_date < '2018-01-01'`.



### 13.Find the department with the highest average experience.**
   -- 👉 **Hint:** Use `AVG(experience)`, `GROUP BY`, and `ORDER BY DESC`.



### 14. Count how many employees have salaries greater than 60,000 in each department.**
   -- 👉 **Hint:** Use `COUNT()` with `GROUP BY department` and `HAVING SUM(salary) > 60000`.



### 15.Find the total salary paid per department, excluding departments with less than 2 employees.**
   -- 👉 **Hint:** Use `SUM(salary)`, `GROUP BY department`, and `HAVING COUNT(*) >= 2`.


   ## **Challenge Questions**

### 16. Find the employee with the second-highest salary.**
   -- 👉 **Hint:** Use `ORDER BY salary DESC LIMIT 1 OFFSET 1`.



### 17. Find the department where the oldest employee works.**
   -- 👉 **Hint:** Use `MIN(joining_date)` and `GROUP BY department`.



### 18. Find the top 3 departments with the highest total salary.**
    -- 👉 **Hint:** Use `SUM(salary)`, `GROUP BY department`, and `ORDER BY DESC LIMIT 3`.



### 19. Find employees who earn more than the average salary in their department.**
    -- 👉 **Hint:** Use `HAVING salary > AVG(salary)` inside a subquery.



### 20. Find the percentage of employees in each department.**
    -- 👉 **Hint:** Use `COUNT(*) / (SELECT COUNT(*) FROM employees) * 100`.
    
    
    