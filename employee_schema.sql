DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


CREATE TABLE titles (
    title_id VARCHAR (10)   NOT NULL,
    title VARCHAR (50)   NOT NULL,
    PRIMARY KEY (title_id)
);

SELECT * FROM titles;

CREATE TABLE departments (
    dept_no VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR    NOT NULL,
    hire_date DATE    NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no) 
);
SELECT * FROM employees;


CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);	
    

SELECT * FROM dept_emp;


CREATE TABLE dept_manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);	    

SELECT * FROM dept_manager

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

SELECT * FROM salaries;