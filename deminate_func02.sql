create database college_02;
use college_02;

CREATE TABLE Students_SP (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT,
    fee INT
);

INSERT INTO Students_SP (name, age, course, marks, fee) VALUES
('Amit', 20, 'AIPA', 78, 40000),
('Neha', 19, 'AIPA', 85, 42000),
('Rahul', 17, 'COPA', 65, 30000),
('Pooja', 21, 'COPA', 90, 35000),
('Karan', 18, 'AIPA', 72, 38000);

select * from Students_SP;

DELIMITER $$
create procedure StudentsDetail()
begin
	select * from Students_SP;
end $$
-- create procedure AllCoursename()
-- begin
-- 	select * from Course_SP;
-- end $$

DELIMITER ;

call StudentsDetail(); 

DELIMITER $$ 
create procedure Students_Course(in course_name varchar(50))
begin
	select * from Students_SP where course=course_name;
end $$
DELIMITER ;

call Students_Course('AIPA');

DELIMITER $$ 
create procedure Eligible()
begin
	select name,age,
    if(age >=18,"Eligible","Not Eligible") as Remarks
    from Students_SP;
end $$
DELIMITER ;

call Eligible();

DELIMITER $$ 
create procedure FeeIncrease(in course_name varchar(10))
begin
	update Students_SP
    set fee = fee + 5000
    where course=course_name;
end$$
DELIMITER ;

call FeeIncrease('COPA');

call StudentsDetail();

#functions in SQL

DELIMITER $$ 
create function Grades(marks int)
returns varchar(1)
deterministic
begin 
	if marks >=85 then
		return 'A';
    elseif marks >=70 then
		return 'B';
	else
		return 'C';
	end if;
end $$
DELIMITER ;

select name,age,marks,Grades(marks) as STD_Grades from Students_SP;

DELIMITER $$
create function FeeDiscount(fee int)
returns int
deterministic
begin
	return fee * 0.10;
end $$
DELIMITER ;

select name,fee,FeeDiscount(fee) as Discounted_fee from Students_SP;

select name,marks,fee from Students_SP where Grades(marks)="A";


-- drop procedure if exists Students_Course;   
-- drop function if exists FeeDiscount;