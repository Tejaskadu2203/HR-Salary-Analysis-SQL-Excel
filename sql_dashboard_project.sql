-- Create Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert Department Data
INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'Engineering'),
(104, 'Marketing'),
(105, 'Design');

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);

-- Insert Employee Data
INSERT INTO employees (emp_id, name, salary, department_id) VALUES
(1, 'Tanya Deshmukh', 48000, 101),
(2, 'Sneha Patil', 46000, 102),
(3, 'Rohit Jain', 52000, 103),
(4, 'Amit Verma', 35000, 104),
(5, 'Ria Singh', 34000, 105);



Task 1 # Total number of employees in each department

select count(e.name),d.dept_name from employees e 
join departments d 
on e.department_id = d.dept_id
GROUP by dept_name

Task 2 # Average salary for each department

select avg(e.salary),dept_name from employees e
JOIN departments d 
on e.department_id = d.dept_id
GROUP by dept_name

Task 3 # Department with highest total salary paid

select d.dept_name,e.salary from departments d 
join employees e 
on d.dept_id = e.department_id
where e.salary = (SELECT max(salary) from employees)
group by dept_name

Task 4 # Employees who earn more than their department’s average

SELECT e.name , d.dept_name,e.salary from employees e 
JOIN departments d 
on e.department_id = d.dept_id 
where e.salary>(SELECT avg(salary) from employees)
order by salary DESC LIMIT 1 

Task 5 # Department name, and count of employees with “High” salary

select d.dept_name,count(e.name)as emp_count,e.salary from employees e 
join departments d 
on e.department_id = d.dept_id
where e.salary=(SELECT max(salary) from employees)
