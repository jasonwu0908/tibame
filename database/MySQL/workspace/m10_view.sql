create view empvu100
as select empno, ename, salary
from employee
where deptno = 100;

select * from empvu100;

create view salvu100
as select empno 'id', ename 'name', salary * 12 'annual_salary'
from employee
where deptno = 100;

select * from salvu100;


create view salvu100_1 (id, name, annual_salary)
as select empno, ename, salary * 12
from employee
where deptno = 100;

select * from salvu100_1;


create view dept_sum_vw ( name, minsal, maxsal, avgsal)
as select d.dname, min(salary),max(salary),avg(salary)
from employee e join department d
on e.deptno = d.deptno
group by d.dname;


select * from dept_sum_vw;


update empvu100
set ename = '孫悟淨' 
where empno = 1009;

select * from salvu100;
select * from employee;

update empvu100
set ename = '孫大為' 
where empno = 1003;



update empvu100
set title = 'SA' 
where empno = 1009;


DELETE FROM empvu100 
where empno = 1009;


create view emp_sal_vw
as select 	empno, ename, salary
from		employee
where 		salary <= 40000
with check option;

update emp_sal_vw
set salary = 40001
where empno = 1002;
-- Error Code: 1369. CHECK OPTION failed 'db01.emp_sal_vw'




