CREATE TABLE employees (
	employee_id INT  UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);

#rename the column name
Alter table employees rename column department_id to dept_id;

Create Table departments (
dept_id int UNSIGNED not null,
dept_name varchar(20),
manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
    primary key(dept_id));
desc departments;

#Add forign key to employee table

ALTER TABLE employees
ADD CONSTRAINT FK_Department
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);

 Alter table employees 
 ADD constraint FK_Manager
 foreign key(manager_id)
 references employees(employee_id);
 
show tables;

INSERT INTO employees
VALUES (1,'Aman','Sharma','ASHARMA','715.234.4577',
	STR_TO_DATE('16-JUN-1977', '%d-%M-%Y'),'AD_VP', 34000,NULL,7,5);

INSERT INTO employees
VALUES (2,'Gopi','Kumar','GKUMAR','715.134.8765',
	STR_TO_DATE('27-SEP-1979', '%d-%M-%Y'),'AD_PRES',
	29000,NULL,7,5);

INSERT INTO employees
VALUES (3,'Laxman','Dubey','LDUBEY','915.173.8969',
STR_TO_DATE('23-JAN-1983', '%d-%M-%Y'),'AD_VP',
28000, NULL,7,5);

INSERT INTO employees
VALUES (4,'Abhishek','Sharma','ASHARMA','901.765.7869',STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),
'FI_MGR',15000,NULL,6,4);

INSERT INTO employees
VALUES (5,'Bhuvan','Bhosle','BBHOSLE','999.673.9878',
STR_TO_DATE('01-MAY-1982', '%d-%M-%Y'),'FI_MGR',13000,
NULL,6,4);

INSERT INTO employees
VALUES (6, 'Danny','Devgan','DDEVGAN',
	'902.876.9498',STR_TO_DATE('12-JUN-1987', '%d-%M-%Y'),
	'FI_MGR',11000,NULL,7,4);

INSERT INTO employees
VALUES (7,'Velur','Patel','VPATEL','987.654.9765',
	STR_TO_DATE('27-FEB-1992', '%d-%M-%Y'),'FI_MGR',16000,
	NULL,8,5);
    
INSERT INTO employees
VALUES (8,'Krishna','Patel','VPATEL','987.654.9765',
	STR_TO_DATE('27-FEB-1992', '%d-%M-%Y'),'FI_MGR',25000,
	NULL,8,5);
    
INSERT INTO employees
VALUES (9,'Praveen','Kulkarni','PKulkarni','987.654.9765',
	STR_TO_DATE('27-FEB-1992', '%d-%M-%Y'),'FI_MGR',25000,
	NULL,8,2);
    
INSERT INTO employees
VALUES (10,'Prashant','Devadiga','PDevadiga','987.654.9765',
	STR_TO_DATE('27-FEB-1992', '%d-%M-%Y'),'FI_MGR',25000,
	NULL,8,null);
    
select * from employees;
select * from departments;

insert into departments values(1, 'Admin', 6,1);
insert into departments values(2, 'HR', 6,1);
insert into departments values(3, 'Finance', 6,1);
insert into departments values(4, 'sales', 7,2);
insert into departments values(5, 'Engineering', 7,2);


#create location table
create table locations(
location_id INT  UNSIGNED NOT NULL,
city varchar(40) not null,
primary key(location_id)
);
/* while creating foreign Key if we have inserted values to child table then we need to add values in parent table before creating foreign Key constraints*/ 

insert into locations values(1,'Mangalore');
insert into locations values(2,'Bangalore');

#Add forign Key to department Table
 Alter table departments 
 ADD constraint FK_Locations
 foreign Key(location_id)
 references locations(location_id);
 
 Alter table departments
 Add constraint FK_Employees
 foreign key(manager_id)
 references employees(employee_id);
 
#query to iner join employees and departments

select employees.employee_id, employees.first_name, employees.last_name, 
employees.dept_id, departments.dept_name
from employees inner join departments
on employees.dept_id = departments.dept_id
order by employees.employee_id;


select e.employee_id, e.first_name, e.last_name, 
e.dept_id,e.salary, d.dept_name
from employees e inner join departments d
on e.dept_id = d.dept_id
order by e.employee_id;

#query to join location and department table

select d.dept_id, d.dept_name,d.manager_id,d.location_id ,l.city
from departments d inner join locations l
on d.location_id = l.location_id;

#query to fetch the department in mangalore

select d.dept_id, d.dept_name,d.manager_id,d.location_id ,l.city
from departments d inner join locations l
on d.location_id =l.location_id
where l.city = 'Mangalore';

/* default join is inner join .insted of INNER JOIN we just give as JOIN it will give the same output */

# query to fetch employees in Mangalore -- Three table Join
select e.employee_id,e.first_name,e.last_name,e.email,e.phone_number, l.city,
e.hire_date,e.job_id,e.salary, d.dept_name
from employees e Join departments d
on e.dept_id =d.dept_id
join locations l
on d.location_id =l.location_id
where l.city = 'Mangalore';

/*----OUTER JOIN ----*/
 #query for left outer join -fetch all employees first name ,last name ,salary dept name
select e.employee_id, e.first_name, e.last_name, 
e.salary, e.dept_id, d.dept_name
from employees e Left outer join departments d
on e.dept_id = d.dept_id
order by e.employee_id;

/*query for right outer join  -
 fetch all the Data from department even if none off the employees belongs to the depatment*/
select e.employee_id, e.first_name, e.last_name, 
e.salary, e.dept_id, d.dept_name
from employees e Right outer join departments d
on e.dept_id = d.dept_id
order by e.employee_id;

/* FULL OUTER JOIN- does not work in my sql .It can be achived by FULL OUTER JOIN = LEFT JOIN +RIGHT JOIN */
select e.employee_id, e.first_name, e.last_name, 
e.salary, e.dept_id, d.dept_name
from employees e Left outer join departments d
on e.dept_id = d.dept_id
UNION
select e.employee_id, e.first_name, e.last_name, 
e.salary, e.dept_id, d.dept_name
from employees e Right outer join departments d
on e.dept_id = d.dept_id;
 /* ---SELF JOIN --*/
 
 select * from employees;
 select employee_id, first_name, manager_id from employees;
 
 /* Fetch emloyee id,employee name ,manager id manager name of the employees */
  select  e.employee_id,e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
  from employees e inner Join employees m
  on e.manager_id = m.employee_id;
  
  /* Fetch only manager name of the employees */
   select  distinct m.first_name, m.last_name
  from employees e JOIN employees m
  on e.manager_id = m.employee_id;

