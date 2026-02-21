-- Working with Database using SQL Assignment
-- For this assignment, you will finish building the contact management database for MarketCo

CREATE DATABASE MarketCo;
USE MarketCo;

CREATE TABLE Company (
    companyId int primary key not null auto_increment,
    compnayName varchar(45) not null,
    company_street varchar(45) not null,
    company_state varchar(2) not null,
    company_zip varchar(10) not null
);

-- 1) Statement to create the Contact table
CREATE TABLE Contact (
    contactId int primary key not null auto_increment,
    companyId int,
	foreign key (companyId) REFERENCES Company(companyId),
    firstname varchar(45) not null,
    lastName varchar(45) not null,
    cont_street varchar(45) not null,
    cont_state varchar(2) not null,
    cont_zip varchar(10) not null,
    IsMain boolean not null,
    cont_Email varchar(45) not null,
    cont_Phone varchar(12) not null
);

-- 2) Statement to create the Employee table
CREATE TABLE Employee (
	employyeId int primary key not null auto_increment,
    emp_FirstName varchar(45) not null,
    empl_LastName varchar(45) not null,
    salary decimal(10,2) not null,
    hiredate date not null,
    jobtitle varchar(25) not null,
    emp_email varchar(45) not null,
    emp_phone varchar(12) not null
);

-- 3) Statement to create the ContactEmployee table
CREATE TABLE ContactEmployee (
    contactemployeeId int primary key not null,
    ContactId int,
    foreign key (ContactId) references Contact(ContactId),
    employyeId int,
    foreign key (employyeId) references Employee(employyeId),
    contactdate date not null,
    ce_description varchar(100)
);

INSERT INTO Company (compnayName, company_street, company_state, company_zip) VALUES
('TechNova Solutions', '123 Innovation Dr', 'CA', '94016'),
('GreenField Logistics', '456 Market St', 'TX', '75201'),
('BlueWave Marketing', '789 Ocean Ave', 'FL', '33101'),
('Summit Financial Group', '101 Mountain Rd', 'CO', '80202'),
('UrbanCore Development', '202 City Plaza', 'NY', '10001');

INSERT INTO Contact (companyId, firstname, lastName, cont_street, cont_state, cont_zip, IsMain, cont_Email, cont_Phone)
VALUES
(1, 'John', 'Anderson', '12 Elm St', 'CA', '94016', TRUE, 'john.anderson@technova.com', '555-100-0001'),
(2, 'Sarah', 'Mitchell', '34 Pine Rd', 'TX', '75201', TRUE, 'sarah.mitchell@greenfield.com', '555-100-0002'),
(3, 'David', 'Clark', '56 Oak Ave', 'FL', '33101', FALSE, 'david.clark@bluewave.com', '555-100-0003'),
(4, 'Emily', 'Turner', '78 Maple Blvd', 'CO', '80202', TRUE, 'emily.turner@summitfg.com', '555-100-0004'),
(5, 'Michael', 'Scott', '90 Cedar Ln', 'NY', '10001', FALSE, 'michael.scott@urbancore.com', '555-100-0005');

INSERT INTO Employee(emp_FirstName, empl_LastName, salary, hiredate, jobtitle, emp_email, emp_phone)
VALUES
('Robert', 'King', 75000.00, '2020-03-15', 'Sales Manager', 'robert.king@company.com', '555-200-0001'),
('Laura', 'Hill', 68000.00, '2019-07-22', 'Account Executive', 'laura.hill@company.com', '555-200-0002'),
('James', 'Wright', 82000.00, '2018-11-05', 'Project Manager', 'james.wright@company.com', '555-200-0003'),
('Olivia', 'Green', 59000.00, '2021-01-18', 'Marketing Specialist', 'olivia.green@company.com', '555-200-0004'),
('Daniel', 'Adams', 91000.00, '2017-09-30', 'IT Director', 'daniel.adams@company.com', '555-200-0005');

INSERT INTO ContactEmployee(contactemployeeId, ContactId, employyeId, contactdate, ce_description)
VALUES
(1001, 1, 1, '2023-01-15', 'Initial sales meeting'),
(1002, 2, 2, '2023-02-10', 'Contract discussion'),
(1003, 3, 3, '2023-03-05', 'Project kickoff'),
(1004, 4, 4, '2023-04-20', 'Marketing strategy session'),
(1005, 5, 5, '2023-05-12', 'IT infrastructure review');

alter table Employee rename column empl_LastName to  emp_LastName;
alter table contactemployee rename column employyeId to  employeeId;
alter table Company rename column compnayName to  companyname;

-- 4) In the Employee table, the statement that changes James Wright’s phone number AZto 215-555-8800
update Employee set emp_phone = "215-555-8800" where employeeId = 3;

-- 5) In the Company table, the statement that changes the name of “TechNova Solutions” to “TN Solutions” .
update Company set companyname = "TN Solutions" where companyId = 1;

-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
-- event with Jack Lee (one statement).
SET SQL_SAFE_UPDATES = 0;
DELETE FROM contact WHERE firstname = "Michael" AND lastname = "Scott";
SET SQL_SAFE_UPDATES = 1; -- Re-enable it afterward for safety

select  * from contact;
select * from contactemployee;
select * from employee;

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted david clark (one statement). Run the SQL
SELECT 
	c.contactId,
    ce.contactId,
    ce.employeeId,
    e.employeeId,
    e.emp_FirstName,
	e.emp_LastName
from contact c
inner join contactemployee ce on c.contactId = ce.contactId
inner join employee e on ce.employeeId = e.employeeId
where  c.firstname = "David" and c.lastname = "Clark";
