-- Other Operator
select * from employee2;

-- find employee when email is null (if applicable)
select first_name, last_name, email from employee2 
where email is null;

-- List employee salary in descending order
select first_name, last_name, salary from employee2 
order by salary desc;

-- Retrieve the top 5 highest pais employees
select first_name, last_name, salary from employee2 
order by salary desc
limit  5;

-- retrieve a list of unique departments
select distinct department from employee2;





