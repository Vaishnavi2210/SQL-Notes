-- -------VIEWE------

USE practice;
DROP TABLE users;
CREATE TABLE users(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(60),
  password VARCHAR(60)
);

INSERT INTO users (id, name, email, password)
   VALUES
   (1, 'ram', 'ram@gmail.com', 'ram@1234'),
   (2,'shyam', 'shyam@gmail.com','shyam@123'),
   (3, 'natu', 'natu@gmail.com', 'natu@123'),
   (4,'babu bhaiya', 'babubhaiya@gmail.com', 'babu@123');
   
   SELECT * FROM users;
   
   INSERT INTO users
   VALUES
    (5, 'nikhil' , 'nikhil@gmail.com', 'nikhil@123');
   
   ALTER TABLE users ADD COLUMN salary INT;
   
   UPDATE users SET salary = 19 WHERE id = 5;
   UPDATE users SET salary = 10 WHERE id = 1;
  
  CREATE VIEW users_view AS
      SELECT id, name, email FROM users;
      
  SELECT * FROM users_views;
  
  -- CREATE VIEW 
  CREATE OR REPLACE VIEW users_view AS
      SELECT id, name FROM users;
      
      CREATE VIEW top_3_highest_salaries AS
        SELECT * FROM users ORDER BY salary DESC LIMIT 3;
        
 SELECT * FROM top_3_highest_salaries;
      
  
  
  UPDATE users_view
  SET email= 'babubhaiya@gmail.com'
  WHERE id = 4;
  
  DROP VIEW users_view;
  
  