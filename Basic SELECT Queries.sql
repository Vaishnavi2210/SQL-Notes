-- 1. Basic SELECT Queries
USE practice;
-- Retrieve all columns from the employees table.
SELECT * FROM employees;

-- Retrieve only the first_name and salary from the employees table.
SELECT first_name, salary FROM employees;

-- Select unique departments from the employees table.
SELECT DISTINCT department
FROM employees;

-- Retrieve all employees whose salary is greater than 40,000.
SELECT * FROM employees
   WHERE salary > 40000;

-- Retrieve all employees who work in the "Sales" department.
SELECT * FROM employees
    WHERE department = 'Sales';

-- 2. Filtering Data (WHERE, LIKE, BETWEEN, IN, NOT IN)

-- Retrieve employees whose first_name starts with "J".
SELECT * FROM employees
   WHERE first_name LIKE 'J%';

-- Retrieve employees whose last_name ends with "n".
SELECT * FROM employees
    WHERE last_name Like '%n';

-- Retrieve employees whose first name contains "an" anywhere.
SELECT * FROM employees
   WHERE first_name LIKE '%an%';

-- Retrieve employees whose salary is between 30,000 and 50,000.
   SELECT * FROM employees
   WHERE salary BETWEEN 30000 AND 50000;
   
-- Retrieve employees who were hired between 2020-01-01 and 2022-12-31.
SELECT * FROM employees
  WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';

-- Retrieve employees who work in "HR", "Finance", or "IT" departments.
SELECT * FROM employees 
  WHERE department IN('HR', 'Finance', 'IT');

-- Retrieve employees who do not work in "HR" or "Sales".
SELECT * FROM employees 
WHERE  department NOT IN ('HR', 'Sales');

-- Retrieve employees whose first_name has exactly 5 characters.
SELECT * FROM employees
  WHERE first_name LIKE '_____';


-- 3.Sorting Data (ORDER BY)

-- 1. Retrieve employees sorted by salary in ascending order.
SELECT * FROM employees
ORDER BY salary ASC;

-- 2. Retrieve employees sorted by salary in **descending order**.
SELECT * FROM employees
  ORDER BY salary DESC;

-- 3. Retrieve employees sorted by `department` in **alphabetical order**.
SELECT * FROM employees
  ORDER BY department ASC;
  
-- 4. Retrieve employees sorted by `hire_date` with the **newest employees first**.
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 1;

-- 5. Retrieve employees sorted by `first_name` **in descending order**.
SELECT * FROM employees
ORDER BY first_name DESC;

-- 6. Retrieve employees sorted first by `department` (A-Z) and then by `salary` (highest first).
SELECT * FROM employees
ORDER BY department ASC, salary DESC 
LIMIT 1;

-- 4. ## **Limiting Data (`LIMIT`, `OFFSET`)**

-- 1. Retrieve the **first 5 employees** from the `employees` table.
SELECT * FROM employees
ORDER BY hire_date  ASC 
LIMIT 5;

-- 2. Retrieve the **top 10 employees** based on salary.
SELECT * FROM employees
  ORDER BY salary DESC
  LIMIT 10;

-- 3. Retrieve **only 3 employees** from the "IT" department.
SELECT * FROM employees
  WHERE department = 'IT'
  LIMIT 3;

-- 4. Retrieve employees **skipping the first 5 records** and **showing the next 5**.
SELECT * FROM employees LIMIT 5  OFFSET 5;

-- 5. Retrieve the last **5 employees** who were hired.
SELECT * FROM employees
  ORDER BY hire_date DESC
  LIMIT 5;

-- 6. Retrieve the **6th to 10th highest paid employees** using `LIMIT` and `OFFSET`.
SELECT * FROM employees 
   ORDER BY salary ASC
   LIMIT 5
   OFFSET 5;
  
--  5. ## **Combining Conditions (`AND`, `OR`, `NOT`)**

-- 1. Retrieve employees from the **IT department** with a salary greater than **40,000**.
SELECT * FROM employees 
  WHERE department = 'IT' AND salary > 40000;
  
-- 2. Retrieve employees who work in **HR** or have a salary less than **35,000**.
SELECT * FROM employees
  WHERE department = 'HR' OR salary < 35000;

-- 3. Retrieve employees who are **not** in the "HR" department and have a salary **greater than 50,000**.
SELECT * FROM employees
  WHERE NOT (department= 'HR') AND salary > 50000;
  
-- 4. Retrieve employees who were **hired before 2019** and belong to the "Sales" department.
SELECT * FROM employees
  WHERE hire_date < '2019-01-01' AND department = 'Sales';

-- 5. Retrieve employees who **do not work in IT** and have a **salary less than 30,000**.
  SELECT * FROM employees 
    WHERE NOT (department = 'IT') AND salary < 30000;
   





SELECT * FROM employees;

