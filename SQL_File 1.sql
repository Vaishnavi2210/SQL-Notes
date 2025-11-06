-- to execute you can use shortcut => ctrl + enter
CREATE DATABASE company;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'IT', 50000, '2020-06-15'),
('Alice', 'Smith', 'HR', 45000, '2019-03-20'),
('Robert', 'Johnson', 'Finance', 55000, '2018-11-10'),
('Emily', 'Davis', 'Sales', 40000, '2021-07-05'),
('Michael', 'Brown', 'IT', 60000, '2022-01-25'),
('Sarah', 'Wilson', 'Marketing', 48000, '2020-09-18'),
('David', 'Lee', 'Finance', 53000, '2017-12-30'),
('Jessica', 'Taylor', 'HR', 47000, '2016-05-14'),
('Daniel', 'Anderson', 'Sales', 39000, '2023-03-08'),
('Sophia', 'Martinez', 'IT', 58000, '2019-08-22');

SELECT * FROM employees;

SELECT first_name, salary FROM employees;

-- DISTINCT
SELECT DISTINCT department FROM employees;

-- >=
SELECT * FROM employees WHERE salary >= 40000;

-- <
SELECT * FROM employees WHERE salary < 40000;

-- =
SELECT * FROM employees WHERE department = "IT";

-- =
SELECT * FROM employees WHERE department = "Sales";

-- !=
SELECT * FROM employees WHERE department  != "IT";
-- AND 
SELECT * FROM employees WHERE department = "IT" AND salary > 55000;

-- OR
SELECT * FROM employees WHERE department = "IT" OR salary > 50000;

-- LIKE

SELECT * FROM employees WHERE first_name LIKE "J%";

SELECT * FROM employees WHERE first_name LIKE "%n";

SELECT * FROM employees WHERE first_name LIKE "%an%";
SELECT * FROM employees WHERE first_name LIKE "%n%";
SELECT * FROM employees WHERE first_name LIKE "%a%";

SELECT * FROM employees WHERE first_name LIKE "J___";

-- BETWEEN 
SELECT * FROM employees WHERE salary > 30000 AND salary < 500000;

SELECT * FROM employees WHERE salary BETWEEN 30000 AND 500000;

SELECT * FROM employees WHERE hire_date BETWEEN "2020-01-01" AND "2022-12-31";

-- IN
SELECT * FROM employees WHERE department IN ("HR" , "Finance" ,"IT") ;

-- NOT IN
SELECT * FROM employees WHERE department NOT IN ("HR" , "Sales") ;

--
SELECT * FROM employees WHERE first_name LIKE "-----" ;


----- ORDER BY

-- ASC
SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY department;
SELECT * FROM employees ORDER BY hire_date ASC;
SELECT * FROM employees ORDER BY first_name ASC;   

-- DESC  
SELECT * FROM employees ORDER BY salary DESC;

SELECT * FROM employees ORDER BY department ASC , salary DESC;
SELECT * FROM employees ORDER BY first_name ASC, salary DESC;

-- LIMIT , OFFSET 

SELECT * FROM employees ORDER BY salary DESC LIMIT 1;
 
 SELECT * FROM employees LIMIT 5;
 
 SELECT * FROM employees 
 ORDER BY salary DESC LIMIT 10;
 
 SELECT * FROM employees 
 WHERE department = "IT" LIMIT 3;
 
 SELECT * FROM employees 
 ORDER BY salary DESC LIMIT 1, OFFSET;
 
 SELECT * FROM employees 
 ORDER BY salary DESC LIMIT 5;
 
  SELECT * FROM employees LIMIT 5, OFFSET;
  
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;

SELECT * FROM employees 
 ORDER BY salary DESC LIMIT 5 OFFSET 5;
 
 
 

 


