
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
price float(3,2) not null,
primary key (order_id));

show tables;

alter table customers add gender char default "";
describe customers;
alter table menu_items modify price decimal(3,2);
describe customers;
describe menu_items;
select*from customers;
select*from Menu_items;
select order_id, price from Menu_items;
select cust_name,cust_phone from customers;

#dml commands
#create-insert into
#read-select
#update-update
#delete-delete

insert into customers(cust_name, cust_email, cust_phone) values("Chloe", "C45@msn.com", "0764874562");
update customers set c_name="bob"; #updating column however this will not work due to safe mode, need to specify row
update customers set cust_phone="0791145632" where cust_id=3;#this is speciyfying which name to change
delete from customers where cust_id=2; #this is an example of deletion, must be specific otherwise it will delete everything

insert into Menu_items(item_name, course_type, price) values("Tiramisu", "Dessert", "5");
update Menu_items set price=8.50 where order_id=1;
delete from Menu_items where order_id=3;
