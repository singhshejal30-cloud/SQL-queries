create database Adv_sql;
use Adv_sql;

CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT,
    email VARCHAR(100)
);

INSERT INTO Students (id, name, course, marks, email) VALUES
(1, 'Amit Sharma', 'Computer Science', 85, 'amit.sharma@example.com'),
(2, 'Priya Verma', 'Information Technology', 90, 'priya.verma@example.com'),
(3, 'Rahul Singh', 'Data Science', 78, 'rahul.singh@example.com'),
(4, 'Sneha Gupta', 'Artificial Intelligence', 88, 'sneha.gupta@example.com'),
(5, 'Vikas Yadav', 'Cyber Security', 82, 'vikas.yadav@example.com'),
(6, 'Neha Patel', 'Machine Learning', 95, 'neha.patel@example.com'),
(7, 'Rohan Mehta', 'Software Engineering', 80, 'rohan.mehta@example.com'),
(8, 'Anjali Nair', 'Cloud Computing', 87, 'anjali.nair@example.com'),
(9, 'Karan Joshi', 'Database Systems', 76, 'karan.joshi@example.com'),
(10, 'Meera Iyer', 'Web Development', 89, 'meera.iyer@example.com');

create view Students_view as 
select name,course,marks 
from Students;

select * from Students_view;

create view FD_Std as 
select name,course,marks 
from Students
where marks>80;

select * from FD_Std;

#shows how view was created 
show create view FD_Std;

#update views
update Students_view 
set marks=75 
where name='Amit Sharma';

delete from Students_view where name='Amit Sharma';

#Apply on two tables

create table course (
course_id int primary key,
course_name varchar(20));

create table std (
id int primary key,
name varchar(50),
course_id int,
foreign key(course_id) references course(course_id));

insert into course values(
1,"AIPA"),(2,"CSA"),(3,"COPA");

insert into std values
(101,"Amit",1),
(102,"Manisha",2),
(103,"Ravi",2),
(104,"Ram",1),
(105,"Harsh",3);

create view std_name_course as 
select s.id, s.name, c.course_name 
from std s                # alias(shorter form of table name)
join course c on s.course_id=c.course_id;

select * from std_name_course;

#view details
show create view std_name_course;





    

    
