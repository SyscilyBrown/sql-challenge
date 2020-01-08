DROP TABLE if exists titles;
DROP TABLE if exists salary ;
DROP TABLE if exists employees;
DROP TABLE if exists dept_manager;
DROP TABLE if exists dept_emp;
DROP TABLE if exists departments;

--1 create employees table
CREATE TABLE employees(
emp_no VARCHAR(30) NOT NULL PRIMARY KEY,
birth_date VARCHAR(30),
first_name VARCHAR(30),
last_name VARCHAR(30),
gender VARCHAR(30),
hire_date VARCHAR(30)
);
SELECT * FROM employees;
--import csv - successful

--2 create titles table
CREATE TABLE titles(
emp_no VARCHAR(30) NOT NULL, 
title VARCHAR(30) NOT NULL,
from_date VARCHAR(30),
to_date VARCHAR(30),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles;
-- import csv - successful 

--3 create salaries table 
CREATE TABLE salaries(
emp_no VARCHAR(30) NOT NULL,
salary INT,
from_date VARCHAR(30),
to_date VARCHAR(30),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salaries
--import csv - successful

--4 create departments table
CREATE TABLE departments(
dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
dept_name VARCHAR(30)
);
SELECT * FROM departments
--import csv - successful

--5 create dept_manager table
CREATE TABLE dept_manager(
dept_no VARCHAR(30),
emp_no VARCHAR(30),
from_date VARCHAR(30),
to_date VARCHAR(30),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
SELECT * FROM dept_manager
--import csv -- successful

--6 create dept_emp
CREATE TABLE dept_emp(
emp_no VARCHAR(30) NOT NULL,
dept_no VARCHAR(30), 
from_date VARCHAR(30),
to_date VARCHAR(30),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
SELECT * FROM dept_emp
--import cvs - successful	

--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
--Join employees and salaries to do so 
SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.gender, salaries.salary
FROM salaries 
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;


--2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '1986______';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
-- join departments, dept_manager, employees, dept_emp
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_emp.from_date, dept_emp.to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no;


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.	
--join departments, dep_emp, employees
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no


--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
and last_name LIKE 'B%';


--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'


--8. In descending order, list the frequency count of employee last names, (order_by descend)
--i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;


