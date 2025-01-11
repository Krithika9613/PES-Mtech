CREATE DATABASE Study_hr_emp;
USE Study_hr_emp;
/* create the table*/
create table employees(
employee_id int(11)unsigned not null,
first_name varchar(20),
last_name varchar(25) not null,
salary int(7) not null,
primary key(employee_id));

desc employees;

insert into employees(employee_id, first_name,last_name,salary) values(101,'Steeve','King',10000);
insert into employees(employee_id, first_name,last_name,salary) values(102,'Harry','Potter',15000);
insert into employees(employee_id, first_name,last_name,salary) values(103,'David','Jack',20000);
insert into employees(employee_id, first_name,last_name,salary) values(104,'Harries','Pinto',25000);
insert into employees(employee_id, first_name,last_name,salary) values(105,'David','King',20000);
insert into employees(employee_id, first_name,last_name,salary) values(106,'Harries','Jack',23000);
insert into employees(employee_id, first_name,last_name,salary) values(107,'Streffy','Jacob',30000);
select * from employees;

/* Update the last name to Desouza if emp_id is 103 */
update employees set last_name= 'King' where employee_id = 103;

/* Update the last name to last_name to'Cohen', salary to 23000 if emp_id is 103 */
update employees set last_name= 'Cohen', salary=23000 where employee_id = 101;

/* fetch the data whose employee id is 101,102,105*/
/* both the below command gives output */
select * from employees where employee_id =101 or employee_id =102 or employee_id=105; -- This is not a good approach --

select * from employees where employee_id in(101,102,105); -- This is a good approach --

/* fetch the employee whose last name is King and salary is 10000 */
select * from employees where last_name = 'King' and salary =10000;

/* fetch the employee either his last name is King or salary is 20000 */
select * from employees where last_name = 'King' or salary =20000;

/* commands for comparision operator*/
/* fetch the employee salary is equal to 20000 */
select * from employees where salary = 20000;

/* fetch the employee salary is not equal to 20000 */
select * from employees where salary != 20000; -- not equal to can be represented as <> or !=

/* fetch the employee salary is greater than  20000 */
select * from employees where salary > 20000;

/* fetch the employee salary is greater than or equal to 20000 */
select * from employees where salary >= 20000;

/* fetch the employee salary is less than 20000 */
select * from employees where salary < 20000;

/* fetch the employee salary is less than or equal to 20000 */
select * from employees where salary <= 20000;

/* commands for Special operator*/
/* Fetch the employee first name start with 'st'*/
select * from employees where first_name like 'st%';

/*fetch the employee whose name has 'e' in it and followed by only one character  */
select * from employees where first_name like '%e_';

/*fetch the employee whose name has 2nd character as 'a' in it and followed by any character  */
select * from employees where first_name like '_a%';

/* fetch the employee whose name contains 'f' in it */
select * from employees where first_name like '%f%';

/* fetch the employee whose last name  ends 'g'  */
select * from employees where last_name like '%g';

/* fetch the employee whose last name  doesnot ends  'g'  */
select * from employees where last_name not like '%g';

/*fetch the employee whose salary falls in the range of 20000 to 25000 */
select * from employees where salary between 20000 and 25000;

/*fetch the employee whose salary not falls in the range of 20000 to 25000*/
select * from employees where salary  not between 20000 and 25000; 

/*fetch the  distinct salary given to the employees */
select distinct salary from employees; -- here it list out the unique salary value not thesalary given to each employee --

/* select unique last name of the employees */
select distinct(last_name) from employees;

Alter table employees Add Dept_id int(7) not Null;
update employees set Dept_id =1 where employee_id in(101,104,106);
update employees set Dept_id =2 where employee_id in(102,107);
update employees set Dept_id =3 where employee_id in(103,105);
insert into employees(employee_id, first_name,last_name,salary,Dept_id) values(108,'Johny','Jacob',10000,4);
insert into employees(employee_id, first_name,last_name,salary,Dept_id) values(109,'Charls','Blue',30000,2);
/*Aggregate function */
select AVG(salary) from employees;
select Count(*) from employees; 
select sum(salary) from employees;
select Min(salary) from employees;
Select Max(Salary) from employees;

/*fetch the average salary of employees in department 2 */
select Avg(salary) from employees where dept_id=2;

/* All department with corresponding Avg salary */
-- if we have aggregate and non aggregate function then we should do group by --
select Dept_id ,Avg(salary) from employees group by Dept_id;

/*fetch all department with corresponding count,Min ,Max and sum  of salary*/
select Dept_id, count(*),min(salary), max(salary), sum(salary) from employees group by Dept_id;

/*fetch all department except Dept_id 2 with corresponding count,Min ,Max and sum  of salary*/
select Dept_id, count(*),min(salary), max(salary), sum(salary) from employees 
where dept_id != 2
group by Dept_id;

/* calculate Avg,Min ,Max and sum of dept where there are more than 2 employees  */
select Dept_id, count(*),min(salary), max(salary), sum(salary) from employees 
group by Dept_id
having count(Dept_id)>2;

/*Sort the employees in ascending order of first name */
select * from employees Order by first_name;

/*Sort the employees in descending order of first name */
select * from employees Order by first_name desc;

/*Sort the employees in ascending order of first name and last name */
select * from employees Order by first_name, last_name;

/*Sort the employees in ascending order of first name and descending order of last name */
select * from employees Order by first_name, last_name desc;

/*Sort the employees in descending order of last name and ascending order of first name */
select * from employees Order by last_name desc,first_name;

/* calculate Avg,Min ,Max and sum of dept where there are more than 2 employees  sort by descending order of dept_id*/
select Dept_id, count(*),min(salary), max(salary), sum(salary) from employees 
group by Dept_id
having count(Dept_id)>2
order by dept_id Desc;

/*Delete the employee details whose employee_id is 101 or 103*/
delete from employees where employee_id in(101,103);

-- Truncate the Table employee to Wipe out all data from table --
truncate table employees;

Show tables;
