use sprk;
create table employee (
    empid int primary key,
    empname varchar(100) not null,
    gender char(1) not null check (gender in ('M', 'F')),
    dob date not null,
    email varchar(100) unique not null,
    phone varchar(15) unique not null,
    location varchar(100) not null,
    profession varchar(100) not null
);
desc employee;
insert into employee (empid, empname, gender, dob, email, phone, location, profession) values
(1, 'Mr. Rahul Sharma', 'M', '1990-05-12', 'rahul.sharma@gmail.com', '9876543210', 'Mumbai', 'Software Engineer'),
(2, 'Ms. Priya Mehta', 'F', '1992-08-20', 'priya.mehta@gmail.com', '9876543211', 'Pune', 'Data Analyst'),
(3, 'Mr. Amit Verma', 'M', '1988-12-03', 'amit.verma@gmail.com', '9876543212', 'Delhi', 'Project Manager'),
(4, 'Ms. Neha Singh', 'F', '1995-03-15', 'neha.singh@gmail.com', '9876543213', 'Bengaluru', 'UI Designer'),
(5, 'Mr. Karan Patel', 'M', '1991-07-25', 'karan.patel@gmail.com', '9876543214', 'Ahmedabad', 'Backend Developer'),
(6, 'Ms. Anjali Nair', 'F', '1993-10-05', 'anjali.nair@gmail.com', '9876543215', 'Kochi', 'HR Manager'),
(7, 'Mr. Siddharth Gupta', 'M', '1989-11-18', 'siddharth.gupta@gmail.com', '9876543216', 'Chennai', 'DevOps Engineer'),

(8, 'Ms. Meena Reddy', 'F', '1994-04-22', 'meena.reddy@yahoo.com', '9876543217', 'Hyderabad', 'QA Tester'),
(9, 'Mr. Vikram Desai', 'M', '1990-02-11', 'vikram.desai@yahoo.com', '9876543218', 'Surat', 'Business Analyst'),
(10, 'Ms. Ritika Kapoor', 'F', '1996-09-09', 'ritika.kapoor@yahoo.com', '9876543219', 'Noida', 'Frontend Developer'),
(11, 'Mr. Arjun Khanna', 'M', '1992-01-14', 'arjun.khanna@yahoo.com', '9876543220', 'Mumbai', 'Cloud Engineer'),
(12, 'Ms. Sneha Kulkarni', 'F', '1995-06-30', 'sneha.kulkarni@yahoo.com', '9876543221', 'Pune', 'Database Administrator'),
(13, 'Mr. Rohit Chawla', 'M', '1987-08-19', 'rohit.chawla@yahoo.com', '9876543222', 'Delhi', 'System Architect'),
(14, 'Ms. Pooja Bhatia', 'F', '1993-12-25', 'pooja.bhatia@yahoo.com', '9876543223', 'Bengaluru', 'Product Manager'),

(15, 'Mr. Manish Malhotra', 'M', '1991-05-08', 'manish.malhotra@example.com', '9876543224', 'Ahmedabad', 'Security Specialist'),
(16, 'Ms. Shreya Iyer', 'F', '1994-07-19', 'shreya.iyer@example.com', '9876543225', 'Chennai', 'Mobile App Developer'),
(17, 'Mr. Deepak Kumar', 'M', '1990-03-29', 'deepak.kumar@example.com', '9876543226', 'Kolkata', 'AI Engineer'),
(18, 'Ms. Kavita Joshi', 'F', '1992-11-02', 'kavita.joshi@example.com', '9876543227', 'Indore', 'SEO Specialist'),
(19, 'Mr. Nikhil Sinha', 'M', '1989-09-15', 'nikhil.sinha@example.com', '9876543228', 'Lucknow', 'Network Administrator'),
(20, 'Ms. Anita Das', 'F', '1995-02-27', 'anita.das@example.com', '9876543229', 'Guwahati', 'Content Writer');


select * from employee;
drop table employee;

-- 1. Extract the prefix from each employee name.(eg : Mr/Mrs/Dr).

select empid, substring_index(empname, ' ', 1) as prefix
from employee;

-- 2. Extract the domain name from the email address of each employee.

select empid, substring_index(email, '@', -1) as domain_name
from employee;

-- 3. Convert all employees name to uppercase.

select empid, upper(empname) as name_uppercase
from employee;

-- 4. Count the length of email address of each employee.

select empid, email, length(email) as email_length
from employee;

-- 5. Replace developer with Dev in employees occupation. (eg : Backend Dev/ Frontend Dev)

select empid, profession, replace(profession, 'Developer', 'Dev') as updated_profession
from employee;

-- 6. Check if employees email contain yahoo domain name.

select email, locate('yahoo', email) > 0 as has_yahoo
from employee;

-- 7. Concatenate name and occupation with a ',' of each employee.

select concat(empname, ' , ', profession) as name_with_profession
from employee;

-- 8. Get only the last 4 characters of each email address.

select right(email, 4) as last_4_chars
from employee;

-- 9. Remove spaces from starting of employee name if they have any.

select ltrim(empname) as trimmed_name
from employee;
