create database Online_shopping;
use Online_shopping;
create table products(
product_id int primary key auto_increment,
pro_name varchar(50),
price float,
stock varchar(100),
category varchar(200));

create table customers(
cus_id int  primary key,
cus_name varchar(100),
e_mail varchar(200),
phone int);


create table orders(
order_id int  primary key,
customer_id int,
foreign key(customer_id)references customers(cus_id),
order_date date not null,total_amount float);


create table order_details(
order_detail_id int primary key,
order_id int,
foreign key(order_id)references orders(order_id),
product_id int,
foreign key(product_id)references products(product_id),
quantity int);


insert into products(pro_name,price,stock,category)
values
("silver",15000,"instock","domestic"),
("smart nova",12000,"instock","domestic"),
("classic",15000,"outstock","domestic"),
("dr.health",20000,"instock","domestic"),
("crystal",18000,"outstock","domestic");
insert into customers(cus_id,cus_name,e_mail,phone)
values
(1,"alan","alan@gmail.com",87536489),
(2,"jithin","jithin@hotmail.com",987452974),
(3,"gokul","gki@gmail",76408524),
(4,"rekha","rks@yahoo",965409224),
(5,"james","james@gmail",8466692);
insert into orders(order_id,customer_id,order_date,total_amount)
values

(2,1,"2025-03-22",10000),
(3,2,"2025-02-15",15000),
(4,3,"2022-10-27",25000),
(5,4,"2023-05,10",18000);

insert into  order_details(order_detail_id,order_id,product_id,quantity)
values
(1,1,1,2),
(2,3,4,4),
(3,2,2,1),
(4,4,3,6),
(5,4,5,7);
select products.pro_name,order_details.quantity
from products     
inner join order_details
on products.product_id=order_details.order_id
order by quantity desc;
insert into orders(order_id,customer_id,order_date,total_amount)
values
(6,2,"2020-06-15",30000),
(7,5,"2020-06-15",15000),
(8,1,"2020-06-15",20000),
(9,4,"2020-06-15",18000);

use Online_shopping;
select products.pro_name,orders.order_id,order_details.quantity
from order_details
inner join orders
on order_details.order_id=orders.order_id
inner join products
on products.product_id=orders.order_id
where order_date="2025-03-22";
 
 select products.pro_name,order_details.quantity,(products.price*order_details.quantity)as gross_amount
 from products
 inner join order_details
 on products.product_id=order_details.product_id;
 
 
