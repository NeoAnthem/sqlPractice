use sprk;
-- string functions 
select * from students;
-- concat function : to add two or more string values.
select concat(sname, ' - ', gender) as info from students;

-- length function:
select length(sname) as info from students;

-- lower and upper:
select lower(sname) as lowsname, upper(sname) as upsname
from students;

-- substring:
select substring(sname, 1, 3) as extra from students;

-- trim:
select trim('      aarav        ') as stud,
       '         aarav      ' as stud1;

-- insert:
select insert('w3schools.com', 1, 9, 'example') as info;

-- left: 
select left('sql tutorial', 3) as extractstring;

-- right:
select right('sql tutorial', 3) as extractstring;

-- locate:
select locate('8', 'w3schools.com') as matchposition;

-- lpad:
select lpad('1452', 19, 'xxxx-');

-- rpad:
select rpad('1452', 19, 'xxxx-');

-- repeat
select repeat('sql tutorial', 3);

-- replace 
select replace('sql tutorial', 'sql', 'html');

-- reverse
select reverse('sql tutorial');

-- string compare
/*
if string1 = string2, this function returns 0
if string1 < string2, this function returns -1
if string1 > string2, this function returns 1
*/
select strcmp('sql tttorial', 'sql tutorial');
