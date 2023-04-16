-- Query 1
-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

-- Query 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31';

-- Query 3
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments as d
INNER JOIN dept_manager as dm ON d.dept_no = dm.dept_no
INNER JOIN employees as e ON dm.emp_no = e.emp_no;

-- Query 4
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no = e.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- Query 5
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name ~* '^B';

-- Query 6
-- List each employee in the Sales department, including their employee number, last name, and first name.
select de.emp_no, e.sex, e.last_name, e.first_name
from departments as d
INNER JOIN dept_emp as de ON d.dept_no = de.dept_no 
INNER JOIN employees as e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name;

-- Query 7
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.sex, e.last_name, e.first_name, d.dept_name
from departments as d
INNER JOIN dept_emp as de ON d.dept_no = de.dept_no 
INNER JOIN employees as e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- Query 8
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(e.last_name)
FROM employees AS e
GROUP BY e.last_name
ORDER BY e.last_name;
