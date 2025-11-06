--  ******************* Practice DCL Commands ******************

-- DCL - DCL commands are used to control access and permissions to the data stored in a database.
          -- They manage who can access, modify, or delete the data
	-- Think of DCL as the security manager of your database.

-- When a Database Administrator (DBA) or authorized user wants to:
            -- Give permission to another user to run queries.
		    -- Restrict access for certain users.
		    -- Manage security of tables, views, or schemas.

USE practice;
	SELECT * FROM employees;

-- 1. GRANT Command  
        --  Gives privileges or access rights to a user.
        --  ex. To give a user permission to read (SELECT) data from a table:
        
			GRANT SELECT ON employees TO 'Robort'@'localhost';
     
      -- # GRANT Multiple Privileges
			 GRANT SELECT, INSERT, UPDATE ON employees TO 'vaishnavi'@'localhost';

      -- # GRANT All Privileges
            GRANt ALL PRIVILEGES ON company_db.* TO 'admin'@'localhost';
            
-- 2. REVOKE Command
        -- Removes previously granted privileges from a user.
        -- ex. To remove permissions that were given:
            
               REVOKE INSERT, UPDATE ON employees FROM 'vaishnavi'@'localhost';
               
          -- # Revoke All Privileges    
             --  REVOKE ALL PRIVILEGES ON company_db.* FROM 'admin'@'localhost';
             
	-- If you ever want to see all privileges for a user:
     SHOW GRANTS FOR 'user1'@'localhost';   
     
    --  if you want to remove a user completely (DBA-level command):
            DROP USER 'user1'@'localhost'; 
			
    -- +++++++++++++++++ Quesstion To Practice  +++++++++++++++++
    
-- Q. 1. Give a user named user1 permission to SELECT and INSERT data in the students table.
		   GRANT SELECT, INSERT ON students TO 'user1'@'localhost';

-- Q. 2. Revoke INSERT permission from user user1 on the students table.
            REVOKE INSERT ON students FROM 'user1'@'localhost';
            
-- Q. 3. Grant ALL privileges to user manager on a database named school_db.
            GRANT ALL PRIVILEGES ON school_db.* TO 'manager'@'localhost';
            
-- Q. 4. Revoke ALL privileges from user manager on the school_db database.
            REVOKE ALL PRIVILEGES ON school_db.* FROM 'manager'@'localhost';
            
-- Q. 5. Grant only UPDATE permission on employees table to user hr_user.
            GRANT UPDATE ON employees TO 'hr_user'@'localhost';