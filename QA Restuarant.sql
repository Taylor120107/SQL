create database QA_Restaurant;
use QA_Restaurant;

create table customers(
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
cust_email varchar(100) unique not null,
cust_phone char(11) not null,
primary key (cust_id));

create table Menu_items(
item_id int unique not null auto_increment,
item_name varchar(100) not null,
course_type varchar(100) not null,
price float(3,2) not null,
primary key (order_id));

create table orders(
order_id int unique not null auto_increment,
cust_id int not null,
total_price decimal(6,2),
primary key(order_id),
foreign key (cust_id) references customers(cust_id));

create table order_items(
order_id_id int unique not null auto_increment,
ord_id int not null,
item_id int not null,
quantity int,
primary key(order_id_id),
foreign key (ord_id) references orders(order_id),
foreign key (item_id) references menu_items (item_id)); 

show tables;

alter table customers add gender char default "";
describe customers;
alter table menu_items modify price decimal(3,2);
alter table menu_items change order_id item_id int unique not null auto_increment;

describe customers;
describe menu_items;
describe orders;
describe order_items;

select*from customers;
select*from Menu_items;
select*from orders;
select*from order_items;
select order_id, price from Menu_items;
select cust_name,cust_phone from customers;

#dml commands
#create-insert into
#read-select
#update-update
#delete-delete

insert into customers(cust_name, cust_email, cust_phone) values("Graham", "G45@msn.com", "0764888562");
update customers set c_name="bob"; #updating column however this will not work due to safe mode, need to specify row
update customers set cust_phone="0791145632" where cust_id=3;#this is speciyfying which name to change
delete from customers where cust_id=2; #this is an example of deletion, must be specific otherwise it will delete everything

insert into Menu_items(item_name, course_type, price) values("Tiramisu", "Dessert", "5");
update Menu_items set price=8.75 where item_id=1;
delete from Menu_items where order_id=3;

insert into orders(cust_id,total_price) values(6,22.00);
update orders set cust_id=3 where order_id=1;

insert into order_items(ord_id,item_id,quantity) values(6,1,5);
update order_items set ord_id=1 where order_id=1;

insert into customers(cust_name, cust_email, cust_phone) values("Chloe", "C45@msn.com", "0764874562"),("Chloe", "C45@msn.com", "0764874562");#can run multiple inputs on this one line

#read from tables to view the records:
#- select * from table_name
#- Select col1,col2,col4 from table_name;
#where caluse
# select * from table_name where col_name=value 
select * from order_items where col_name= ord_id=4;#filtering what you see

#operators
# = equals to... 
# > greater than - exclusive
# < less than - exclusive
# !=
# >= greater than - inclusive
# <= less than - inclusive
select * from menu_items where price>5.00;
select * from menu_items where price>1.00 and price<5.00;#items between these ranges exclusive of 1 and 5
#can use "between" and this will be an inclusive range for above it would include 1 and 5
# search for patterns - text data
select * from menu_items where item_name like "%s";#percentage sign shows items where character is proceeding
select * from menu_items where item_name like "s%";#this is the opposite look for items with character at the beginning

select distinct ord_id from order_items;# select unique items 
#ordering data
select * from menu_items order by item_name; #default is alphabetical but if you put "desc"/"asc" on the end it will reverse

#limiting data
select * from menu_items limit 2; #will give first 2 records in table 
select * from menu_items order by item_id desc limit 2; # can add multiple commands together 

#aggregate functions- when you have a rnage and want to perform an operation on them to return
#average-avg
#sum- sum
#minimum-min
#maximum-max
#count-count

select avg(price) from menu_items;
select min(price) from menu_items;
select sum(price) from menu_items;
select count(price) from menu_items;

#nested queries- a query in a query
select cust_id from orders where order_id=2; #returns no
select * from customers where cust_id=5;
#nested for above input
select * from customers where cust_id-(select cust_id from orders where ord_id=2);

select item_id from order_items where ord_id=1; 
select * from menu_items where item_id=1;
#nested query below
select * from menu_items where item_id=(select item_id from order_items where ord_id=1);

#nested queries work from right to left

#joins
#inner joins- default sql join-combines tables together based on present data in tables
select*from customers;
select* from orders;
select * from customers join orders on customers.cust_id=orders.cust_id;
#tables with same column names specify which table it needs to come from and which position you want it in
select customer.c_name, cust.phone ,orders.order_id from customers c join orders o on c.cust_id=o.cust_id;
#can give tables alises such as c for customer and o for orders
#outer joins- 2 types left outer join and right outer join
#left outer joins-
select customer.c_name, cust.phone ,orders.order_id from customers c left outer join orders o on c.cust_id=o.cust_id;#customers table is looking for records to match in the order table(displayed on the right of it), will state null for no order records
#right outer joins-
select customer.c_name, cust.phone ,orders.order_id from customers c right outer join orders o on c.cust_id=o.cust_id;#orders table is looking for records to mathc in the customer table(displayed on the left if it), will still say null for those without order recrords






