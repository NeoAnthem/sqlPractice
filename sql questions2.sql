-- what is a view in mysql
-- a view is a virtual table in mysql based on the result of a select query.
-- it does not store data physically; instead, it stores the sql query and fetches data dynamically when accessed.
-- views are useful for security, simplification of complex queries, and data abstraction.

-- create a view that displays name and email from students table
create view student_view as
select sname, email
from student;

-- write a program to retrieve the data from the created view
select * from student_view;

-- update view of (2) if its updatable
update student_view
set email = 'sameer1@gmail.com'
where sname = 'Sameer';

-- check the structure of a created view in mysql
desc student_view;
-- or
show create view student_view;

-- wap to display the view of faculty earning more than 72000
create view high_salary_faculty as
select tname, salary
from faculty
where salary > 72000;

-- to retrieve data:
select * from high_salary_faculty;

-- wap to display the view joining student, course and faculty table
create view student_course_faculty as
select 
    s.sname as student_name,
    s.email as student_email,
    c.cname as course_name,
    f.tname as faculty_name
from student s
join course c on s.cid = c.cid
join faculty f on s.tid = f.tid;

-- to retrieve data:
select * from student_course_faculty;

-- wap to drop a created view if it exists
drop view if exists student_view;
