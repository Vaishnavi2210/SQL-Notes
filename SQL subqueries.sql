-- ******************** SQL Subqueries *********************

--  What is a Subquery?  -> A subquery is a query inside another query.
                           -- It helps fetch intermediate results that can be used by the main query for filtering, aggregation, or calculation. It is also called a nested query.

-- Find employees earning more than the average salary.
      SELECT name, salary
      FROM employees
      WHERE salary > (SELECT AVG(salary) FROM employees);
      
-- Where can subqueries be used ?
-- > SELECT, FROM, WHERE, and HAVING

-- ************************ Types of Subqueries  *********************************

-- 1. Single-Row Subqueries (Returns one value)
         -- Used with =, >, <, >=, <= operators
         
  -- Q. Find employees earning the highest salary.
       SELECT name, salary
       FROM employees
       WHERE salary = (SELECT MAX(salary) FROM employees);
   
-- 2. Multi-Row Subqueries (Returns multiple rows)
        -- Used with IN, ANY, ALL.
        
     -- Q.  Find employees who work in the same department as 'John'.
     
     
-- 3. Correlated Subqueries (Depends on outer query) 

      -- Q. Find employees earning more than the average salary of their department.
      
       
       