create database hospital;
use hospital;

create table patients(
patient_id int primary key,
patient_name varchar(50),
age int,
gender varchar(10),
city varchar(50)
);

create table doctors(
doctor_id int primary key,
doctor_name varchar(50),
specialization varchar(50)
);

create table appointments(
appointment_id int primary key,
patient_id int,
doctor_id int,
appointment_date date,
foreign key (patient_id) references patients(patient_id),
foreign key (doctor_id) references doctors(doctor_id)
);
show tables;
show databases;

insert into patients values
(1,"shejal",20,"female","Prayagraj"),
(2,"shipra",25,"female","Ballia"),
(3,"Raj",22,"Male","Delhi"),
(4,"Shriti",20,"female","Kanpur"),
(5,"Manish",25,"Male","Mumbai");

insert into doctors values
(101,"Dr.Priya","Cardiology"),
(102,"Dr.sakshi","Physiotherepist"),
(103,"DR.shejal","Neurology");

insert into appointments values
(1001,1,101,"2025-01-10"),
(1002,1,102,"2025-01-11"),
(1003,2,103,"2035-01-04"),
(1004,4,101,"2025-12-12");

#inner joins
select p.patient_name,
d.doctor_name,
d.specialization,
a.appointment_date
from appointments a
inner join patients p on a.patient_id=p.patient_id
inner join doctors d on a.doctor_id=d.doctor_id;

select * from patients
inner join appointments 
on patients.patient_id=appointments.patient_id;

select * from patients
left join appointments 
on patients.patient_id=appointments.patient_id;

select * from patients
left join appointments 
on patients.patient_id=appointments.patient_id  #give only one join 
union
select * from patients
right join appointments 
on patients.patient_id=appointments.patient_id;












