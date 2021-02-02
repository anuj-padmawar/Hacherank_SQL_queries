/*
Enter your query here.
*/
SET sql_mode='';
SELECT Start_date , End_date 
FROM
(
(SELECT Start_Date 
FROM Projects 
WHERE Start_date NOT IN(SELECT End_Date FROM Projects)) AS start_dates,

(SELECT End_Date 
FROM Projects 
WHERE End_date NOT IN(SELECT Start_Date FROM Projects)) AS end_dates
)

WHERE Start_Date<end_date
GROUP BY Start_Date
ORDER BY DATEDIFF(End_Date , Start_date) , Start_date;
