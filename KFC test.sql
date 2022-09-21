

create table customers(
c_id int unique not null auto_increment,
c_name varchar(100) default "",
phone_number varchar(11) not null,
over_18 boolean,
points decimal(6,2),
primary key(c_id)
);

show tables;

describe customers;

alter table customers add age int not null; #update an existing table, adda  new column
alter table customers drop column over_18; 
alter table customers modify c_name varchar(50) default "n/a";

drop table customers;