-- Data Analysis --

-- Question 01 --
SELECT em.emp_no,em.last_name,em.first_name, em.sex, salaries.salary
FROM employees as em
LEFT JOIN salaries ON
em.emp_no = salaries.emp_no;

-- Question 02 --
SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1986;

-- Question 03 --
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM departments as d
INNER JOIN dept_manager on d.dept_no=dept_manager.dept_no
INNER JOIN employees as e on e.emp_no=dept_manager.emp_no;

-- Question 04 --
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
INNER JOIN dept_emp on e.emp_no=dept_emp.emp_no
INNER JOIN departments as d on d.dept_no=dept_emp.dept_no;

-- Question 05 --
SELECT first_name,last_name, sex
FROM employees
WHERE first_name='Hercules' and last_name like 'B%';

-- Question 06 --
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
INNER JOIN dept_emp on e.emp_no=dept_emp.emp_no
INNER JOIN departments as d on d.dept_no=dept_emp.dept_no
WHERE d.dept_name='Sales';

-- Question 07 --
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
INNER JOIN dept_emp on e.emp_no=dept_emp.emp_no
INNER JOIN departments as d on d.dept_no=dept_emp.dept_no
WHERE d.dept_name='Sales' or d.dept_name='Development';

-- Question 08 --
SELECT last_name, COUNT(emp_no) AS nu_name
FROM employees
GROUP BY last_name
ORDER BY nu_name DESC;