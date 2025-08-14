-- 1. find the name of all teachers who have taught more than 3 students 
--    where the avg fees of the course they teach is greater than 3000 
--    and among their students at least 1 student is below the age of 21, 
--    also display:
--    a. teachers name
--    b. total number of students taught
--    c. course name
--    d. avg course fees
--    e. minimum students age under that teacher

select 
    t.tname as teacher_name, 
    count(s.sid) as total_students, 
    c.cname as course_name, 
    avg(c.fees) as avg_course_fees, 
    min(s.age) as min_student_age
from teacher t
join course c on t.cid = c.cid
join student s on s.cid = c.cid
group by t.tid, t.tname, c.cname
having count(s.sid) > 3 
   and avg(c.fees) > 3000 
   and min(s.age) < 21;

-- 2. find the students who are enrolled in the most expensive course 
--    offered by the institute, and whose teacher earns a salary above the 
--    average salary of all teachers.
--    Display:
--    - Student Name
--    - Teacher Name
--    - Course Name
--    - Course Fees
--    - Teacher Salary

select 
    s.sname as student_name, 
    t.tname as teacher_name, 
    c.cname as course_name,
    c.fees as course_fees, 
    t.salary as teacher_salary
from student s
join teacher t on s.cid = t.cid
join course c on t.cid = c.cid
where c.fees = (select max(fees) from course) 
  and t.salary > (select avg(salary) from teacher);
