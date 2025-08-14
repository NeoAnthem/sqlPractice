-- MATH function
-- 1. ABS(): returns absolute or positive value of a number
select abs(-25.78) as result;

-- 2. CEIL() / CEILING(): it rounds to nearest highest integer.
-- e.g. 11.11 = 12, 14.3 = 15, 17.8 = 18
-- 3. FLOOR(): it rounds to nearest lowest integer.
-- e.g. 11.99 = 11, 14.7 = 14, 37.3 = 37
-- 4. round(): it rounds the float valu to nearest integer.
-- e.g. 11.7 = 12, 13.5 =14, 52.4 =52, 14.3 = 14
select ceil(14.1) as ceil_num, floor(17.9) as floor_num, 
round(37.43) as round_num;

-- 5. truncate() - truncates a number to a certain number of decimal places
-- without rounding.
-- e.g. 17.5512 = 17.5
select truncate(17.5512,0);

-- 6. MOD() or % : returns the remainder of division
-- e.g. 100 % 3 = 1
select mod(100,3) as result;

-- 7. POW() or POWER(): returns a number raised to given power.
-- e.g. 2 raise to 3 =8
select pow(2,3);
select pow(3,2);

-- 8. SQRT():
select sqrt(81);

-- 9. sign(): returns -1 for -ve, 0 for zero and 1 for +ve
select sign(-142536) as result;

select pi() as result;

select rand(), concat(floor(rand()*10),floor(rand()*10),floor(rand()*10),floor(rand()*10)), floor(rand()*100);