-- Create customer table 
CREATE TABLE employee (
  id INT UNIQUE,
  name TEXT,
  department TEXT,
  position TEXT,
  salary REAL 
  );

-- Insert data
 INSERT INTO employee (id, name, department,position, salary, email)
 VALUES
    (1, 'David', 'Marketing', 'CEO', 100000),
    (2, 'John', 'Marketing', 'VP', 85000),
    (3, 'Marry', 'Sales', 'Manager', 60000)
 	  (4, 'Harry', 'IT', 'Senior Manager', 88000),
    (5, 'Walker', 'IT', 'Manager', 68000);

-- Select data
SELECT name,
  salary,
  salary * 1.15 AS new_salary,
  LOWER(name) ||'@company.com' AS company_email
 FROM employee;
 
 SELECT * FROM employee
 WHERE department = 'Marketing'
 AND salary > 90000; 

/* OR and IN operater 
 SELECT * FROM employee
WHERE department = 'Marketing' OR department = 'IT'; */

/* IN operater
SELECT * from employee
Where department IN ('Marketing','IT'); */

-- Update data
UPDATE MyEmployee
SET email = 'ceo@company.com'
WHERE ID = 1;

/* UPDATE employee
SET salary = 84000
WHERE id = 4;

SELECT * FROM MyEmployee; */

-- Delete data
DELETE from employee
where id IN (2,4);

-- Alter table
ALTER TABLE MyEmployee RENAME to employee;

-- Copy and drop table
CREATE TABLE employee_backup AS 
SELECT * FROM employee;

DROP TABLE employee_backup;
