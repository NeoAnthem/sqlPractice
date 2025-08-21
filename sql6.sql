-- What is cursor?
-- A cursor is a database object that allows you to fetch and process query result rows one by one, especially 
-- useful within stored procedure.
-- It works like reading rows row-by-row from the query result set, much like reading line by line.


-- Why use cursor?
-- to process each row individually(not all at once).
-- When you want to perform calculations, condition or actions on each row.

-- Important Note:
-- You must also declare a handler to detect when there are no more rows to fetch:
-- declare continue handler for not found set done = true;
-- example:
use sprk;
delimiter //
  create procedure cursorExample()
  begin
    -- Declaring variables
    declare teachName varchar(50);
    declare tSalary  decimal(10,2);
    declare done int default false;
    
    -- Declaring cursorExample
    declare t_cursor cursor for 
    select tname,salary from teacher;
    
    -- declare handler when cursor has no more database
    declare continue handler for not found set done = true;
    
    -- Open the cursor
    Open t_cursor;
    
    -- LOOP to fetch and print each row 
    read_loop: loop
      fetch t_cursor into teachName, tSalary;
      if done then
        leave read_loop;
      end if;
      
      -- OUTPUT for each teachers
      select teachName as Teachers_name, tSalary as Teachers_salary;
      
    end loop;
    
    close t_cursor;
    
  end //
delimiter ;
drop procedure cursorExample;
call cursorExample();
use sprk;

create table employees1(
  empid int auto_increment primary key,
  empname varchar(50),
  salary decimal(10,2)
);

create table emp_log(
  log_id int auto_increment primary key,
  log text,
  log_current_date timestamp default current_timestamp
);

delimiter //
  create trigger after_emp_insert
  after insert on employees1
  for each row
  begin
    insert into emp_log(log) 
    values (concat("New employee added: ",
					new.empname," salary: ",
                    new.salary));
  end //
delimiter ;

delimiter //
create trigger salary_increment_update
before update on employees
for each row
begin
  if new.salary <= old.salary then
    signal sqlstate '45000'
      set message_text = 'Salary cannot be same or less than previously inserted salary on update.';
  end if;
end //
delimiter ;

update employees set salary = 70000 where empid = 1;
insert into employees1 (empname, salary) 
values ('Alice', 45000.50);

insert into employees1 (empname, salary) 
values ('Bob', 52000.75);

insert into employees1 (empname, salary) 
values ('Javier', 72000.65);

select * from employees1;
select * from emp_log;

-- Delete a specific log by log_id
delete from emp_log 
where log_id = 1;

-- Delete logs containing specific employee name
delete from emp_log
where log like '%Alice%';

-- Delete all logs
delete from emp_log;

-- Delete logs older than 7 days
delete from emp_log
where log_current_date < now() - interval 7 day;

select * from emp_log;
