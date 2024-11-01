-- create
CREATE TABLE Employee (
  id INTEGER PRIMARY KEY,
  salary INTEGER
);

-- insert
INSERT INTO Employee VALUES (1, 100);
INSERT INTO Employee VALUES (2, 200);
INSERT INTO Employee VALUES (3, 300);

-- fetch 
--SELECT * FROM Employee ORDER BY salary DESC limit 1 offset 1;
--SELECT salary AS SecondHighestSalary FROM Employee ORDER BY salary DESC limit 1 offset 1;

-- SELECT salary AS "SecondHighestSalary"
-- FROM Employee ORDER BY salary DESC limit 1 offset 1;

-- SELECT (
-- SELECT salary FROM Employee 
-- ORDER BY salary DESC limit 1 offset 1 
-- ) AS "SecondHighestSalary";

-- submited solution
SELECT (
SELECT salary 
FROM Employee 
WHERE salary < (SELECT salary FROM Employee 
ORDER BY salary DESC limit 1) ORDER BY salary DESC limit 1
) AS "SecondHighestSalary";