use sprk;
-- string functions 
select * from students;
-- concat function : to add two or more string values.
select concat(sname," - ",gender) as info from students;

-- length function:
select length(sname) as info from students;

-- lower and upper:
select lower(sname) as lowsname, upper(sname) as upsname
from students;

-- substring:
select substring(sname,1,3) as extra from students;

-- trim:
select trim("      aarav        ") as stud
, "         aarav      " as stud1;

-- insert:
SELECT INSERT("W3Schools.com", 1, 9, "Example") as info;

-- left: 
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;


-- right:
SELECT RIGHT("SQL Tutorial", 3) AS ExtractString;

-- locate:
SELECT LOCATE("8", "W3Schools.com") AS MatchPosition;

-- lpad:
SELECT LPAD("1452", 19, "xxxx-");

-- rpad:
SELECT RPAD("1452", 19, "xxxx-");

-- repeat
SELECT REPEAT("SQL Tutorial", 3);

-- replace 
SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

-- reverse
SELECT REVERSE("SQL Tutorial");

-- string compare
/*
If string1 = string2, this function returns 0
If string1 < string2, this function returns -1
If string1 > string2, this function returns 1
*/
SELECT STRCMP("SQL Tttorial", "SQL Tutorial");