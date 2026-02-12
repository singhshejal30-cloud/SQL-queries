create database BookstoreDB;
use BookstoreDB;

create table Customers(
customer_id int primary key,
customer_name varchar(50),
email varchar(50),
city varchar(100),
registration_date date);

create table Authors(
author_id int primary key,
author_name varchar(50),
country varchar(50));

create table categories(
category_id int primary key,
category_name varchar(50));

create table Books(
book_id int primary key,
title varchar(50),
price varchar(50),
author_id varchar(50),
category_id varchar(50));

create table orders(
order_id int primary key,
customer_id int,
order_date date,
total_amount int,
foreign key (customer_id) references Customers(customer_id)
);

create table Order_Details(
order_details_id int primary key,
order_id int,
book_id int,
quantity tinyint);

alter table Customers add contact_number bigint;

insert into Customers values
(1,'Amit','amit@gmail.com','Delhi','2024-01-10','9876543210'),
(2,'Riya','riya@gmail.com','Mumbai','2024-02-12','9876543222'),
(3,'Neha','neha@gmail.com','Delhi','2024-03-15','9876543333'),
(4,'Rahul','rahul@gmail.com','Pune','2024-04-01','9876544444'),
(5,'Ankit','ankit@gmail.com','Delhi','2024-04-10','9876545555');

insert into Authors values
(1,'Robert Martin','USA'),
(2,'James Gosling','USA'),
(3,'Guido van Rossum','Netherlands'),
(4,'Dennis Ritchie','USA'),
(5,'Bjarne Stroustrup','Denmark');

insert into Categories values
(1,'Programming'),
(2,'Database'),
(3,'Networking'),
(4,'AI'),
(5,'Web Development');

insert into Books values
(1,'Clean Code',600,1,1),
(2,'Java Basics',450,2,1),
(3,'Python Guide',550,3,1),
(4,'C Programming',400,4,1),
(5,'AI Fundamentals',800,5,4);

insert into Orders values
(1,1,'2024-05-01',1200),
(2,2,'2024-05-03',450),
(3,1,'2024-05-05',800),
(4,3,'2024-05-07',600),
(5,1,'2024-05-10',400);

insert Order_Details values
(1,1,1,2),
(2,2,2,1),
(3,3,5,1),
(4,4,1,1),
(5,5,4,1);

SET SQL_SAFE_UPDATES = 0;

update books
set price = price*1.10
where category_id = (
select category_id from categories
where category_name = 'programming');

delete from Customers
where customer_id not in (
select distinct customer_id from Orders);

select count(*) as total_books from Books;

select max(price) as Highes_price from Books;

select min(price) as Lowest_marks from Books;

select avg(total_amount) as Avg_order_value from Orders;

select upper(customer_name) as name, city from Customers;

select sum(quantity) as Total_book_sold from Order_Details;

SELECT c.customer_name, b.book_title, o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Details od ON o.order_id = od.order_id
INNER JOIN Books b ON od.book_id = b.book_id;





