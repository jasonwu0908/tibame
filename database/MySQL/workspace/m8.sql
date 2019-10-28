create table emp1(
-- column level constraint
empno		decimal(4)		primary key,
ename		varchar(30)		not null,
hiredate	date			not null,
email		varchar(30)		unique,
deptno		decimal(3)		not null,
salary		int,
title		varchar(20)		not null default 'engineer',
-- table level constraint
constraint emp_deptno_fk foreign key (deptno)
	references department(deptno)
);

INSERT into dept 
values		(600, 'Public Relations', default);

update dept 
set			cityno = default
where		deptno = 500;


insert into emp1 
values		(1001, '孫悟空', '2013/11/10', 'gg@gmail.com', 100, 56000, 'senior engineer');

insert into emp1 
values		(1002, '孫悟空', '2013/11/10', 'gg1@gmail.com', 200, 56000, 'senior engineer');

insert into emp1 
values		(1003, '孫悟空', '2013/11/10', 'gg2@gmail.com', 600, 56000, 'senior engineer');
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))



ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;
  
  
update department 
set deptno = 201
where deptno = 200;


delete from department 
where deptno = 201;



create table mem(
	memno	int				primary key auto_increment,
    mname	varchar(30)		not null
)auto_increment = 100;

insert into mem (mname)
values ('david ho'),('maria wang'),('pam pan'),('tina lee'),('jason wu');

truncate table mem;

set sql_safe_updates = 0;
set sql_safe_updates = 1;

delete from mem;











