
use QA_Restaurant;

create table customers(
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
cust_email varchar(100) unique not null,
cust_phone char(11) not null,
primary key (cust_id));

create table Menu_items(
order_id int unique not null auto_increment,
item_name varchar(100) not null,
course_type varchar(100) not null,
price decimal(11) not null,
primary key (order_id));

show tables;

alter table customers add gender char default "";
describe customers;
alter table customers drop gender;
describe customers;


