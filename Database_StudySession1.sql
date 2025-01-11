/* create database */
 CREATE DATABASE study_database;
 
 /* To create table in the database need to select the database first .Use the database created */
use study_database;
 
/* List out /Show the databases created*/
 SHOW DATABASES;
 
create Table customers(
customer_id INTEGER PRIMARY KEY,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(10) NOT NULL,
dob DATE
);

/** To add new column to the Table use ALTER Commond.And Use AFTER keyword to add column at perticular position **/
ALTER TABLE customers ADD COLUMN phone_number VARCHAR(12) AFTER last_name;


 
INSERT INTO customers (customer_id, first_name, last_name, dob, phone_number) VALUES
(1,'John', 'Brown', '1997-06-24','800-555-1234');

INSERT INTO customers VALUES
(2,'Rita', 'Thomes','800-555-1234', '1997-07-24');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone_number) VALUES
(3,'Steeve', 'White', '1987-08-24','800-555-1045');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone_number) VALUES
(4,'Gail', 'Black', '1992-10-27','800-555-1098');

/** Alter the Existing column name with the new coolumn NAME **/
ALTER TABLE customers CHANGE dob DOB DATE;

ALTER TABLE customers ADD COLUMN state VARCHAR(20);
/* To Know the structure of the table use desc or describe command */
describe customers;
desc customers;

/* select command fetch data from the table*/
select * from customers;

/* Alter the column Type from varchar(20) to varchar(30)  */
ALTER TABLE customers MODIFY COLUMN state VARCHAR(30);

/*To drop perticular column from the Table use Drop command */
ALTER TABLE customers DROP COLUMN state;

/* Update the customers last name to Blue whose customer id is 2 */
UPDATE customers SET last_name = 'Blue' WHERE customer_id =2;

/* delete the customer whose customer id is 4*/
DELETE FROM customers WHERE customer_id =4;

 /* To List out the Table Created */
 SHOW TABLES;
 
 /* Renaming the table name */
 RENAME TABLE customers to customer;
 
 
 /* Truncate command used to delete all the data from table */
 TRUNCATE TABLE customers;
 
/*Drop command used to drop Table  from database */
DROP TABLE customers;
