create database asana;
use asana;

create table organisation(
	org_id int primary key not null auto_increment,
    org_name varchar(100) not null
);

insert into organisation(org_name) values ("Acme Systems"), ("TechFlow Industries"), ("DataStream Solutions");
select * from task_audit;

create table teams(
	team_id int primary key not null auto_increment,
    team_name varchar(100) not null,
    org_id int,
    foreign key (org_id) references organisation(org_id)
);

INSERT INTO teams (team_name, org_id) VALUES
('Backend Engineering', 1),
('Frontend Engineering', 1),
('DevOps', 1),
('Product Management', 1),
('Data Science', 2),
('Mobile Development', 2),
('Platform Engineering', 2),
('Security', 2),
('QA Engineering', 3),
('Infrastructure', 3),
('Machine Learning', 3),
('Customer Success', 3);

-- Constraints
-- Q1. Write a `CREATE TABLE` statement for `employee` that enforces: `e_id` as PRIMARY KEY, `e_role` as NOT NULL, and `team_id` as a FOREIGN KEY referencing `team(team_id)`.
create table employee(
	e_id int primary key not null auto_increment,
    e_name varchar(200) not null,
    e_mail varchar(200) not null,
    e_role varchar(100) not null,
    e_join_date date not null,
    team_id int,
    foreign key (team_id) references teams(team_id)
);

INSERT INTO employee (e_name, e_mail, e_role, e_join_date, team_id) VALUES
('Aarav Patel','aarav.patel@company.com','Senior Backend Engineer','2022-01-15',1),
('Riya Shah','riya.shah@company.com','Backend Engineer','2023-03-20',1),
('Dev Mehta','dev.mehta@company.com','Staff Engineer','2021-07-11',1),
('Isha Jain','isha.jain@company.com','Principal Engineer','2020-05-09',1),
('Kunal Desai','kunal.desai@company.com','Senior Frontend Engineer','2022-02-18',2),
('Neha Kapoor','neha.kapoor@company.com','Frontend Engineer','2023-06-25',2),
('Rahul Verma','rahul.verma@company.com','UI/UX Engineer','2022-09-12',2),
('Sneha Iyer','sneha.iyer@company.com','Lead Frontend Engineer','2021-11-30',2),
('Arjun Nair','arjun.nair@company.com','DevOps Engineer','2023-01-10',3),
('Pooja Sharma','pooja.sharma@company.com','Senior DevOps Engineer','2022-08-22',3),
('Vikram Singh','vikram.singh@company.com','Site Reliability Engineer','2021-04-14',3),
('Ananya Gupta','ananya.gupta@company.com','Infrastructure Lead','2020-12-01',3),
('Rohit Agarwal','rohit.agarwal@company.com','Senior Product Manager','2021-02-17',4),
('Priya Bansal','priya.bansal@company.com','Product Manager','2022-05-05',4),
('Aditya Joshi','aditya.joshi@company.com','Associate Product Manager','2023-07-19',4),
('Meera Kulkarni','meera.kulkarni@company.com','Product Owner','2021-10-28',4),
('Siddharth Rao','siddharth.rao@company.com','Lead Data Scientist','2020-06-13',5),
('Nikita Sethi','nikita.sethi@company.com','Data Scientist','2022-03-03',5),
('Amit Tiwari','amit.tiwari@company.com','ML Engineer','2023-02-09',5),
('Kriti Malhotra','kriti.malhotra@company.com','Data Analyst','2022-12-21',5),
('Harsh Vora','harsh.vora@company.com','iOS Engineer','2022-04-16',6),
('Tanvi Shah','tanvi.shah@company.com','Android Engineer','2023-06-11',6),
('Nikhil Reddy','nikhil.reddy@company.com','Senior Mobile Engineer','2021-09-23',6),
('Ayesha Khan','ayesha.khan@company.com','Mobile Architect','2020-11-05',6),
('Deepak Yadav','deepak.yadav@company.com','Staff Platform Engineer','2021-01-29',7),
('Simran Kaur','simran.kaur@company.com','Platform Engineer','2023-03-18',7),
('Manish Pandey','manish.pandey@company.com','Senior Platform Engineer','2022-05-30',7),
('Kavya Nair','kavya.nair@company.com','Platform Architect','2020-10-19',7),
('Rakesh Kumar','rakesh.kumar@company.com','Security Engineer','2023-02-27',8),
('Divya Menon','divya.menon@company.com','Senior Security Engineer','2022-06-06',8),
('Gaurav Khanna','gaurav.khanna@company.com','Security Architect','2021-12-12',8),
('Shreya Das','shreya.das@company.com','AppSec Engineer','2022-09-09',8),
('Ankit Jain','ankit.jain@company.com','QA Engineer','2023-01-21',9),
('Ritu Saxena','ritu.saxena@company.com','Senior QA Engineer','2022-03-14',9),
('Mohit Arora','mohit.arora@company.com','QA Lead','2021-07-07',9),
('Pallavi Joshi','pallavi.joshi@company.com','Test Automation Engineer','2022-11-11',9),
('Suresh Pillai','suresh.pillai@company.com','Infrastructure Engineer','2023-04-01',10),
('Geeta Nambiar','geeta.nambiar@company.com','Senior Infrastructure Engineer','2021-08-25',10),
('Abhishek Sinha','abhishek.sinha@company.com','Cloud Architect','2020-03-03',10),
('Rina Dutta','rina.dutta@company.com','ML Research Scientist','2022-06-17',11),
('Karthik Iyer','karthik.iyer@company.com','Senior ML Engineer','2021-09-29',11),
('Payal Jain','payal.jain@company.com','ML Architect','2020-12-22',11),
('Varun Chawla','varun.chawla@company.com','Customer Success Manager','2023-02-15',12),
('Sonal Gupta','sonal.gupta@company.com','Customer Success Engineer','2022-07-08',12),
('Imran Sheikh','imran.sheikh@company.com','Technical Account Manager','2021-11-13',12),
('Nisha Verma','nisha.verma@company.com','Support Engineer','2023-05-05',12),
('Alok Srivastava','alok.srivastava@company.com','VP Customer Success','2020-01-01',12),
('Pankaj Singh','pankaj.singh@company.com','Marketer','2022-02-02',4),
('Zoya Ali','zoya.ali@company.com','Designer','2023-03-03',2);

create table project(
	p_id int primary key not null auto_increment,
    p_name varchar(200) not null,
    p_discription varchar(500) not null,
    p_start_date date not null,
    p_end_date date not null,
    p_status varchar(200) not null,
    team_id int,
    foreign key (team_id) references teams(team_id),
    e_id int,
    foreign key (e_id) references employee(e_id)
);

INSERT INTO project 
(p_name, p_discription, p_start_date, p_end_date, p_status, team_id, e_id) VALUES
('API Gateway - Refactor - Error handling','Improve error handling in API Gateway','2023-01-01','2023-02-15','Completed',1,1),
('Database - Optimize - Connection pooling','Optimize DB connections','2023-02-01','2023-03-10','Completed',1,2),
('Auth Service - Implement - Rate limiting','Add rate limiting to auth service','2023-03-05','2023-04-20','In Progress',1,3),
('Monitoring - Add - Custom metrics','Add custom metrics to monitoring','2023-01-15','2023-03-01','Completed',3,9),
('Cache Layer - Implement - Redis caching','Implement Redis caching layer','2023-02-10','2023-04-01','In Progress',3,10),
('Users API - Migrate - v2 to v3','Upgrade Users API','2023-03-01','2023-05-01','In Progress',1,4),
('Projects API - Migrate - v2 to v3','Upgrade Projects API','2023-03-10','2023-05-10','Planned',1,2),
('Tasks API - Migrate - v2 to v3','Upgrade Tasks API','2023-03-20','2023-05-20','Planned',1,3),
('Documentation - Update - API v3 specs','Update API docs','2023-04-01','2023-04-20','Completed',4,13),
('SDK - Update - Client libraries','Update SDKs','2023-04-05','2023-05-15','In Progress',4,14),
('Query Analysis - Profile - Slow queries','Analyze slow queries','2023-01-10','2023-02-10','Completed',5,17),
('Index Optimization - Add - Missing indexes','Add DB indexes','2023-02-15','2023-03-15','Completed',5,18),
('Query Refactor - Optimize - N+1 problems','Fix N+1 queries','2023-03-20','2023-04-25','In Progress',5,19),
('Cache Strategy - Implement - Query caching','Implement caching','2023-04-01','2023-05-30','Planned',5,20),
('Performance Testing - Execute - Load tests','Run load tests','2023-05-01','2023-06-01','Planned',5,21),
('Dashboard - Design - Wireframes','Design dashboards','2023-01-01','2023-01-20','Completed',2,5),
('Components - Build - Chart library','Build charts','2023-01-25','2023-03-01','Completed',2,6),
('Navigation - Redesign - Main menu','Improve navigation','2023-03-05','2023-04-01','Completed',2,7),
('Analytics - Integrate - Usage tracking','Add analytics','2023-04-10','2023-05-10','In Progress',2,8),
('Accessibility - Audit - WCAG compliance','Accessibility improvements','2023-05-01','2023-06-01','Planned',2,6),
('Performance - Audit - Lighthouse score','Improve performance','2023-02-01','2023-03-01','Completed',2,5),
('Images - Optimize - Lazy loading','Optimize images','2023-03-10','2023-04-05','Completed',2,7),
('CSS - Refactor - Critical CSS','Refactor CSS','2023-04-01','2023-05-01','In Progress',2,8),
('JavaScript - Bundle - Code splitting','Improve JS bundle','2023-05-01','2023-06-01','Planned',2,6),
('PWA - Add - Service worker','Add PWA support','2023-06-01','2023-07-01','Planned',2,5),
('GitHub Actions - Setup - Workflows','Setup CI/CD','2023-01-01','2023-02-01','Completed',3,9),
('Docker - Optimize - Build caching','Optimize Docker builds','2023-02-05','2023-03-05','Completed',3,10),
('Security - Add - Container scanning','Add container security','2023-03-10','2023-04-10','Completed',8,31),
('Deployment - Automate - Production rollout','Automate deployment','2023-04-15','2023-05-15','In Progress',3,11),
('Monitoring - Integrate - Build metrics','Add build monitoring','2023-05-01','2023-06-01','Planned',3,12),
('Kubernetes - Setup - Cluster configuration','Setup k8s cluster','2023-01-01','2023-02-15','Completed',10,39),
('Helm - Create - Charts for services','Create Helm charts','2023-02-20','2023-03-20','Completed',10,40),
('Ingress - Configure - Load balancer','Setup ingress','2023-03-25','2023-04-25','Completed',10,41),
('Storage - Setup - Persistent volumes','Setup storage','2023-04-30','2023-05-30','In Progress',10,38),
('Migration - Execute - Service by service','Service migration','2023-05-01','2023-07-01','Planned',10,39);

create table task(
	task_id int primary key not null auto_increment,
    task_name varchar(200) not null,
    task_discription varchar(500) not null,
    task_creation_date date not null,
    task_due_date date not null,
    task_status varchar(200) not null,
    task_complition_date date not null,
    p_id int,
     foreign key (p_id) references project(p_id),
    e_id int,
	foreign key (e_id) references employee(e_id)
);

INSERT INTO task 
(task_name, task_discription, task_creation_date, task_due_date, task_status, task_complition_date, p_id, e_id) VALUES
('API Gateway - Refactor - Error handling','Improve API error handling','2023-01-01','2023-01-10','Completed','2023-01-09',1,1),
('Database - Optimize - Connection pooling','Optimize DB pool','2023-01-02','2023-01-12','Completed','2023-01-11',2,2),
('Auth Service - Implement - Rate limiting','Add rate limiting','2023-01-03','2023-01-15','Completed','2023-01-14',3,3),
('Monitoring - Add - Custom metrics','Add metrics','2023-01-05','2023-01-20','Completed','2023-01-19',4,9),
('Cache Layer - Implement - Redis caching','Redis caching','2023-01-06','2023-01-25','Completed','2023-01-24',5,10),
('Users API - Migrate - v2 to v3','Upgrade Users API','2023-02-01','2023-02-20','Completed','2023-02-18',6,4),
('Projects API - Migrate - v2 to v3','Upgrade Projects API','2023-02-02','2023-02-22','Completed','2023-02-21',7,2),
('Tasks API - Migrate - v2 to v3','Upgrade Tasks API','2023-02-03','2023-02-25','Completed','2023-02-24',8,3),
('Documentation - Update - API v3 specs','Update docs','2023-02-10','2023-02-20','Completed','2023-02-19',9,13),
('SDK - Update - Client libraries','Update SDK','2023-02-11','2023-02-28','Completed','2023-02-27',10,14),
('Query Analysis - Profile - Slow queries','Analyze queries','2023-03-01','2023-03-10','Completed','2023-03-09',11,17),
('Index Optimization - Add - Missing indexes','Add indexes','2023-03-02','2023-03-15','Completed','2023-03-14',12,18),
('Query Refactor - Optimize - N+1 problems','Fix queries','2023-03-03','2023-03-20','Completed','2023-03-18',13,19),
('Cache Strategy - Implement - Query caching','Implement caching','2023-03-05','2023-03-25','In Progress','2023-03-20',14,20),
('Performance Testing - Execute - Load tests','Run tests','2023-03-06','2023-03-30','In Progress','2023-03-25',15,21),
('Dashboard - Design - Wireframes','Design UI','2023-01-01','2023-01-15','Completed','2023-01-14',16,5),
('Components - Build - Chart library','Build charts','2023-01-16','2023-02-01','Completed','2023-01-30',17,6),
('Navigation - Redesign - Main menu','Redesign UI','2023-02-01','2023-02-15','Completed','2023-02-14',18,7),
('Analytics - Integrate - Usage tracking','Add analytics','2023-02-16','2023-03-01','Completed','2023-02-28',19,8),
('Accessibility - Audit - WCAG compliance','Improve accessibility','2023-03-01','2023-03-20','In Progress','2023-03-18',20,6),
('Performance - Audit - Lighthouse score','Improve score','2023-02-01','2023-02-10','Completed','2023-02-09',21,5),
('Images - Optimize - Lazy loading','Optimize images','2023-02-11','2023-02-25','Completed','2023-02-24',22,7),
('CSS - Refactor - Critical CSS','Refactor CSS','2023-02-26','2023-03-10','Completed','2023-03-09',23,8),
('JavaScript - Bundle - Code splitting','Optimize JS','2023-03-11','2023-03-25','In Progress','2023-03-20',24,6),
('PWA - Add - Service worker','Add PWA','2023-03-15','2023-04-01','Planned','2023-03-25',25,5),
('GitHub Actions - Setup - Workflows','Setup CI','2023-01-01','2023-01-15','Completed','2023-01-14',26,9),
('Docker - Optimize - Build caching','Optimize Docker','2023-01-16','2023-01-30','Completed','2023-01-29',27,10),
('Security - Add - Container scanning','Add security','2023-02-01','2023-02-20','Completed','2023-02-18',28,31),
('Deployment - Automate - Production rollout','Automate deploy','2023-02-21','2023-03-10','Completed','2023-03-09',29,11),
('Monitoring - Integrate - Build metrics','Add monitoring','2023-03-01','2023-03-20','In Progress','2023-03-18',30,12),
('Kubernetes - Setup - Cluster configuration','Setup cluster','2023-01-01','2023-01-20','Completed','2023-01-19',31,39),
('Helm - Create - Charts for services','Create charts','2023-01-21','2023-02-05','Completed','2023-02-04',32,40),
('Ingress - Configure - Load balancer','Configure ingress','2023-02-06','2023-02-25','Completed','2023-02-24',33,41),
('Storage - Setup - Persistent volumes','Setup storage','2023-02-26','2023-03-15','Completed','2023-03-14',34,38),
('Migration - Execute - Service by service','Migrate services','2023-03-01','2023-04-01','In Progress','2023-03-25',35,39),
('Prometheus - Setup - Server configuration','Setup Prometheus','2023-03-05','2023-03-25','In Progress','2023-03-20',31,40),
('Grafana - Build - Dashboard templates','Build dashboards','2023-03-10','2023-04-01','Planned','2023-03-20',32,41),
('Alerting - Configure - Alert rules','Setup alerts','2023-03-15','2023-04-05','Planned','2023-03-20',33,39),
('Exporters - Deploy - Service monitors','Deploy exporters','2023-03-20','2023-04-10','Planned','2023-03-20',34,38),
('Documentation - Write - Runbooks','Write docs','2023-03-25','2023-04-15','Planned','2023-03-25',9,13),
('Market Research - Conduct - Competitive analysis','Research market','2023-01-01','2023-01-20','Completed','2023-01-19',4,14),
('Features - Prioritize - RICE scoring','Prioritize features','2023-01-21','2023-02-10','Completed','2023-02-09',4,15),
('Stakeholders - Align - Executive review','Stakeholder meeting','2023-02-11','2023-02-20','Completed','2023-02-19',4,16),
('Resources - Estimate - Engineering capacity','Estimate capacity','2023-02-21','2023-03-05','Completed','2023-03-04',4,13),
('Documentation - Create - PRD documents','Create PRD','2023-03-06','2023-03-20','In Progress','2023-03-18',4,14),
('Participants - Recruit - User interviews','Recruit users','2023-03-10','2023-03-25','In Progress','2023-03-20',4,15),
('Questions - Prepare - Interview guide','Prepare guide','2023-03-15','2023-03-30','Planned','2023-03-20',4,16),
('Interviews - Conduct - Sessions','Conduct interviews','2023-03-20','2023-04-10','Planned','2023-03-20',4,13),
('Data - Analyze - Interview findings','Analyze data','2023-03-25','2023-04-15','Planned','2023-03-20',4,14);

create table teams_audit (
	audit_id int auto_increment primary key,
    team_id int,
    action_type varchar(10),
    action_time datetime default current_timestamp
);

create table employee_audit (
	audit_id int auto_increment primary key,
    e_id int,
    action_type varchar(10),
    action_time datetime default current_timestamp
);

create table project_audit (
	audit_id int auto_increment primary key,
    p_id int,
    action_type varchar(10),
    action_time datetime default current_timestamp
);

create table task_audit (
	audit_id int auto_increment primary key,
    task_id int,
    action_type varchar(10),
    action_time datetime default current_timestamp
);

delimiter //
create trigger after_team_insert
after insert on teams
for each row
begin 
	insert into teams_audit(team_id, action_type)
    values (NEW.team_id, "INSERT");
END //
DELIMITER ; 

delimiter //
create trigger after_employee_insert
after insert on employee
for each row
begin 
	insert into employee_audit(e_id, action_type)
    values (NEW.e_id, "INSERT");
END //
DELIMITER ; 

delimiter //
create trigger after_project_insert
after insert on project
for each row
begin 
	insert into project_audit(p_id, action_type)
    values (NEW.p_id, "INSERT");
END //
DELIMITER ; 

delimiter //
create trigger after_task_insert
after insert on task
for each row
begin 
	insert into task_audit(task_id, action_type)
    values (NEW.task_id, "INSERT");
END //
DELIMITER ; 


-- Q2. Add a CHECK constraint to check end date is grater than start date
alter table project
add constraint chk_project_dates
check (p_end_date > p_start_date);


-- Clauses
-- Q3. Retrieve all employees who joined after `2022-01-01`, sorted by joining date in descending order. Show only the top 10.
select * 
from employee 
where e_join_date > "2022-01-01"
order by e_join_date
limit 10;


-- Q4. List all unique employee role values where the role contains `"Engineer"`.
select distinct e_role
from employee 
where e_role like "%Engineer%";


-- Aggregation Functions
-- Q5. How many employees are there in each team? Show tema id and employee count, only for teams with more than 3 employees.
select team_id, count(e_id) as total_member
from employee 
group by team_id 
having total_member > 3 ;


-- Q6. Find the total number of projects per status, and also show the average number of characters in project name for each status group.
select * from project;
select p_status, count(*), round(avg(length(p_name)),2) as avg_char
from project 
group by p_status;


-- Joins
-- Q7. List each employee's name, their team name, and the organisation they belong to. 
select * from teams;
select emp.e_name, t.team_name, o.org_id
from employee emp
left join teams t on emp.team_id = t.team_id
join organisation o on t.org_id = o.org_id ;

-- Q8. Show all projects along with the name of the employee leading them. 
select * from project;
select 
	pro.p_id, pro.p_name, t.team_id, emp.e_id, emp.e_name
from project pro
left join teams t on pro.team_id = t.team_id
join employee emp on pro.e_id = emp.e_id;

-- UNION & UNION ALL
-- Q9. Write a query that returns all task_name values with status 'Completed', and all project name values with status 'Completed', as a single result set. Use `UNION` first, then try `UNION ALL` — what's the difference in row count?
select task_name, task_status 
from task
where task_status = "Completed"
union all
select p_name,p_status
from project
where p_status = "Completed";

select count(*) 
from (select task_name, task_status 
	from task
	where task_status = "Completed"
	union
	select p_name,p_status
	from project
	where p_status = "Completed") t;

select task_name, task_status 
from task
where task_status = "Completed"
union all
select p_name,p_status
from project
where p_status = "Completed";

select count(*) 
from (select task_name, task_status 
	from task
	where task_status = "Completed"
	union all
	select p_name,p_status
	from project
	where p_status = "Completed") t;

-- with union 32 rows and with union all 49 rows

-- Sub-Query
-- Q10. Find all employees who are assigned to at least one project. Use a subquery.
select * from project;
select distinct p_name, e_id 
from project
where (select count(e_id) as emp from project having emp >= 1);

-- Q11. List employees whose joining date is earlier than the average of joining date of all employees.
select *
from employee
where e_join_date < (
    select FROM_DAYS(avg(TO_DAYS(e_join_date)))
    from employee);

-- Common Table Expression (CTE)
-- Q12. Using a CTE, find the team that has the highest number of 'In Progress' projects.
with pending as (
    select 
        team_id, 
        COUNT(*) as ct
    from project
    where p_status = 'In Progress'
    group by team_id)
select *
from pending
order by ct desc;

-- Q13. Write a CTE that first lists all employees with their task count, then from that CTE, select only employees who have handled more than 3 tasks.
with emp_task as (
	select e_id, count(*) as ct from task
	group by e_id
) select * from emp_task having ct > 3;


-- Window Function
-- Q14. Rank employees within each team by their joining date (earliest joiner = rank 1). 
select e_id, e_name, e_join_date, rank() over(order by e_join_date) from employee;

-- Q15. For each task, show the task name, its `p_id`, and the running total of tasks created so far using `SUM()` as a window function.
SELECT 
    task_name,
    p_id,
    task_creation_date,
    SUM(1) OVER (
        ORDER BY task_creation_date, task_id
    ) AS running_total_tasks
FROM task;

-- Date & Time Functions
-- Q16. Calculate how many days each project took to complete the project. Show project name and duration in days.
select p_name, datediff(p_end_date, p_start_date) as completionn_time from project;

-- Q17. Find all employees who have been with the company for more than 2 years from today's date. 
select e_id, e_name, e_role 
from employee
where year(datediff("2025-01-01", e_join_date)) > 2 ;

-- String Functions
-- Q18. Extract only the first word from project name (e.g., `"API Gateway - Refactor..."` → `"API"`).
select p_name, substring_index(p_name, " ", 1) as first_word from project;

-- Q19. Convert all name to uppercase, and also extract the domain part (after `@`) from each email.
select upper(e_name), substring_index(e_mail, "@", -1) as domain from employee;

-- CASE
-- Q20. Add a new derived column `experience_level` to the employee list:
-- - Joined before 2021 → 'Veteran'
-- - Joined 2021–2022 → 'Mid-level'
-- - Joined after 2022 → 'Fresher'
select * from employee;
select
	e_id, e_name, e_role,
    case
		when e_join_date < "2021-01-01" then 'Veteran'
        when e_join_date between "2021-10-01" and "2022-12-31" then 'Mid-level'
        when e_join_date > "2022-12-31" then 'Fresher'
        else 'other'
	end as experience_level
from employee;

-- Q21. Categorize each project as 'Short' (≤30 days), 'Medium' (31–60 days), or 'Long' (>60 days) based on days
select * from project;
select p_id, p_name, p_status,
	case
		when datediff(p_end_date, p_start_date) <= 30 then 'Short' 
        when datediff(p_end_date, p_start_date) between 31 and 60 then'Medium' 
        when datediff(p_end_date, p_start_date) >60 then 'Long'
	end as project_catogery
from project;


-- View
-- Q22. Create a view called `active_projects_view` that shows all projects with `p_status = 'In Progress'` along with the team name and assigned employee name.
create or replace view active_projects_view as
	select 
		pro.p_name, pro.team_id, t.team_name, pro.e_id, emp.e_name
	from project as pro
    left join teams t
    on pro.team_id = t.team_id
    join employee emp on pro.e_id = emp.e_id 
    where pro.p_status = 'In Progress' ;
    
select * from active_projects_view;

-- Q23. Create a view `employee_task_summary` that shows each employee's name and their total number of assigned tasks.
select * from task;
create or replace view employee_task_summary as
select 
	emp.e_id, emp.e_name, count(t.e_id) as total_task
from employee emp
left join task t 
on emp.e_id = t.e_id
group by emp.e_id;

select * from employee_task_summary;

-- Index
-- Q24. Write the SQL to create an index on `employee.team_id`. Now explain: why would this index speed up the JOIN between `employee` and `team`?
create index emp_team on employee(team_id);
