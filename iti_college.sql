create database ITI_College;
use ITI_College;

create table Student_s(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into Student_s values
(101,'anil',78,'C','Pune'),
(102,'Bhumika',93,'A','Mumbai'),
(103,'Chetan',85,'B','Mumbai'),
(104,'Dhruv',96,'A','Delhi'),
(105,'emanuel',12,'F','Delhi'),
(106,'farah',82,'B','Delhi');

create table dept(
id int primary key,
name varchar(50)
);

insert into dept values
(101,'english'),
(102,'IT');

select * from dept;

create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key(dept_id) references dept (id)
on update cascade
on delete cascade
);
insert into teacher values
(101,'adam',101),
(102,'eve',102);

select * from teacher;


