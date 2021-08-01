-- Deliverable 3: Additional Queries/Insights

-- Create dept_emp table with only current employees
SELECT emp_no, dept_no, from_date, to_date
INTO dept_emp_curr
FROM dept_emp
WHERE to_date = '9999-01-01';

-- Add departments to unique_titles table, filtering for current employees only
SELECT ut.emp_no, 
	ut.first_name, 
	ut.last_name, 
	ut.title,
	dec.dept_no,
	dec.from_date,
	dec.to_date,
	d.dept_name
INTO unique_titles_dept
FROM unique_titles AS ut
LEFT OUTER JOIN dept_emp_curr AS dec
ON (ut.emp_no = dec.emp_no)
JOIN departments AS d
ON (dec.dept_no = d.dept_no)
ORDER BY ut.emp_no ASC;
-- Note, this resulting table doesn't include same # of employees as unique_title.csv, as this filters for current employees only.

SELECT * FROM unique_titles_dept;

-- Number of titles from Unique Titles table with dept. info & filtering for current employees only
SELECT COUNT(title) AS "count", title
INTO retiring_titles
FROM unique_titles_dept
GROUP BY title
ORDER BY "count" DESC;

SELECT * FROM retiring_titles_curr;

-- Number of departments from Unique Titles table with dept. info & filtering for current employees only
SELECT COUNT(dept_name) AS "count", dept_name
INTO retiring_departments
FROM unique_titles_dept
GROUP BY dept_name
ORDER BY "count" DESC;

SELECT * FROM retiring_departments;
