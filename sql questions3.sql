-- 1. find all students enrolled in a course with fees greater than 5000.
select * from student 
where cid in (select cid from course where fees > 5000);

-- 2. list teacher names who are assigned to a course with duration more than "6 months".
select t.tname 
from teacher t 
join course c on t.cid = c.cid
where c.duration > '180 days';

-- 3. display all students whose assigned teacher's salary is greater than 40000.
select s.* 
from student as s
join teacher as t on s.cid = t.cid
where t.salary > 40000;

-- 4. show course names where at least one student is enrolled.
select cname 
from course 
where cid in (select distinct cid from student where cid is not null);

-- 5. list all students who are taught by teachers with a qualification of "masters".
select s.* 
from student as s
join teacher as t on s.cid = t.cid
where t.qualification like 'M%';

-- 6. display students whose teacher name starts with "a".
select * from student 
where cid in (select cid from teacher where tname like 'A%');

-- 7. get all teachers who are not assigned to any student.
select * from teacher 
where cid not in (select distinct cid from student where cid is not null);

-- 8. find students enrolled in the same course as student named "ravi".
select * from student 
where cid = (select cid from student where sname = 'Ravi' limit 1);

-- 9. display teachers who teach more than 5 students.
select t.tid, t.tname, count(s.sid) as total_students
from teacher as t
join student as s on t.cid = s.cid
group by t.tid, t.tname
having total_students > 5;

-- 10. list students enrolled in the most expensive course.
select s.* 
from student as s
where cid = (select cid from course order by fees desc limit 1);
