select ename, dname from emp, dept;
select ename, dname from emp cross join dept;

select emp.ename, dept.dname from emp, dept
where emp.deptno = dept.deptno;




select emp.deptno, emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

select emp.deptno, emp.ename, dept.dname   -- <--建議用這種寫法
from emp join dept
on emp.deptno = dept.deptno;

select emp.deptno, emp.ename, dept.dname
from emp join dept
using (deptno);

select emp.deptno, emp.ename, dept.dname
from emp natural join dept;


select emp.deptno, emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno
and title = 'engineer';

select emp.deptno, emp.ename, dept.dname   -- <--建議用這種寫法
from emp join dept
on emp.deptno = dept.deptno
where title = 'engineer';


select e.ename, d.dname 
from emp e, dept d
where e.deptno = d.deptno;

select e.ename, d.dname 
from emp e join dept d
on e.deptno = d.deptno;



select e.ename, d.dname, c.citycname
from emp e, dept d, city c
where e.deptno = d.deptno
and d.cityno = c.cityno;

select e.ename, d.dname, c.cname
from emp e join dept d
on e.deptno = d.deptno
join city c
on d.cityno = c.cityno;



select e.ename, e.salary, g.level
from emp e, grade g
where e.salary between g.lowest and g.highest;

select e.ename, e.salary, g.level
from emp e join grade g
on e.salary between g.lowest and g.highest;




select e.ename, d.dname, e.salary, g.level
from emp e, dept d, grade g
where e.deptno = d.deptno
and e.salary between g.lowest and g.highest;

select e.ename, d.dname, e.salary, g.level
from emp e join dept d
on e.deptno = d.deptno
join grade g
on e.salary between g.lowest and g.highest;


select e.ename, d.deptno, d.dname
from emp e right join dept d
on e.deptno = d.deptno;

select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno;





select e.ename, d.deptno, d.dname
from emp e right join dept d
on e.deptno = d.deptno
union
select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno;

select worker.ename 'worker name', 
	   manager.ename 'manager name'
	from emp worker, emp manager
    where worker.mgrno = manager.empno;
	
