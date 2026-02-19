create database shopDB;
use shopDB;

create table customers(
cust_id int auto_increment primary key,
name varchar(100),
email varchar(100),
address varchar(200)
);

insert into customers(name,email,address)
values ("Suraj","suraj@gmail.com","Delhi india"),
("Akriti","akriti12@gmail.com","Banglor india"),
("Neha","neha123@gmail.com","Mumbai india");

select * from customers;

select name from customers;
select distinct name address from customers;

-- filtering data.
select * from customers where address like "%Pune%";

select * from customers where name = "Neha" and Address like 'Mumbai india';

select * from customers where Address not like '%Mumbai%';

-- Sorting data
select * from customers order by name asc;
select * from customers order by name desc;

-- drop table customers;

select * from customers;

-- update query.
update customers
set address = 'Pune'
where name = 'Suraj';


select * from customers where name = 'Suraj';

delete from customers
where name ="Akriti";
---------------------------------------------------------------------------
create table Sales(
SalesID int auto_increment primary key,
Product varchar(50),
Category varchar(50),
Amount decimal(10.2),
SaleDate date
);

show tables;
insert into Sales(Product,Category,Amount,SaleDate)
values
('pen','stationary',25.00,'2025-03-01'),
('notebook','stationary',50.00,'2025-03-01'),
('mouse','electronics',500.00,'2025-03-02'),
('keyboard','electronics',700.00,'2025-03-02'),
('charger','electronics',500.00,'2025-03-03'),
('bag','accessories',1000.00,'2025-03-04');

select count(*) from Sales;
select sum(amount) from Sales;
select avg(amount) from Sales;
select min(amount), max(amount) from Sales;

#Grouping
select Category, sum(amount)
from Sales
group by Category;

select Category, sum(amount)
from Sales
group by Category
having sum(amount)>1000;

-- -------------------SUBQUERIES----------------
select product,Amount
from Sales
where Amount > (select avg(Amount) from Sales);


-- --------------CTE----------------------
with CategoryTotals as(
select Category,sum(Amount) as Totalsales
from Sales
group by Category
)
select Category,TotalSales
from CategoryTotals
where TotalSales > 1000;

-- -------------------view------------------
create view CategorySales as
select Category,sum(Amount) as TotalSales
from Sales
group by Category;

select * from CategorySales where TotalSales > 500;




















 








