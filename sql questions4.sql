-- 1. table of 72 
with recursive tableOf72(n,result) as (
    select 1 as n, 72 as result
    union all
    select n+1,72*(n+1) from tableOf72 where n<10
)
select concat("72 x ",n," = ", result) as multiplication_table 
from tableOf72;

-- 2. write a program to print between 37 to 337 
with recursive numBetween as (
    select 37 as n
    union all
    select n + 1 from numBetween where n<337
)
select * from numBetween;

-- 3. the recursive cte to print odd numbers as well (37 to 337)
with recursive oddNum as (
    select 37 as n
    union all
    select n+2 from oddNum where n+2<=337
)
select * from oddNum;

-- 4. WAP to print factorial of numbers from 1 to 5
with recursive factorial_cte(n,fact) as (
    select 1 as n, 1 as fact
    union all
    select n+1, fact * (n+1)
    from factorial_cte where n<5
)
select n as Number, fact as Factorial 
from factorial_cte;
