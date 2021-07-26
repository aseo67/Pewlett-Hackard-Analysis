--Determine Retirement Eligibility
--Born 1952-1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
--Born 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'
--Born 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31'
--Born 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31'
--Born 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31'

-- Number of employees retiring (narrowed for birth_date and hire_date)
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility: narrowing search & placing in table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- Delete initial retirement_info table
DROP TABLE retirement_info;
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Example: Inner Join - Joining departments and dept_manager tables with aliases
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

-- Example: Left Join - Joining retirement_info and dept_emp tables with aliases
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no;

--Joining retirement_info and dept_emp tables, filtering for currently employed & saving
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')
-- Check the table
SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_by_dept
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
-- Check the table
SELECT * FROM count_by_dept;

-- List 1: Employee Info
-- Check Salaries table to see if dates are usable, in descending order by most recent (it's not)
SELECT * FROM salaries
ORDER BY to_date DESC;
-- Join emp_info table with dept_emp table and salary table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
-- Check table
SELECT * FROM emp_info;

-- List 2: Management
-- List of managers per department
SELECT  dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
    ON (dm.emp_no = ce.emp_no);
-- Check table
SELECT * FROM manager_info;

-- List 3: Department Retirees
-- List of retirees w/ department info
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);
-- Check table
SELECT * FROM dept_info;

-- List for Sales team: employee numbers, first/last names, department
SELECT di.emp_no,
	di.first_name,
	di.last_name,
	di.dept_name
INTO sales_emp_info
FROM dept_info AS di
WHERE (dept_name = 'Sales');
-- Check table
SELECT * FROM sales_emp_info;

-- List for Sales+Development team: employee numbers, first/last names, department
SELECT di.emp_no,
	di.first_name,
	di.last_name,
	di.dept_name
INTO sales_dev_emp_info
FROM dept_info AS di
WHERE dept_name IN ('Sales', 'Development');
-- Check table
SELECT * FROM sales_dev_emp_info;