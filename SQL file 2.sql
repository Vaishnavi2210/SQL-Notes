-- to execute you can use shortcut => ctrl + enter
USE school;

SHOW TABLES;

USE school;
CREATE TABLE users(
    user_id INT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    password VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0)
    );
    
DESC users;

-- how can we remove column 
ALTER TABLE users DROP COLUMN email, DROP COLUMN password;

DROP TABLE IF EXISTS abcd;

ALTER TABLE users DROP COLUMN column1;

ALTER TABLE users
	RENAME COLUMN email TO email_id,
    RENAME COLUMN abcd TO xyz;
    
    RENAME TABLE customers TO users;
    
ALTER TABLE users
      ADD COLUMN mobile_no VARCHAR(13);
 
 ALTER TABLE users 
       MODIFY COLUMN mobile_no INT;
       
 -- RENAME TABLE customers to users      
 
 -- we cannot rename database directly 
 -- RENAME DATABASE school TO college;
 

DROP TABLE users;
 DESC students;

ALTER TABLE students
      ADD COLUMN password VARCHAR(13) AFTER name;
   
   ALTER TABLE students
     DROP COLUMN password;
     
   ALTER TABLE students
         ADD COLUMN password VARCHAR(13) FIRST;
       
 DESC students;    
 
 -- DQL
 SELECT * FROM students;
      
INSERT INTO students 
		VALUES("onkar@123",2, "Onkar", "Nagar", "onkar@gmail.com");
      
      
  ALTER TABLE students
		DROP COLUMN password;
   
  ALTER TABLE students
        ADD COLUMN city VARCHAR(20) AFTER name;
  
    ALTER TABLE students
        ADD COLUMN password VARCHAR(12);
      
     DESC students;
     
     
     CREATE TABLE users(
        user_id INT PRIMARY KEY,
        name VARCHAR(60) NOT NULL,
        email VARCHAR(60) UNIQUE,
        password VARCHAR(60),
        city VARCHAR(40) NOT NULL
        );
        
   -- 1.INSERT (DML)
   
   INSERT INTO users
          VALUES(1, "Onkar", "onkar@gmail.com", "onkar@123", "Nagar");
          
  
  INSERT INTO users(user_id, name, password, city)
          VALUES (2, "shubham", "shubham@123", "Nanded");
          
   INSERT INTO users
          VALUES
          (3, "Hanumant", "hanumant@gmail.com", "hanumant@123", "parbhani"),
		  (4, "Vaishnavi", "Vaishnavi@gmail.com", "vaishnavi@123", "Pune"),
		  (5, "Punit Superstar", "punit@gmail.com", "punit@123", "UP");
          
    -- 2. UPDATE (DML)
    
    UPDATE users SET city = "Gaziabad" WHERE user_id = 6;
   
   UPDATE users SET city = "Nanded", email = "shubham123@gmail.com"  WHERE user_id = 2;
  
  SELECT * FROM users;
   
   ALTER TABLE users 
   
   ADD COLUMN country VARCHAR(55);
          
   UPDATE users SET country = "India";       
          
      SET SQL_SAFE_UPDATES = 0;
      
-- DELETE (DML)


      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
