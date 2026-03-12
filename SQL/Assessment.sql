-- Question 1 Worker/Employee Database

create database Employee;
use Employee;
create table employee_info( 
	employee_id int primary key auto_increment, 
	employee_name varchar(100) not null, 
	employee_salary int not null, 
	employee_city varchar(100), 
    empolyee_department varchar(50), 
	joining_date date 
);

INSERT INTO employee_info (employee_name, employee_salary, employee_city, empolyee_department, joining_date)
VALUES ('Amit Sharma', 45000, 'Ahmedabad', 'IT', '2022-03-15'),
('Neha Patel', 52000, 'Surat', 'HR', '2021-07-10'),
('Rohit Verma', 60000, 'Vadodara', 'Finance', '2020-11-25'),
('Priya Mehta', 48000, 'Rajkot', 'Marketing', '2022-01-05'),
('Sanjay Kumar', 70000, 'Gandhinagar', 'Operations', '2019-09-18'),
('Anjali Desai', 55000, 'Ahmedabad', 'HR', '2021-05-30'),
('Kunal Shah', 65000, 'Anand', 'IT', '2020-08-12'),
('Pooja Joshi', 43000, 'Bhavnagar', 'Sales', '2022-06-20'),
('Vikas Malhotra', 80000, 'Surat', 'Finance', '2018-04-02'),
('Rina Trivedi', 47000, 'Junagadh', 'Support', '2023-02-14');

INSERT INTO employee_info (employee_name, employee_salary, employee_city, empolyee_department, joining_date)
VALUES ('Arjun Singh', 51000, 'Ahmedabad', 'IT', '2021-12-10'),
('Kavita Nair', 46000, 'Surat', 'Marketing', '2022-09-05'),
('Manish Gupta', 72000, 'Vadodara', 'Finance', '2019-06-18'),
('Sneha Kapoor', 54000, 'Rajkot', 'HR', '2021-11-23'),
('Rahul Choudhary', 61000, 'Gandhinagar', 'Operations', '2020-03-12'),
('Divya Iyer', 49000, 'Ahmedabad', 'Support', '2022-04-08'),
('Nikhil Jain', 68000, 'Anand', 'IT', '2019-10-15'),
('Meera Kulkarni', 45000, 'Bhavnagar', 'Sales', '2023-01-09'),
('Aakash Mishra', 75000, 'Surat', 'Finance', '2018-07-21'),
('Shweta Agarwal', 52000, 'Junagadh', 'Marketing', '2021-03-30'),
('Tarun Bansal', 64000, 'Ahmedabad', 'IT', '2020-12-01'),
('Ritika Sinha', 47000, 'Rajkot', 'HR', '2022-08-14'),
('Deepak Yadav', 69000, 'Vadodara', 'Operations', '2019-05-27'),
('Komal Arora', 50000, 'Surat', 'Sales', '2021-10-19'),
('Aman Srivastava', 58000, 'Gandhinagar', 'Support', '2020-02-11'),
('Nisha Bhatia', 53000, 'Ahmedabad', 'Marketing', '2022-07-06'),
('Harsh Vardhan', 67000, 'Anand', 'IT', '2019-08-25'),
('Payal Khanna', 44000, 'Bhavnagar', 'HR', '2023-03-17'),
('Saurabh Saxena', 71000, 'Surat', 'Finance', '2018-11-13'),
('Isha Malviya', 48000, 'Junagadh', 'Support', '2022-05-28');


select * from employee_info;


-- 1. Write an SQL query to print all Employee details from the employee_info table order by NAME Ascending and DEPARTMENT Descending.
select * from employee_info order by employee_name asc ;
select * from employee_info order by empolyee_department desc;

-- 2. Write an SQL query to print details for Employee with the names “Vikash” and “Rohit” from the employee_info table.
select * from employee_info where employee_name like "Vikash%" or employee_name like "Rohit%";

-- 3. Write an SQL query to print details of the Employee whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from employee_info where employee_name like "%h";

-- 4. Write an SQL query to print details of the Employee whose SALARY lies between 100000 and 75000.
select * from employee_info where employee_salary between 75000 and 100000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT employee_name, COUNT(*) AS duplicate_count
FROM employee_info
GROUP BY employee_name
HAVING COUNT(*) > 1;

-- 6. Write an SQL query to show the top 6 records of a table.
select * from employee_info order by employee_id limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them.
SELECT empolyee_department, COUNT(*) AS total_employees
FROM employee_info
GROUP BY empolyee_department
HAVING COUNT(*) < 5;

-- 8. Write an SQL query to show all departments along with the number of people in there.
SELECT empolyee_department, COUNT(*) AS total_employees
FROM employee_info
GROUP BY empolyee_department;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
SELECT employee_name, empolyee_department, employee_salary
FROM employee_info e
WHERE employee_salary = (
    SELECT MAX(employee_salary)
    FROM employee_info
    WHERE empolyee_department = e.empolyee_department
);