/*
Enter your query here.
*/
SELECT CONCAT(NAME,'(',SUBSTR(OCCUPATION,1,1),')') AS X FROM OCCUPATIONS ORDER BY X;


SELECT CONCAT('There are a total of ',COUNT(OCCUPATION),' ',LOWER(OCCUPATION),'s.')
FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION),OCCUPATION;
