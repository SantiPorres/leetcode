-- create
CREATE TABLE Employee (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  salary INTEGER NOT NULL,
  managerId INTEGER
);

-- insert
INSERT INTO Employee VALUES (1, 'Joe', 70000, 3);
INSERT INTO Employee VALUES (2, 'Henry', 80000, 4);
INSERT INTO Employee VALUES (3, 'Sam', 60000, NULL);
INSERT INTO Employee VALUES (4, 'Max', 90000, NULL);

-- fetch 
SELECT * FROM Employee;

-- solution
SELECT Employee.name as "Employee" FROM Employee 
LEFT JOIN Employee as Manager ON Employee.managerId = Manager.id 
WHERE Employee.salary > Manager.salary;