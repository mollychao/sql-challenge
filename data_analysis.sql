--List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, departments.dept_name, employees.first_name, employees.last_name
FROM departments
INNER JOIN dept_manager
ON dept_manager.dept_no=departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_manager.emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
on dept_emp.emp_no = employees.emp_no
INNER JOIN departments
on departments.dept_no=dept_emp.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees where first_name = 'Hercules' and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
on dept_emp.emp_no = employees.emp_no
INNER JOIN departments
on departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
on dept_emp.emp_no = employees.emp_no
INNER JOIN departments
on departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count(*) as Frequency 
FROM employees GROUP BY last_name 
Order by Frequency DESC;
