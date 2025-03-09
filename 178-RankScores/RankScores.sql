-- create
CREATE TABLE Scores (
  id INTEGER PRIMARY KEY,
  score DECIMAL NOT NULL
);

-- insert
INSERT INTO Scores VALUES (1, 3.50);
INSERT INTO Scores VALUES (2, 3.65);
INSERT INTO Scores VALUES (3, 4.00);
INSERT INTO Scores VALUES (4, 3.85);
INSERT INTO Scores VALUES (5, 4.00);
INSERT INTO Scores VALUES (6, 3.65);


-- fetch 
SELECT * FROM Scores;

-- subquery
WITH distinct_scores AS (
  SELECT 
    DISTINCT ON (score) score,
    id
  FROM Scores ORDER BY score DESC
)
SELECT 
  score,
  id,
  ROW_NUMBER() OVER(ORDER BY score DESC) AS "rank"
FROM distinct_scores ORDER BY score DESC;


-- solution
WITH cte AS (
  WITH distinct_scores AS (
    SELECT 
      DISTINCT ON (score) score
    FROM Scores ORDER BY score DESC
  )
  SELECT 
    score,
    ROW_NUMBER() OVER(ORDER BY score DESC) AS "rank"
  FROM distinct_scores ORDER BY score DESC
) SELECT Scores.score, cte."rank" AS "rank" FROM Scores 
LEFT JOIN cte ON Scores.score = cte.score
ORDER BY score DESC;