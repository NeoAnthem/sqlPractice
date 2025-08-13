
-- 1. Create a procedure count_students_in_course that accepts a course name as an IN parameter 
-- and returns the total number of students enrolled in that course as an OUT parameter.
-- Parameters:
-- IN course_name VARCHAR(100)
-- OUT student_count INT

delimiter //
	create procedure count_students_in_course(in course_name varchar(100), out student_count int)
    begin
		select count(s.sid) into student_count
        from student as s join course as c
        on s.cid = c.cid
        where c.cname = course_name;
    end //
delimiter ;

call count_students_in_course('css', @count_students);
select @count_students as student_count;

-- 2. Write a procedure calculate_hike that accepts a teacher’s ID and a hike percentage 
-- as IN parameters, and returns the new salary as an OUT parameter.
-- Parameters:
-- IN teacher_id INT
-- IN hike_percent DECIMAL(5,2)
-- OUT new_salary DECIMAL(10,2)

delimiter //
create procedure calculate_hike(
    in teacher_id int,
    in hike_percent decimal(5,2),
    out new_salary decimal(10,2)
)
begin
    declare current_salary decimal(10,2);

    -- get the current salary of the teacher
    select salary
    into current_salary
    from teacher
    where tid = teacher_id;

    -- calculate the new salary with hike
    set new_salary = current_salary + (current_salary * hike_percent / 100);
end //
delimiter ;

-- Example usage:
set @new_sal = 0;

call calculate_hike(7, 10.00, @new_sal); -- teacher id = 7, hike = 10%

select @new_sal as updated_salary;

-- 3. Create a calculator using procedure which can perform operations such as addition, 
-- subtraction, multiplication, division, square. Only one among them should be executed 
-- as per option provided in parameter. and value should to return for reuseability.

delimiter //
	create procedure calculator(in num1 decimal(10,2), 
		in num2 decimal(10,2), 
		in operation varchar(20), 
		out result decimal(10,2))
    begin
		case
			when operation = 'add' then 
				set result = num1 + num2;
			when operation = 'sub' then
				set result = num1 - num2;
			when operation = 'mul' then
				set result = num1 * num2;
			when operation = 'div' then 
				if num2 != 0 then 
					set result = num1 / num2;
				else 
					set result = null;
				end if;
        end case;
    end //
delimiter ;

set @result = 0;
call calculator(10,5,'add',@result);
select @result as answer;

-- 4. Student Grade Evaluator
-- Create a procedure that accepts a student's marks in a subject and returns:
-- "Distinction" if marks ≥ 75
-- "First Class" if marks between 60 and 74
-- "Second Class" if marks between 50 and 59
-- "Fail" otherwise
-- Use CASE inside the procedure.

delimiter //
create procedure student_grade_evaluator(in subject_marks decimal(10,2), 
	out subject_grade varchar(20))
    begin
		case
			when subject_marks >= 75 then
				set subject_grade = 'Distinction';
			when subject_marks < 75 and subject_marks >= 60 then
				set subject_grade = 'First Class';
			when subject_marks < 60 and subject_marks >= 50 then
				set subject_grade = 'Second Class';
			else
				set subject_grade = 'Fail';
        end case;
    end //
delimiter ;
drop procedure student_grade_evaluator;
call student_grade_evaluator(72, @grade);
select @grade as student_grade;

-- 5. Employee(teachers) Bonus Calculator
-- Create a procedure that accepts tid and bonus_percentage, 
-- calculates the bonus based on the employee's salary from the 
-- employees table, and returns the bonus amount as OUT parameter.
-- If the bonus percentage is NULL, set it to default 10%.

use sprk;
delimiter //
create procedure emp_bonus_calculator(in tiid int, 
	in bonus_percent decimal(10,2),
    out bonus_amt decimal(10,2))
    begin
		declare emp_salary decimal(10,2);
        
        select salary into emp_salary
        from teacher
        where tid = tiid;
        
        if bonus_percent is null then
			set bonus_percent = 10.00;
		end if;
        
        set bonus_amt = emp_salary * (bonus_percent / 100);
    end //
delimiter ;

drop procedure emp_bonus_calculator;
call emp_bonus_calculator(101, 15,@bonus);
select @bonus as bonus_amt;

call emp_bonus_calculator(6, 25,@bonus);
select @bonus as bonus_amt;

-- 6. Loan EMI Calculator
-- Write a procedure that takes:
-- Principal Amount
-- Rate of Interest
-- Time in Years
-- Returns the monthly EMI using the formula:
-- EMI = \frac{P \times r \times (1 + r)^n}{(1 + r)^n - 1}

delimiter //
	create procedure loan_emi_calculator(in principle_amt decimal(10,2),
    in rate_of_interest decimal(10,2),
    in time_in_years int,
    out monthly_emi decimal(10,2))
    begin
		declare monthly_interest decimal(10,2);
        declare total_months int;
        
        set total_months = time_in_years * 12;
        set monthly_interest = (rate_of_interest/100)/12;
        
        set monthly_emi = (principle_amt * monthly_interest * pow(1 + monthly_interest, time_in_years)) / (pow(1 + monthly_interest, time_in_years) - 1);
    end //
delimiter ;

drop procedure loan_emi_calculator;
call loan_emi_calculator(5000000,8,5, @emi);
select @emi as Monthly_EMI;

-- Banks need to calculate monthly EMI based on principal, interest rate, and tenure.
-- Formula:
-- EMI = \frac{P \times r \times (1+r)^n}{(1+r)^n - 1}
-- P = Principal
-- r = Monthly interest rate (annual rate / 12 / 100)
-- n = Number of months
