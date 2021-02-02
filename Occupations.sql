/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT [Doctor], [Professor], [Singer], [Actor] 
FROM   
    (
    SELECT ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) ROW_NO, 
    ISNULL(NULL,Name) as Name, Occupation
    FROM Occupations
    ) AS table1 
PIVOT
(
    MAX(Name)
    FOR Occupation IN ( [Doctor], [Professor], [Singer], [Actor])
) AS table2
ORDER BY ROW_NO;
