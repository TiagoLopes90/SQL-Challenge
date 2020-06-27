-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create Employee Table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30)
	);

-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create Employee Table
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50)
	);


-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create Employee Table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);

-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- Create Employee Table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create Employee Table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create Employee Table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

-- Import Tables
COPY public.departments (dept_no, dept_name) 
	FROM '/tmp/departments.csv' CSV HEADER;

COPY public.titles (title_id, title) 
	FROM '/tmp/titles.csv' CSV HEADER;

COPY public.employees (emp_no,emp_title_id,	birth_date,	first_name,	last_name, sex,	hire_date) 
	FROM '/tmp/employees.csv' CSV HEADER;

COPY public.salaries (emp_no, salary) 
	FROM '/tmp/salaries.csv' CSV HEADER;

COPY public.dept_emp (emp_no, dept_no) 
	FROM '/tmp/dept_emp.csv' CSV HEADER;

COPY public.dept_manager (dept_no, emp_no) 
	FROM '/tmp/dept_manager.csv' CSV HEADER;