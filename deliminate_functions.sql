CREATE DATABASE college_det;
USE college_det;

CREATE TABLE Student_s (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT,
    fee INT
);
INSERT INTO Student_s (name, age, course, marks, fee) VALUES
('Amit', 20, 'AIPA', 78, 40000),
('Neha', 19, 'AIPA', 85, 42000),
('Rahul', 17, 'COPA', 65, 30000),
('Pooja', 21, 'COPA', 90, 35000),
('Karan', 18, 'AIPA', 72, 38000);

select*from student_s;
DELIMITER $$
Create procedure studentsdetail()
begin
	select*from student_s;
end $$
DELIMITER ;
Call studentsdetail;
DELIMITER $$
create procedure students_course(in course_name varchar(50))
begin
	select * from student_s where course=course_name;
end $$
DELIMITER ;
call students_course('AIPA');
DELIMITER $$
create procedure Eligible()
begin
	select name,age,
    if(age >=18,"Eligible","Not Eligible") as Remarks
    from student_s;
end $$
DELIMITER ;
Call Eligible();

DELIMITER $$
create procedure feeIncrease( in course_name varchar(10))
begin
	update student_s
    set fee = fee+5000
    where course=course_name;
end $$
DELIMITER ;

Call feeIncrease('COPA');
select*from student_s;
Call studentsDetail();

#functions in SQL

DELIMITER $$
create function Grades(marks int)
returns varchar(1)
deterministic
begin
	if marks >=70 then
		return 'B';
     else
		return 'C';
     end if;
end $$
DELIMITER ;     

select name,age,marks,Grades(marks) as STD_Grades from Student_s;

DELIMITER $$
create function FeeDiscount(fee int)
returns int
deterministic
begin
	return fee * 0.10;
end $$

DELIMITER ;

select name,feeDiscount(fee) as discount_fee from student_s;
select name,marks,fee from Student_s where Grades(marks)="A";

-- drop procedure if exists Students_Course;    
-- drop function if exists FeeDiscount;
