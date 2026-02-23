create database uniDB;
use uniDB;

create table Students(
StudentID int primary key,
Name varchar(50),
Email varchar(100),
Address varchar(100),
DateofBirth date);

create table Department(
DepartmentID int primary key,
DepartmentName varchar(100),
HeadofDepartment varchar(50)
);

create table Faculty(
FacultyID int primary key,
Name varchar(50),
Designation varchar(50),
DepartmentID int,
foreign key (DepartmentID) references department(DepartmentID)
);

create table Courses(
CourseID int primary key,
CourseName varchar(50),
Credits int,
DepartmentID int,
foreign key (DepartmentID) references department(DepartmentID)
);

create table Registrations(
RegistrationID int primary key,
StudentID int,CourseID int,
Semester varchar(20),
Year int,
foreign key (StudentID) references students(StudentID),
foreign key (CourseID) references courses(CourseID)
);

create table Classrooms(
RoomNumber int primary key,
Building varchar(50),
Capacity int);

show tables;

insert into Department values
(1, "COPA", "Mrs.Sarika Shrivastva"),
(2, "EM", "Mr.Anil Kumar");

insert into Students values
(1, "Shejal", "shejal30@gmail.com", "Kunda", "2007-09-10"),
(2, "Shipra", "shipra12@gmail.com", "Ballia","2000-10-11");

insert into Faculty values
(201,"Mr. shailesh Yadav", "Faculty AIPA",1),
(202,"Mr.Sudheer Kumar", "Faculty EM",2);

insert into Courses values
(301,"Computer Operator",4,1),
(302,"Computer Fundamental",5,1);

insert into Registrations values
(1, 1, 301, 'Semester 1', 2025),
(2, 2, 302, 'Semester 1',2025);

insert into Classrooms values
(101, "Block A",500),
(102, "Block B",500);

-- select queries
select * from students; 
select * from courses;
select * from department;
select * from Registrations;

-- join queries student with courses.
select Students.name, Courses.CourseName
from Students
inner join Registrations on Students.StudentID = Registrations.StudentID
inner join Courses on Registrations.CourseID = Courses.CourseID;

-- update queries 
update Students set address = "Noida" WHERE StudentID = 2;

-- delete query
delete from Registrations where RegistrationID = 1;



















