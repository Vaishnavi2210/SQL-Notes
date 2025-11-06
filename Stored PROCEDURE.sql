--  ******************************    STORED PROCEDURE *****************************

 -- What is Stored Procedure ?  --> A Stored Procedure is a set of SQL statements stored in the database that can be executed repeatedly. 
                                     --  It helps in code reusability, performance optimization, and security.

SELECT * FROM practice.employees;

-- Instead of using select you can create procedure and call it.
CREATE PROCEDURE GetAllEmployees()
      SELECT * FROM employees;
      
CALL GetAllEmployees();


-- Stored Procedure with Parameters

CREATE PROCEDURE show_all_employees()
       SELECT * FROM employees;

CALL show_all_employees();

CREATE PROCEDURE top_salary_employees()
  SELECT * FROM employees ORDER BY salary DESC LIMIT 5;
  
CALL top_salary_employees();

--  Stored Procedure with Parameters ( IN, OUT, INOUT)

-- 1. IN Parameter (Passing Values to Procedure)

CREATE PROCEDURE select_emp_with_id(IN emp_id INT)
    SELECT * FROM employees WHERE id = emp_id;
    
    CALL select_emp_with_id(8);

CREATE PROCEDURE select_emp_with_id__or_name(IN emp_id INT, IN emp_name VARCHAR(60))
      SELECT * FROM employees
              WHERE id = emp_id
              OR first_name = emp_name;
              
      CALL select_emp_with_id__or_name(1, 'Vaishnavi');        
      

  -- 2. OUT Parameter (Returning Values)   -- create variable as @variable_name, first put output in that variable and then return using SELECT or USE.
  
  CREATE PROCEDURE max_emp_salary(OUT max_salary INT)
      SELECT MAX(salary) INTO max_salary FROM employees;
      
      CALL max_emp_salary(@highest_salary);
      
      SELECT @highest_salary;
      
      
      -- output salary  by employee id 
      CREATE PROCEDURE salary_from_id(IN emp_id INT, OUT emp_salary INT)
          SELECT salary INTO emp_salary FROM employees WHERE id = emp_id;
          
       CALL salary_from_id(4, @salary_from_emp4);
       
       SELECT @salary_from_emp4;
   
   -- 3. INOUT Parameter (Modify and Return Values)
  
  DELIMITER // -- ex.1
   CREATE PROCEDURE IncreaseSalary(INOUT salary DECIMAL(10,2))
    BEGIN
       SET salary = salary * 1.10;  -- Increase by 10%
    END //
   DELIMITER ;
   
   
DELIMITER // -- ex.2
    CREATE PROCEDURE increase_salary(INOUT emp_salary DECIMAL(10,2))
         SET emp_salary = emp_salary * 1.10;   -- increased by 10% can use 0.1 or 1.10
         
     SET @old_salary  = 50000;
     
     SELECT @old_salary;
     
     CALL increase_salary(@old_salary);
          SELECT @old_salary;

   
   DROP PROCEDURE increase_salary;  -- used to drop procedure bcoz we cannot modify or alter procedure if any changes required.
   
   -- 4. use of DELIMITER where no. of colan used.
   
   DELIMITER //
    CREATE PROCEDURE total_tables()
    BEGIN
        SELECT * FROM employees;
        SELECT * FROM courses;
        SELECT * FROM students;
        SELECT * FROM teachers;
        SELECT * FROM users;
    END//
    DELIMITER ;
    
    -- 5. Stored Procedure with Multiple Queries
    
    DELIMITER //
      CREATE PROCEDURE UpdateSalaryAndLog(In emp_id INT, IN new_salary DECIMAL(10,2))
	  BEGIN
         UPDATE employees SET salary = new_salary WHERE id = emp_id;
         
         INSERT INTO salary_log(employe_id, updated_salary, updated_at)
         VALUES (emp_id, new_salary, NOW());
      END //
    DELIMITER ;  
    
-- This updates the salary and logs the change into a separate table.
 
    CALL UpdateSalaryAndLog(3, 60000); 

   -- Deleting a Stored Procedure
      
      DROP PROCEDURE UpdateSalaryAndLog;
      
      
    -- Example to solve
    -- give new-salary of employee by id.
 DELIMITER //   
    CREATE PROCEDURE increase_emp_salary(IN emp_id INT, OUT new_salary INT)
    BEGIN 
     UPDATE employees SET salary = salary + (salary * 0.1)
       WHERE id = emp_id;
       SELECT Salary INTO new_salary WHERE id = emp_id;
     END//  
     
  DELIMITER ;      
   
   SELECT *  FROM employees WHERE id = 2;
   
   CALL increase_emp_salary(2, @new_salary);
   
   SELECT @new_salary;
   
    
    -- ************************ Questions for Practice  *************************
    
   --  Q1: Create a stored procedure named GetEmployeesByDepartment that retrieves employees based on department name.
   
         CREATE PROCEDURE GetEmployeesByDepartment(IN emp_department VARCHAR(60))
           SELECT * FROM Employees WHERE department = emp_department;
   
                 CALL GetEmployeesByDepartment('IT');   
                 
   -- Q.2 Write a stored procedure that calculates and returns the average salary of all employees.
    
           CREATE PROCEDURE Avg_Salary_Employee(OUT avg_salary DECIMAL(10,2))
                SELECT  AVG(salary) INTO avg_salary FROM employees;         
                
           CALL Avg_Salary_Employee(@avg_salary);
           SELECT @avg_salary;
        
    -- Q.3 Modify an employee’s salary by increasing it by 15% using an INOUT parameter.   SET salary = salary * 1.15;
          
          
     	-- @ Increase a specific employee’s salary by 15%
       DELIMITER // 
		CREATE PROCEDURE emp_new_salary(IN emp_id INT, INOUT new_salary DECIMAL(10,2))
          BEGIN
               UPDATE employees SET salary = salary * 1.15
               WHERE id = emp_id;
               SELECT salary INTO new_salary FROM employees WHERE id = emp_id;   
          END //
       DELIMITER ;   
    
         CALL emp_new_salary(1, @new_salary);
         SELECT @new_salary;   

    
    -- @ Increase salary of all employees by 15%
        
        DELIMITER //
           CREATE PROCEDURE increase_all_emp_salary(INOUT multiplier DECIMAL(4,2))
			  BEGIN
				 UPDATE employees
				 SET salary = salary * multiplier;

				 SELECT salary FROM employees WHERE deparment = 'IT';                            -- Display updated salaries FROM employees;
			  END //
          DELIMITER ;

SET @multiplier = 1.15;
-- Call the procedure
CALL increase_all_emp_salary(@multiplier);

SELECT @multiplier;
   
   
 --  Q.4  Delete a stored procedure named CalculateBonus.
   
   DROP PROCEDURE increase_all_emp_salary;  -- if this table exists use this.
   
   DROP PROCEDURE IF EXISTS  CalculateBonus;  -- if not confirm abot table present or not use EXISTS.
   
   
   
   -- ** 8️ Summary ** 
     -- Stored Procedures** improve performance and security.
     -- IN, OUT, and INOUT** parameters allow passing and returning values.
     -- Stored procedures** can execute multiple SQL statements together.
     -- Use stored procedures** for frequently used queries and business logic.