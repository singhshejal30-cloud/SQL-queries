#triggers
create database trig_1;
use trig_1;
create table employees (
employee_id int auto_increment primary key,
name varchar(100),
department varchar(100)
);

create table emp_trig(
log int auto_increment primary key,
employee_id int,
messege varchar(100),
created_at timestamp default current_timestamp);


delimiter $$

create trigger after_insert
after insert on employees
for each row
begin
	insert into emp_trig(employee_id,messege)
    values (new.employee_id,concat('new employee added: ',new.name));
end$$
    
delimiter ;


insert into employees(name, department)
value("shivali","Admin");

select * from emp_trig;

delimiter $$
create trigger after_delete
after delete on employees
for each row
begin
	insert into emp_trig(employee_id,messege)
    values (old.employee_id,concat('employee deleted: ',old.name));
end$$

delimiter ;

delete from employees where employee_id=2;

delimiter $$
create trigger after_update
after update on employees
for each row
begin
	insert into emp_trig(employee_id,messege)
    values (new.employee_id,concat('employee update: ',old.name,"new name",new.name));
end$$

delimiter ;

  
  update employees 
  set name = "Shejal"
  where employee_id = 3;
  
  
  
  select * from emp_trig;