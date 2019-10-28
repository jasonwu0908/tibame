BEGIN;

insert into department 
values(601, 'RD', 1001);
insert into department 
values(602, 'IT', NULL);

SELECT * FROM department;

ROLLBACK;

SELECT * FROM department;


BEGIN;

insert into department 
values(601, 'RD', 1001);
insert into department 
values(602, 'IT', NULL);

SELECT * FROM department;

COMMIT;

SELECT * FROM department;



SET AUTOCOMMIT = 0;

insert into department 
values(603, 'RD', 1001);
insert into department 
values(604, 'IT', NULL);

SELECT * FROM department;

ROLLBACK;

SELECT * FROM department;


insert into department 
values(605, 'RD', 1001);
insert into department 
values(606, 'IT', NULL);

SELECT * FROM department;

COMMIT;

SELECT * FROM department;

SET AUTOCOMMIT = 1;



BEGIN;

SELECT empno, ename, salary
from employee
where empno in (1001, 1002, 1003);

update employee
set salary = 60000
where empno = 1001;

savepoint a;

update employee
set salary = 40000
where empno = 1002;

savepoint b;

update employee
set salary = 80000
where empno = 1003;

rollback to a;

commit;

SELECT empno, ename, salary
from employee
where empno in (1001, 1002, 1003);







BEGIN;

SELECT salary
from employee
where empno = 1001;

update employee
set		salary = 60001
where empno = 1001;

commit;

SELECT salary
from employee
where empno = 1001;









