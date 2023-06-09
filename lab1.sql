SELECT last_name, job_id, hire_date as STARTDATE, employee_id FROM employees;

select distinct job_id from employees;

select last_name as "Employee", job_id as "Job", hire_date as "Hire Date",
employee_id as "Emp #" from employees;

select last_name ||  ', ' || job_id as "Employee and Title" from employees;

select last_name as "Employee", salary, salary*1.15 as "Next Year Salary" 
from employees;

select salary*12 from employees;

select last_name ||  ' for the year received ' || salary*12 
as "Total Salary", salary*12*(1+coalesce(commission_pct,0)) as "Premium Salary"
from employees;

select first_name || E'\'s salary is ' || salary from employees;

select first_name || ' ' || last_name || ' phone number ' || phone_number
from employees;

select distinct department_id from employees;