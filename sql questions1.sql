-- write mysql program to display count of students in each course 
select c.cname as course_name, count(s.sid) as student_count
from course c 
left join student s on c.cid = s.cid
group by c.cid, c.cname
order by student_count desc;

-- wap to display total salary paid to faculty per course.
select c.cname as course_name, sum(f.salary) as total_salary
from course c 
join faculty f on c.cid = f.cid
group by c.cid, c.cname
order by total_salary desc;

-- wap to display avg salary of faculty by qualification.
select f.qualification, avg(f.salary) as average_salary
from faculty as f
group by qualification
order by average_salary desc;

-- wap to display no. of male and females students.
select s.gender, count(*) as total_students
from student as s
group by gender;

-- wap to display the count of faculty per course.
select c.cname, count(f.tid) as total_faculty
from faculty as f 
join course as c on f.cid = c.cid
group by c.cname;

-- wap to display the list of courses with avg student age.
select c.cname, avg(timestampdiff(year, s.dob, now())) as avg_student_age
from student s
join course c on s.cid = c.cid
group by c.cname;

-- wap to display total fees collected per course.
select c.cname, sum(c.fees) as total_fees_collected
from student s
join course c on s.cid = c.cid
group by c.cname;

-- wap to display highest salary per qualification.
select qualification, max(salary) as highest_salary
from faculty
group by qualification;

-- wap to display no. of students assigned to each faculty.
select f.tid, f.tname, count(s.sid) as total_students
from faculty f
left join student s on f.tid = s.tid
group by f.tid, f.tname;

-- wap to display number of faculty who are above salary 50000 per course.
select c.cname, count(f.tid) as faculty_count
from faculty f
join course c on f.cid = c.cid
where f.salary > 50000
group by c.cname;

-- wap to display avg, min, max fees for all courses grouped by duration.
select duration, avg(fees) as avg_fees, min(fees) as min_fees, max(fees) as max_fees
from course
group by duration;

-- wap to display top 3 most popular courses (by student count).
select c.cname, count(s.sid) as student_count
from course c
join student s on c.cid = s.cid
group by c.cname
order by student_count desc
limit 3;

-- wap to display faculty-wise total students and avg salary in their assigned course.
select f.tname, count(s.sid) as total_students, avg(f.salary) as avg_salary
from faculty f
left join student s on f.tid = s.tid
group by f.tname;

-- wap to display no. of students per course per faculty.
select f.tname, c.cname, count(s.sid) as total_students
from faculty f
join course c on f.cid = c.cid
left join student s on f.tid = s.tid and f.cid = s.cid
group by f.tname, c.cname
order by c.cname, f.tname;

-- wap to display courses with less than 3 students.
select c.cname, count(s.sid) as total_students
from course c
left join student s on c.cid = s.cid
group by c.cname
having count(s.sid) < 3;
