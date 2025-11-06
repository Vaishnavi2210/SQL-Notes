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
 
