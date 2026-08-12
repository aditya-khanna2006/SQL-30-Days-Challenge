select * from employee2;

--  Retrieve the first_name, salary, and calculate a 10% bonus on the salary.
select first_name, salary, (salary*0.10) as bonus 
from employee2;

-- Calculate the Annual Salary and Salary Increment by 5% - show the monthly new salary as well
select first_name,last_name,salary,
		(salary*12) as Annual_Salary,
		(salary*0.05) as Increment_Salary,
		(salary + salary*0.05) as new_salary,
		(salary*1.05) as new_salary2
from employee2;