-- genders
-- M = male
-- F = female
-- NB = non-binary
-- U = unspecified or unknown
CREATE TYPE gender AS ENUM ('M', 'F', 'NB', 'U');

create table titles (
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

create table employees (
	emp_no INT PRIMARY KEY,
	emp_title_id CHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex GENDER NOT NULL,
	hire_date DATE NOT NULL,
	
	CONSTRAINT FK_employees_title FOREIGN KEY(emp_title_id)
        REFERENCES titles(title_id)
        ON DELETE SET NULL
);

create table salaries (
	emp_no INT PRIMARY KEY,
	salary MONEY,
	
	CONSTRAINT FK_salaries_empno FOREIGN KEY(emp_no)
        REFERENCES employees(emp_no)
        ON DELETE CASCADE
);

create table departments (
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

create table dept_manager (
	dept_no CHAR(4), 
	emp_no INT,
	PRIMARY KEY(dept_no, emp_no),
	
	CONSTRAINT FK_dept_manager_dept FOREIGN KEY(dept_no)
        REFERENCES departments(dept_no)
        ON DELETE SET NULL,
	
	CONSTRAINT FK_dept_manager_emp FOREIGN KEY(emp_no)
        REFERENCES employees(emp_no)
        ON DELETE SET NULL
);

create table dept_emp (
	emp_no INT references employees(emp_no),
	dept_no CHAR(4) references departments(dept_no),
	PRIMARY KEY (emp_no, dept_no),
	
	CONSTRAINT FK_dept_emp_emp FOREIGN KEY(emp_no)
        REFERENCES employees(emp_no)
        ON DELETE SET NULL,
	
	CONSTRAINT FK_dept_emp_dept FOREIGN KEY(dept_no)
        REFERENCES departments(dept_no)
        ON DELETE SET NULL
);