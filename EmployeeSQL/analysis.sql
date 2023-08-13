--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex",
	s.salary AS "Salary"
FROM employees AS e
	JOIN salaries AS s
	ON s.emp_no=e.emp_no
ORDER BY "Employee Number" ASC;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
WHERE hire_date
	BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY "Hire Date" ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"	
FROM employees AS e
	JOIN dept_manager AS dm
	ON dm.emp_no=e.emp_no
	JOIN departments as d
	ON d.dept_no=dm.dept_no
ORDER BY "Department Number" ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	de.dept_no AS "Department Number",
	d.dept_name AS "Department Name"
FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no=e.emp_no
	JOIN departments as d
	ON d.dept_no=de.dept_no
ORDER BY "Employee Number" ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name"
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	)
ORDER BY "Employee Number" ASC;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees as e
	JOIN dept_emp as de
	ON de.emp_no=e.emp_no
	JOIN departments as d
	ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' 
	OR d.dept_name = 'Development'
ORDER BY "Employee Number" ASC;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name AS "Last Name",
	COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;


