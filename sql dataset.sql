 
create table course (
    cid int not null primary key,
    cname varchar(25),
    fees decimal(10,2),
    duration varchar(25)
);

insert into course (cid, cname, fees, duration) values
(1, 'html', 2000.00, '15 days'),
(2, 'css', 3000.00, '25 days'),
(3, 'js', 6000.00, '40 days'),
(4, 'python', 22000.00, '60 days'),
(5, 'mysql', 9000.00, '30 days'),
(6, 'java', 45000.00, '75 days'),
(7, '.net', 30000.00, '90 days'),
(8, 'nodejs', 20000.00, '60 days'),
(9, 'reactjs', 15000.00, '30 days'),
(10, 'mongodb', 8000.00, '30 days');

desc course;
select * from course;

create table teacher (
    tid int not null,
    tname varchar(50) not null,
    age int,
    gender char(1) not null,
    phone varchar(50) not null,
    qualification varchar(50) not null default 'graduation',
    salary decimal(10,2) not null,
    cid int
);

insert into teacher (tid, tname, age, gender, phone, qualification, salary, cid) values
(1, 'vijay dinanath chauhan', 55, 'm', '+918873177692', 'bsc.cs', 50000.00, 3),
(2, 'prince jha', 29, 'm', '+918788763679', 'graduation', 100000.00, 5),
(3, 'ajay devgan', 35, 'm', '+918899100222', 'bca', 52000.00, null),
(4, 'mithun', 65, 'm', '+919778645123', 'b.ed', 51000.00, 8),
(5, 'srk', 62, 'm', '+918331864512', 'b.sc', 81000.00, 3),
(6, 'sunny deol', 64, 'm', '+919699860012', 'b.sc.cs', 88000.00, 1),
(7, 'rahul gandhi', 54, 'm', '+919699860000', 'm.sc.cs', 71000.00, 8),
(8, 'sunil shetty', 55, 'm', '+918874412360', 'm.ed', 71000.00, null),
(9, 'paresh rawal', 55, 'm', '+918877772360', 'b.sc.it', 76000.00, 8),
(10, 'brad pit(pitbull)', 58, 'm', '+919987172360', 'be.it', 83000.00, 2),
(11, 'john cena', 52, 'm', '+919987166312', 'b.sc.cs', 77000.00, 1),
(12, 'ritvik', 31, 'm', '+919987412350', 'be.cs', 79000.00, null),
(13, 'arijit singh', 38, 'm', '+918878412450', 'b.sc.cs', 87000.00, null),
(14, 'neha sharma', 35, 'f', '+919974612231', 'be.cs', 80000.00, 4),
(15, 'katrina kaif', 34, 'f', '+919974644632', 'be.it', 60000.00, 9),
(16, 'sukhminder singh', 43, 'm', '+919868763321', 'bca', 78000.00, 1);

desc teacher;
select * from teacher;

create table student (
    sid int not null primary key,
    sname varchar(20) not null,
    dob date,
    gender char(1) not null,
    email varchar(50) not null unique,
    tid int,
    cid int
);

insert into student (sid, sname, dob, gender, email, tid, cid) values
(1, 'sameer', '2005-12-10', 'm', 'sameer@gmail.com', 7, 8),
(2, 'sana', '1998-11-10', 'f', 'sana@gmail.com', 2, 5),
(3, 'arpita', '1900-11-06', 'f', 'arpita@gmail.com', null, 6),
(4, 'roham', '2000-01-27', 'm', 'rohan@gmail.com', 14, 4),
(5, 'aarav mehta', '2001-06-15', 'm', 'aarav.mehta@gmail.com', 6, 1),
(6, 'ishita roy', '2000-03-22', 'f', 'ishita.roy@gmail.com', null, 2),
(7, 'kabir khan', '1999-11-30', 'm', 'kabir.khan@gmail.com', 15, 9),
(8, 'meera nair', '2002-04-05', 'f', 'meera.nair@gmail.com', 1, 3),
(9, 'ananya patel', '2003-12-12', 'f', 'ananya.patel@gmail.com', null, 4),
(10, 'rohan gupta', '2000-05-09', 'm', 'rohan.gupta@gmail.com', 14, 4),
(11, 'sneha sharma', '1998-08-18', 'f', 'sneha.sharma@gmail.com', 11, 1),
(12, 'vikram rathore', '2001-09-25', 'm', 'vikram.rathore@gmail.com', 4, 8),
(13, 'priya sethi', '1997-07-17', 'f', 'priya.sethi@gmail.com', 10, 2),
(14, 'nikhil verma', '2002-03-14', 'm', 'nikhil.verma@gmail.com', 5, 3),
(15, 'divya mishra', '1999-01-11', 'f', 'divya.mishra@gmail.com', null, 5),
(16, 'siddharth jain', '2000-12-21', 'm', 'siddharth.jain@gmail.com', 9, 8),
(17, 'kriti singh', '2003-07-24', 'f', 'kriti.singh@gmail.com', 1, 1),
(18, 'aditya rao', '2002-10-10', 'm', 'aditya.rao@gmail.com', 10, 2),
(19, 'pooja yadav', '2001-02-26', 'f', 'pooja.yadav@gmail.com', null, 3),
(20, 'raj malhotra', '1998-06-19', 'm', 'raj.malhotra@gmail.com', 4, 4),
(21, 'sara ali', '1997-09-23', 'f', 'sara.ali@gmail.com', 2, 5),
(22, 'arjun desai', '2000-11-15', 'm', 'arjun.desai@gmail.com', 1, 1),
(23, 'naina kapoor', '1999-04-08', 'f', 'naina.kapoor@gmail.com', 14, 4),
(24, 'karan oberoi', '2001-01-29', 'm', 'karan.oberoi@gmail.com', 15, 9),
(25, 'ritika reddy', '2002-05-12', 'f', 'ritika.reddy@gmail.com', 6, 1);

desc student;
select * from student;

create table faculty (
    tid int not null,
    tname varchar(50) not null,
    age int,
    gender char(1) not null,
    phone varchar(50) not null,
    qualification varchar(50) not null default 'graduation',
    salary decimal(10,2) not null,
    cid int
);

insert into faculty (tid, tname, age, gender, phone, qualification, salary, cid) values
(1, 'vijay dinanath chauhan', 55, 'm', '+918873177692', 'bsc.cs', 50000.00, 3),
(2, 'prince jha', 29, 'm', '+918788763679', 'graduation', 100000.00, 5),
(3, 'ajay devgan', 35, 'm', '+918899100222', 'bca', 52000.00, null),
(4, 'mithun', 65, 'm', '+919778645123', 'b.ed', 51000.00, 8),
(5, 'srk', 62, 'm', '+918331864512', 'b.sc', 81000.00, 3),
(6, 'sunny deol', 64, 'm', '+919699860012', 'b.sc.cs', 88000.00, 1),
(7, 'rahul gandhi', 54, 'm', '+919699860000', 'm.sc.cs', 71000.00, 8),
(8, 'sunil shetty', 55, 'm', '+918874412360', 'm.ed', 71000.00, null),
(9, 'paresh rawal', 55, 'm', '+918877772360', 'b.sc.it', 76000.00, 8),
(10, 'brad pit(pitbull)', 58, 'm', '+919987172360', 'be.it', 83000.00, 2),
(11, 'john cena', 52, 'm', '+919987166312', 'b.sc.cs', 77000.00, 1),
(12, 'ritvik', 31, 'm', '+919987412350', 'be.cs', 79000.00, null),
(13, 'arijit singh', 38, 'm', '+918878412450', 'b.sc.cs', 87000.00, null),
(14, 'neha sharma', 35, 'f', '+919974612231', 'be.cs', 80000.00, 4),
(15, 'katrina kaif', 34, 'f', '+919974644632', 'be.it', 60000.00, 9),
(16, 'sukhminder singh', 43, 'm', '+919868763321', 'bca', 78000.00, 1);

desc faculty;
select * from faculty;

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
desc employee;
select * from employee;

create table newstudent (
    sid int not null primary key,
    sname varchar(20) not null,
    dob date,
    gender char(1) not null,
    email varchar(50) not null unique,
    tid int,
    cid int
);

insert into newstudent (sid, sname, dob, gender, email, tid, cid) values
(1, 'sameer', '2005-12-10', 'm', 'sameer@gmail.com', 7, 8),
(2, 'sana', '1998-11-10', 'f', 'sana@gmail.com', 2, 5),
(3, 'arpita', '1900-11-06', 'f', 'arpita@gmail.com', null, 6),
(4, 'roham', '2000-01-27', 'm', 'rohan@gmail.com', 14, 4),
(5, 'aarav mehta', '2001-06-15', 'm', 'aarav.mehta@gmail.com', 6, 1),
(6, 'ishita roy', '2000-03-22', 'f', 'ishita.roy@gmail.com', null, 2),
(7, 'kabir khan', '1999-11-30', 'm', 'kabir.khan@gmail.com', 15, 9),
(8, 'meera nair', '2002-04-05', 'f', 'meera.nair@gmail.com', 1, 3),
(9, 'ananya patel', '2003-12-12', 'f', 'ananya.patel@gmail.com', null, 4),
(10, 'rohan gupta', '2000-05-09', 'm', 'rohan.gupta@gmail.com', 14, 4),
(11, 'sneha sharma', '1998-08-18', 'f', 'sneha.sharma@gmail.com', 11, 1),
(12, 'vikram rathore', '2001-09-25', 'm', 'vikram.rathore@gmail.com', 4, 8),
(13, 'priya sethi', '1997-07-17', 'f', 'priya.sethi@gmail.com', 10, 2),
(14, 'nikhil verma', '2002-03-14', 'm', 'nikhil.verma@gmail.com', 5, 3),
(15, 'divya mishra', '1999-01-11', 'f', 'divya.mishra@gmail.com', null, 5),
(16, 'siddharth jain', '2000-12-21', 'm', 'siddharth.jain@gmail.com', 9, 8),
(17, 'kriti singh', '2003-07-24', 'f', 'kriti.singh@gmail.com', 1, 1),
(18, 'aditya rao', '2002-10-10', 'm', 'aditya.rao@gmail.com', 10, 2),
(19, 'pooja yadav', '2001-02-26', 'f', 'pooja.yadav@gmail.com', null, 3),
(20, 'raj malhotra', '1998-06-19', 'm', 'raj.malhotra@gmail.com', 4, 4),
(21, 'sara ali', '1997-09-23', 'f', 'sara.ali@gmail.com', 2, 5),
(22, 'arjun desai', '2000-11-15', 'm', 'arjun.desai@gmail.com', 1, 1),
(23, 'naina kapoor', '1999-04-08', 'f', 'naina.kapoor@gmail.com', 14, 4),
(24, 'karan oberoi', '2001-01-29', 'm', 'karan.oberoi@gmail.com', 15, 9),
(25, 'ritika reddy', '2002-05-12', 'f', 'ritika.reddy@gmail.com', 6, 1);

desc newstudent;
select * from newstudent;
