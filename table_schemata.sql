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
			  