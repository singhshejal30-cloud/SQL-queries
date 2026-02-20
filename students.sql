create database students_management;

use students_management;

create table students(
id int primary key auto_increment,
name varchar(50),
age tinyint,
trade varchar(10),
course_id tinyint);

create table courses(
course_id tinyint primary key,
course_name varchar(50),
duration_months int);

create table marks(
mark_id tinyint primary key,
id int,
subject varchar(50),
marks smallint,
foreign key (id) references students(id));

insert into students(name,age,trade,course_id) 
values ("Ajay",28,"DM",106),
("Swati",26,"FDT",107)
;

insert into courses values(101,"CTS",12),
(102,"CITS",12),
(103,"Diploma",24),
(104,"Apprentice",6),
(105,"Guest Faculty",11);

insert into marks values 
(1,2,"DBMS",85),
(2,2,"Python",96),
(3,2,"Maths",88),
(4,3,"Machine learning",92),
(5,4,"Deep Learning",77);

select * from students;
select * from courses;
select * from marks;


select count(*) as total from students;
select count(*) as total_marks from marks;
select count(*) as total_courses from courses;

select id, sum(marks) as Total_Marks from marks group by id;

select id,avg(marks) as Avg_marks from marks group by id;

select max(marks) as highes_marks from marks;

select min(marks) as minimum_marks from marks;
