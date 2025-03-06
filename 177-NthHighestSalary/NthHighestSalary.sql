-- create
CREATE TABLE Employee (
  id INTEGER PRIMARY KEY,
  salary INTEGER NOT NULL
);

-- insert
INSERT INTO Employee VALUES (1, 100);
INSERT INTO Employee VALUES (2, 200);
INSERT INTO Employee VALUES (3, 300);

-- fetch 
SELECT * FROM Employee;


-- solution
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  IF N < 1 THEN 
    RETURN QUERY SELECT NULL::INT;
  ELSE
    RETURN QUERY (
      SELECT (
        SELECT DISTINCT Employee.salary FROM Employee ORDER BY Employee.salary DESC OFFSET N - 1 LIMIT 1
      )
    );
  END IF;
END;
$$ LANGUAGE plpgsql;

SELECT NthHighestSalary(2);
SELECT NthHighestSalary(-1);