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

