--Data Analysis--
-----------------
--1. List the employee number, last name, first name, sex, and salary of each employee.

-- Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
-- Select employees table as the first table to be joined
FROM employees AS e
	-- Join salaries table to get salary info.
	LEFT JOIN salaries AS s
	-- emp_no is the common reference for both table
	ON e.emp_no = s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

-- Select columns to display
SELECT first_name, last_name, hire_date
-- Select employees table
FROM employees
-- Set the condition 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department along with their department number, department name, employee number,
-----last name, and first name.

-- Select columns to display
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
-- Get dept_manager table as the first table to join other tables
FROM dept_manager AS dm
	-- Join departments table to have department name
	JOIN departments AS d 
	ON dm.dept_no = d.dept_no
		-- Join employees table to have employees' last name and first name
		JOIN employees AS e 
		ON dm.emp_no = e.emp_no;
		
--4. List the department number for each employee along with that employee’s employee number, last name, first name,
-----and department name.

-- Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- Get employees table as the first table to join other tables
FROM employees AS e
	-- Join dept_emp table to get dept_no to link to department name in department table
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		-- Join departments table to have department name
		JOIN departments AS d
		ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the
-----letter B.

-- Select columns to display
SELECT first_name, last_name, sex
-- Select table that contains required info.
FROM employees 
-- Apply condition to filter the result
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.

-- Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- Get employees table as the first table to join other tables
FROM employees AS e
	-- Join dept_emp table to get dept_no to link to department name in department table
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		-- Join departments table to have department name
		JOIN departments AS d
		ON de.dept_no = d.dept_no
-- Apply condition to filter only Sales department
WHERE d.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, 
-----and department name.

-- Select columns to display
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- Get employees table as the first table to join other tables
FROM employees AS e
	-- Join dept_emp table to get dept_no to link to department name in department table
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		-- Join departments table to have department name
		JOIN departments AS d
		ON de.dept_no = d.dept_no
-- Apply condition to filter Sales and Development department
WHERE d.dept_name IN ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each
-----last name).

-- Select columns to display
SELECT last_name,
	-- Apply count function to count last name
	COUNT(*) AS "Frequency of Last name"
-- Select table that contains needed info.
FROM employees
-- Apply GROUP BY to be used in an aggregate function 
GROUP BY last_name
ORDER BY "Frequency of Last name" DESC;

