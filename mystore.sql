create database retailstore;
use retailstore;

create table custo_1(
custo_id int primary key,
custoname varchar(100)
);

create table orders(
orderid int primary key,
product varchar(100),
amount decimal(10,2),
custo_id int,
foreign key(custo_id) references custo_1(custo_id)
);


insert into custo_1 values
(1,'Rahul Sharma'),
(2,'Anjali Mehta'),
(3,'Amit Verma'),
(4,'Nisha Roy');

insert into orders values
(101,'Laptop',5000,2),
(102,'Mouse',500,1),
(103,'Keyboard',700,1),
(104,'Monitor',12000,null);

-- -----------------JOIN------------------------------- 
select custo_1.custoname,orders.product,Orders.amount
from custo_1
inner join orders on custo_1.custo_id=Orders.custo_id;

select custo_1.custoname,orders.product,Orders.amount
from custo_1
left join orders on custo_1.custo_id=Orders.custo_id;

select custo_1.custoname,orders.product,Orders.amount
from custo_1
right join orders on custo_1.custo_id=Orders.custo_id;

select * from custo_1;
select * from orders;

