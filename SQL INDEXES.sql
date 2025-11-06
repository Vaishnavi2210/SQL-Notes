-- **************************** # SQL Indexes :******************************

-- 1️ What is an Index?   
-- > An Index in SQL is a special lookup table that the database uses to speed up data retrieval. 
--      It works like an index in a book, making searches faster by reducing the number of rows scanned.
 
 -- Without Index
SELECT * FROM employees WHERE name = 'John';
-- Without an index, the database scans the entire table(slow if there are millions of rows)

-- Example with an Index                -  we cannot modify index, have drop and recreate any changes required.

CREATE INDEX idx_name ON employees(name);

-- Now, the search is faster because the database looks up John in the index instead of scanning every row.

-- *** Types of Indexes
 -- 1. Primary Index(Automatically created on PRIMARY KEY)

         CREATE TABLE employees (
            id INT PRIMARY KEY,
            name VARCHAR(100),
            salary DECIMAL(10,2)
          );
          
 -- 2. Unique Index (Prevents Duplicate Values)
          -- Ensures all values in the indexed column are unique.

         CREATE UNIQUE INDEX idx_unique_email ON employees(email);

-- 3. Composite Index (Multi-Column Index)
          -- Used when searching by multiple columns frequently.
          
        CREATE INDEX  idx_name_department ON employees(name, department);
        
-- 4. Full-Text Index (For Searching Large Text Fields)
            -- Used for fast text searches in large text columns.
            
        CREATE FULLTEXT INDEX idx_description ON products(description);    
        
-- 5. **Clustered Index:**
              -- Stores data **physically sorted** based on the index.
              -- A table can have **only one clustered index** (usually on the `PRIMARY KEY`).
              
   --  **Non-Clustered Index:**
               -- Stores index **separately** from the table data.
               -- A table can have **multiple non-clustered indexes**.           
            
            

-- +++++++++++++++++ Questions for Practice  +++++++++++++++++++++++

 -- Q.1. Create an index on the 'name' column of the employees table.
           CREATE INDEX idx_name ON employees(name);
        
 -- Q.2. Create a composite index on 'name' and 'salary'.    
           CREATE INDEX idx_name_salary ON employees(name, salary);
           
 -- Q.3. Delete an existing index named idx_department;
           DROP INDEX idx_department ON employees;
           
 -- Q. 4. When should you avoid using indexes? 
 -- >      On small tables, On columns with high update or insert activity, On columns with low selectivity,or columns with many duplicate values.
           
 -- Q. 5. Create a unique index on the 'email' column to prevent duplicate values?
             CREATE UNIQUE INDEX idx_email ON employees(email);





       