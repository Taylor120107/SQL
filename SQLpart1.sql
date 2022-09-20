create database QA_Restaurant;
use QA_Restaurant;
create table Customer(
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
phone_number char (11) not null,
primary key(cust_id));
show tables;
describe customer;

