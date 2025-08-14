-- ===========================================
-- 1. Create a procedure count_students_in_course
-- Accepts a course name as IN parameter and returns 
-- the total number of students in that course as OUT parameter.
-- Parameters:
-- IN  course_name VARCHAR(100)
-- OUT student_count INT
-- ===========================================

delimiter //
create procedure count_students_in_course(
    in course_name varchar(100), 
    out student_count int
)
begin
    select count(s.sid) 
    into student_count
    from student as s 
    join course as c on s.cid = c.cid
    where c.cname = course_name;
end //
delimiter ;

-- Example usage:
call count_students_in_course('css', @count_students);
select @count_students as student_count;


-- ===========================================
-- 2. Create a procedure calculate_hike
-- Accepts teacher ID and hike percentage as IN parameters
-- Returns the new salary as OUT parameter.
-- Parameters:
-- IN  teacher_id INT
-- IN  hike_percent DECIMAL(5,2)
-- OUT new_salary DECIMAL(10,2)
-- ===========================================

delimiter //
create procedure calculate_hike(
    in teacher_id int,
    in hike_percent decimal(5,2),
    out new_salary decimal(10,2)
)
begin
    declare current_salary decimal(10,2);

    -- Get the current salary of the teacher
    select salary
    into current_salary
    from teacher
    where tid = teacher_id;

    -- Calculate the new salary with hike
    set new_salary = current_salary + (current_salary * hike_percent / 100);
end //
delimiter ;

-- Example usage:
set @new_sal = 0;
call calculate_hike(7, 10.00, @new_sal);
select @new_sal as updated_salary;


-- ===========================================
-- 3. Create a calculator procedure
-- Performs addition, subtraction, multiplication, division
-- based on the operation parameter. Returns result as OUT parameter.
-- Parameters:
-- IN  num1 DECIMAL(10,2)
-- IN  num2 DECIMAL(10,2)
-- IN  operation VARCHAR(20)  ('add', 'sub', 'mul', 'div')
-- OUT result DECIMAL(10,2)
-- ===========================================

delimiter //
create procedure calculator(
    in num1 decimal(10,2), 
    in num2 decimal(10,2), 
    in operation varchar(20), 
    out result decimal(10,2)
)
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

-- Example usage:
set @result = 0;
call calculator(10, 5, 'add', @result);
select @result as answer;


-- ===========================================
-- 4. Create a procedure student_grade_evaluator
-- Accepts student marks as IN parameter
-- Returns grade based on marks range.
-- Distinction: >= 75
-- First Class: 60-74
-- Second Class: 50-59
-- Fail: otherwise
-- ===========================================

delimiter //
create procedure student_grade_evaluator(
    in subject_marks decimal(10,2), 
    out subject_grade varchar(20)
)
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

-- Example usage:
call student_grade_evaluator(72, @grade);
select @grade as student_grade;


-- ===========================================
-- 5. Create a procedure emp_bonus_calculator
-- Accepts teacher ID and bonus percentage as IN parameters
-- Returns bonus amount as OUT parameter
-- If bonus percentage is NULL, defaults to 10%.
-- ===========================================

delimiter //
create procedure emp_bonus_calculator(
    in tiid int, 
    in bonus_percent decimal(10,2),
    out bonus_amt decimal(10,2)
)
begin
    declare emp_salary decimal(10,2);

    -- Get teacher salary
    select salary into emp_salary
    from teacher
    where tid = tiid;

    -- Default bonus percentage
    if bonus_percent is null then
        set bonus_percent = 10.00;
    end if;

    -- Calculate bonus amount
    set bonus_amt = emp_salary * (bonus_percent / 100);
end //
delimiter ;

-- Example usage:
call emp_bonus_calculator(101, 15, @bonus);
select @bonus as bonus_amt;

call emp_bonus_calculator(6, 25, @bonus);
select @bonus as bonus_amt;


-- ===========================================
-- 6. Create a procedure loan_emi_calculator
-- Accepts:
--  Principal Amount
--  Rate of Interest
--  Time in Years
-- Returns monthly EMI as OUT parameter
-- Formula:
-- EMI = [P * r * (1 + r)^n] / [(1 + r)^n - 1]
-- Where:
-- P = Principal Amount
-- r = Monthly Interest Rate
-- n = Total Months
-- ===========================================

delimiter //
create procedure loan_emi_calculator(
    in principle_amt decimal(10,2),
    in rate_of_interest decimal(10,2),
    in time_in_years int,
    out monthly_emi decimal(10,2)
)
begin
    declare monthly_interest decimal(10,6);
    declare total_months int;

    set total_months = time_in_years * 12;
    set monthly_interest = (rate_of_interest / 100) / 12;

    set monthly_emi = (principle_amt * monthly_interest * pow(1 + monthly_interest, total_months)) 
                      / (pow(1 + monthly_interest, total_months) - 1);
end //
delimiter ;

-- Example usage:
call loan_emi_calculator(5000000, 8, 5, @emi);
select @emi as Monthly_EMI;
