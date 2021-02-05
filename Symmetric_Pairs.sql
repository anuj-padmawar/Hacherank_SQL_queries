/*
Enter your query here.
*/
(SELECT T1.X, T1.Y FROM Functions AS T1 
WHERE T1.X = T1.Y 
 GROUP BY T1.X, T1.Y 
 HAVING COUNT(*) > 1
)

UNION
(
SELECT T1.X, T1.Y 
FROM Functions AS T1
WHERE EXISTS(SELECT X, Y FROM Functions WHERE T1.X = Y AND T1.Y = X AND T1.X < X)
)
ORDER BY X;

