create database study_company;

create Table product1(
category int(15) unsigned not null,
product_name varchar(20));

create Table product2(
category int(15) unsigned not null,
product_name varchar(20));

describe product1;
describe product2;

insert into product1 values(1,'nokia'),(2,'samsung'),(3,'hp'),(6,'nokia');

insert into product2 values(1,'dell'),(2,'lg'),(3,'hp'),(6,'nokia'),(4,'samsung'),(5,'redmi'),(7,'nokia');

SET SQL_SAFE_UPDATES = 0;
/* Update the product_name ='nikon' where category= 6 */
update product1 set product_name ='nikon' where category= 6;
update product2 set product_name ='nikon' where category= 6;


select* from product1;
select * from product2;

/*UNION ALL- Fetch all the value including duplicate */
select* from product1
UNION ALL
select * from product2;

/*UNION - Fetch the value including duplicate */
select* from product1
UNION 
select * from product2;