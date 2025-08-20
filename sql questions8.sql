-- 1.  write a program to print 73 to 23 using loop.
-- Ans :
delimiter //
create procedure print_73_to_23()
begin
    declare i int default 73;
    while i >= 23 do
        select i as numbers;
        set i = i - 1;
    end while;
end //
delimiter ;

call print_73_to_23();

-- 2.  write a program to print the table of 86.
-- Ans :
delimiter //
create procedure table_of_86()
begin
    declare i int default 1;
    while i <= 10 do
        select concat('86 x ', i, ' = ', 86 * i) as table_86;
        set i = i + 1;
    end while;
end //
delimiter ;

call table_of_86();

-- 3.  write a program to check if the given value is prime or not.
-- Ans :
delimiter //
create procedure prime_check(in num int)
begin
    declare i int default 2;
    declare isPrime boolean default true;

    loop_label: loop
        if i <= num / 2 then
            if mod(num, i) = 0 then
                set isPrime = false;
                leave loop_label;
            end if;
            set i = i + 1;
        else
            leave loop_label;
        end if;
    end loop loop_label;

    if isPrime then
        select concat(num, ' is prime') as result;
    else
        select concat(num, ' is not prime') as result;
    end if;
end;
//
delimiter ;
call prime_check(29);
call prime_check(40);


