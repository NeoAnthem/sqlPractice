-- *. Greatest() & least():
-- greatest: returns the largest value amoung arguments.
-- e.g. 
select greatest(100,115,15) as largest_value;

-- least(): returns the smallest value.
-- e.g. 
select least(100,115,15) as smallest_value;

select curdate();
select CURRENT_DATE;

select curtime();
select CURRENT_TIME;

select now();
select sysdate();

select date(now());
select time(now());

select year('2025-08-01');
select year(now());
select month('2025-08-01');
select month(now());
select day('2025-08-01');
select day(now());

select dayname('2025-08-01');
select dayname(now());

select monthname('2025-08-01');
select monthname(now());

select dayofweek('2025-08-01');
select dayofmonth(now());

select dayofyear('2025-08-01');
select dayofyear(now());

select date_add('2025-08-01', interval 10 day);
select date_sub('2025-08-01', interval 2 month);

select datediff('2024-12-01', '2025-08-01');
select datediff('2025-08-01', '2021-08-01');

select timediff('2024-12-01 14:45:12', '2021-08-01 12:15:00');

select last_day('2025-08-01'); -- ans: 2025-08-31

select extract( YEAR from '2025-08-01 12:15:00'); -- ans: 2025
select extract( MONTH from '2025-08-01 12:15:00'); -- ans: 08
select extract( DAY from '2025-08-01 12:15:00'); -- ans: 01

select str_to_date('2025-08-01', '%Y-%m-%d'); -- ans: 2025-08-31
select date_format('2025-08-18',"%W %M %e %Y"); -- ans: Monday, August 18 2025