-- Logical Operator
select * from employee2;

-- and operator
select * from employee2
where age>=40 and salary > 50000;

select * from employee2
where age=60 and salary > 50000;

-- or operator
select * from employee2
where age>=60 or salary > 90000;

-- not operator
select * from employee2
where not (department = 'IT');