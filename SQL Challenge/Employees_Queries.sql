-- 1) List the following for each employee: employee number, last name, first name, gender, & salary:
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.gender,
		salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no

-- 2) List employees hired in 1986:
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.hire_date		
FROM employees
WHERE employees. hire_date BETWEEN '1985-12-31' AND '1987-01-01'

-- 3) List the manager of each department with the following: dept number, dept name, 
-- manager's employee number, last name, first name, start and end employment dates:
SELECT dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name,
		dept_manager.from_date,
		dept_manager.to_date
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
	JOIN employees
	ON dept_manager.emp_no = employees.emp_no;

-- 4) List the department of each employee with the following: employee number, last name, first name & dept name:
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
	JOIN departments
	ON dept_emp.dept_no = departments.dept_no;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B":
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name & dept name:
SELECT dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
	JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name = 'Sales';

-- 7) List all employees in the Sales & Development departments, including their employee number, last name, first name,
-- & department name:
SELECT dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
	JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name = 'Sales'
		OR dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, ie how many employees share each last name:
SELECT last_name, COUNT(last_name) AS "Frequency of Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Names" DESC;




