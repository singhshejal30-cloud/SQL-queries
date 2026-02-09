create database transactio_n;
use transactio_n;
#transaction in SQl

create table BankAccnt(
id int primary key,
name varchar(50),
balance int);

insert into BankAccnt values
(1,"amit",5000),
(2,"rahul",6000),
(3,"vivek",4000),
(4,"raj",1000);

start transaction;		#for start sinle unit run

update BankAccnt
set balance=balance  + 1000
where id=4;

update BankAccnt
set balance=balance  - 1000
where id=2;

commit;		#for save data permanent
select * from BankAccnt;

#rollback procedure

delimiter $$

create procedure transactions()		#practice process.
begin
	start transaction;
    update BankAccnt 
    set balance=balance -1000
    where id=4;
    
    if(select balance from BankAccnt where id=4)<0 then
    rollback;
    signal sqlstate '45000'
    set message_text='Insufficient balance.';
    end if;
    update BankAccnt set balance = balance + 1000
    where id=2;
    
    commit;
end $$

delimiter ;

select * from BankAccnt;

call transactions();

#Apply multiple transaction using single procedure and savepoint

delimiter $$
create procedure TransferMoney(		#this is the important process thant 1st process
in from_accnt int,
in to_accnt int,
in transfer_amount int)

begin
	start transaction;
    update BankAccnt set balance = balance - transfer_amount
    where id=from_accnt;
    
    if(select balance from BankAccnt where id=from_accnt)<0 then
    rollback;
    signal sqlstate '45000'
    set message_text='Insufficient balance.';
    end if;
    update BankAccnt
    set balance=balance +transfer_amount
    where id =to_accnt;
    
    commit;
    
    end $$
    
    delimiter ;

call TransferMoney(2,4,4000);

select * from BankAccnt;
-------------------------------------------------------------------------------
#savepoint








