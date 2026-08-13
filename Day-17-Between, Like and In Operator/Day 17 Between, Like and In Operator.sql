-- Between Like and In Operator
select * from employee2;

-- salary between 40000 and 60000
select * from employee2
where salary between 40000 and 60000;

-- email id end with @gmail.com
select * from employee2
where email like '%@gmail.com';

-- belongs from finance or marketing
select * from employee2
where department in ('Finance','Marketing');