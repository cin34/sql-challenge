-- Verify tables have been correctly imported

SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM departments;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

WITH DepartManager AS (
SELECT e.last_name, e.first_name, m.dept_no, m.emp_no
FROM employees AS e
INNER JOIN dept_manager as m
ON e.emp_no = m.emp_no
)
SELECT dm.dept_no, d.dept_name, dm.emp_no, dm.last_name, dm.first_name
FROM DepartManager AS dm
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;
	

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

WITH DeptEmployees AS (
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
)
SELECT dm.dept_no, dm.emp_no, dm.last_name, dm.first_name, dn.dept_name
FROM DeptEmployees AS dm
INNER JOIN departments AS dn
ON dm.dept_no = dn.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.

With EmployeeSalesDept AS (
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
)
SELECT es.emp_no, es.last_name, es.first_name, d.dept_name
FROM EmployeeSalesDept AS es
JOIN departments AS d
ON es.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

With EmployeeSalesDept AS (
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
)
SELECT es.emp_no, es.last_name, es.first_name, d.dept_name
FROM EmployeeSalesDept AS es
JOIN departments AS d
ON es.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, count(last_name) AS frequency_count from employees
GROUP BY 1
ORDER BY frequency_count desc;