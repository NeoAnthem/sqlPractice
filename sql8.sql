use sprk;
select floor(1 + RAND() * 6) as random_number from dual LIMIT 10;

with recursive gen as (
  select 1 as n
  UNION ALL 
  select n + 1 from gen where n < 10
)
select n, floor(1+ RAND() * 6) as random_number from gen;

-- TCL:  TCl statements in mysql are used to manage transactions in a database.
-- A transaction is a set of one or more SQL statements that are executed together
-- so  that either all succeed(commit) or none take effect (rollback).
-- 1. To start a new transaction.
-- Start transaction;
-- or
-- BEGIN

-- 2. saves all the changes made in the current transaction permanently.
-- commit

-- 3.Undo all the changes made in the current transaction or reverts to the last
-- commit or savepoint 
-- rollback

-- 4. creates a checkpoint inside a transaction that you can rollback to.
-- savepoint sp1;

-- 5. autocommit
-- set autocommit = 0; -- disabled
-- set autocommit = 1; -- enabled

create table employees(
  eid int primary key,
  ename varchar(50),
  salary decimal(10,2)
);

start transaction;

select * from employees;
insert into employees (eid,ename,salary)
values
(1,"Ranveer",75000);
insert into employees (eid,ename,salary)
values
(2,"Rajveer",85000);

select * from employees;
-- oops! inserted wrong salary
rollback;

-- try again
start transaction;


insert into employees (eid, ename,salary)
values
(1, "Ranveer",75000);
insert into employees (eid,ename,salary)
values
(2, "Rajveer",89000);
select * from employees;

commit;

drop table employees;

create table employees(
  eid int primary key,
  ename varchar(50),
  salary decimal(10,2)
);

start transaction;


insert into employees (eid,ename,salary)
values
(1,"Ranveer",75000);
savepoint sp1;
select * from employees;
insert into employees (eid,ename,salary)
values
(2,"Rajveer",85000);
savepoint sp2;
select * from employees;
-- oops! inserted wrong salary
rollback to sp1;
select * from employees;

commit;

drop table employees;

create table employees(
  eid int auto_increment primary key,
  ename varchar(50),
  salary decimal(10,2)
);

delimiter //
  create procedure addemp(in en varchar(50), in sal decimal(10,2))
  begin
    start transaction;
    
    insert into employees(ename, salary) values (en, sal);
    
    commit;
  end //
delimiter ;

call addemp("Suraj",45000);

select * from employees;

delimiter //
  create procedure deductsalary(in eid int, in deduct_salary int)
  begin
    declare current_salary int;
    start transaction;
    select salary into current_salary from teacher where tid = eid;
    
    if current_salary - deduct_salary < 0 then
      rollback;
    else
      update teacher 
      set salary = salary - deduct_salary
      where tid = eid;
      commit;
    end if;
  end //
delimiter ;

call deductsalary(3,1200);

delimiter //
	create procedure insertAndSavepoint()
    begin
		start transaction;
        insert into teacher(tname, salary) values ("Sujal", 64000, 'M');
        savepoint sp1;
        insert into teacher(tname, salary) values ("Vijaya", 82000, 'F');
        savepoint sp2;
        rollback to sp1;
        commit;
	end //
delimiter ;
call insertAndSavepoint();

delimiter //
	create procedure safe_insert(in teach_name varchar(50), in sal int)
    begin
		declare exit handler for sqlexception
        begin
			rollback; -- will execute when query fails
		end;
		start transaction;
        insert into teacher (tname, salary) values (teach_name, sal);
        update teacher set salary = "ABC" where id = 1;
        commit;
	end //
delimiter ;

call safe_insert("Govinda", 72000);

-- Handle DividebyZero exception

delimiter //
  create procedure safe_division(in a int, in b int,out result decimal(10,2))
  begin
     declare exit handler for sqlexception
     begin
      set result = null; -- set safe value
     end;
     
     set result = a / b;
  end //
delimiter ;

set @x = 0;
call safe_division(1,0,@x);
select @x as result;

-- Handle DividebyZero exception

delimiter //
  create procedure safe_division1(in a int, in b int,out result decimal(10,2))
  begin
     declare exit handler for 1365
     begin
      set result = null; -- set safe value
     end;
     
     set result = a / b;
  end //
delimiter ;

set @x = 0;
call safe_division1(1,0,@x);
select @x as result;

-- Handle DividebyZero exception

delimiter //
  create procedure get_studentname(in id int,out name varchar(50))
  begin
     declare continue handler for not found
     begin
      set name = "no record found"; -- set safe value
     end;
     
     select sname into name from students where sid = id;
  end //
delimiter ;

set @x = 0;
call get_studentname(1,@x);
select @x as student_name;

