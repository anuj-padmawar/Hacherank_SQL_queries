/*
Enter your query here.
*/
set @x:= 0;
select repeat('* ', @x:=@x+1) from information_schema.tables where @x<20


