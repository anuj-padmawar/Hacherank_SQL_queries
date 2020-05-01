/*
Enter your query here.
*/
SET @x:=21; 
SELECT REPEAT('* ', @x:=@x-1) 
FROM INFORMATION_SCHEMA.TABLES;
