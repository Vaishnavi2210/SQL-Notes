USE practice;

SELECT * FROM practice.employees;

-- ### **Find employees who earn more than the average salary.**
    -- **Hint:** Use `AVG(salary)` in a subquery inside the `WHERE` clause.
SELECT AVG(COALESCE(salary, 0)) FROM employees;

SELECT * FROM employees 
WHERE salary > (SELECT AVG(COALESCE(salary, 0)) FROM employees);

-- ### **Q2: Find the department with the highest number of employees.**
   -- **Hint:** Use `COUNT(*)` in a subquery inside `HAVING`.
/* SELECT COUNT(*) FROM employees
GROUP BY department 
ORDER BY COUNT 
   -- WHERE */

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) = (
    SELECT MAX(dept_count)
    FROM (
        SELECT COUNT(*) 
        GROUP BY department
    ) AS subquery
);

-- Q. 3 **Find the employees who have the same salary as 'Alice'.**
     -- *Hint:** Use a subquery to get Alice’s salary and use `WHERE salary = (...)`.
 
SELECT first_name, department, salary
FROM employees
WHERE salary = (SELECT salary  FROM employees 
    WHERE first_name = 'Alice'
);


SELECT * FROM employees

-- Q.5  **Find the second highest salary.**
    -- *Hint:** Use `MAX(salary)` but exclude the highest salary using a subquery.

SELECT  MAX(salary) FROM employees;

SELECT * FROM 
 

