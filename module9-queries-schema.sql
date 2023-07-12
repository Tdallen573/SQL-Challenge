-- List employees names, sex, and salary

select emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex,
	   sal.salary
from employees as emp
	left join salaries as sal
	on (emp.emp_no = sal.emp_no)
order by emp.emp_no;

-- List employees hired in 1986

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- List the manager of each department

select dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join employees as e
		on (dm.emp_no = e.emp_no);
		
-- List employees from each department

select e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
from employees as e
	inner join dept_emp as de
		on (e.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
order by e.emp_no;

-- List employees with the first name of "Hercules" and the last name is "B"

select first_name, last_name, birth_date, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List employees in the sales department

select e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
from employees as e
	inner join dept_emp as de
		on (e.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by e.emp_no;

-- List employees in the sales and development departments

select e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
from employees as e
	inner join dept_emp as de
		on (e.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales', 'Development')
order by e.emp_no;

-- List the frequency of employee last names

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;