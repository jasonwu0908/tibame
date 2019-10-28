select ename, salary
from employee
where salary > (select salary from employee
				where ename = '潘麗珍');
                
                
select ename, title, salary
from employee
where title = (select title
				from employee
                where empno = 1002)
and	salary >  (select salary
				from employee
                where empno = 1005);
                
                
select deptno, min(salary) 'minimum salary'
from 	employee
group by deptno
having 	min(salary) > (select min(salary) 
from employee
where deptno = 200);
                
                
                
select ename, title, salary,
		round(salary*100/ 
				(select sum(salary)
                from employee
                where deptno = 100),1) 'percenttage'
from employee
where deptno = 100;




select ename, title, salary,
		round(salary*100/ t.total ,1) 'percenttage'
        
from employee,(select sum(salary) 'total'
                from employee
                where deptno = 100) t
where deptno = 100;


select ename, title, salary,
		round(salary * 100/ t.total ,1) 'percenttage'        
from employee,(select deptno d, sum(salary) 'total'
                from employee
                where deptno = 100) t
where deptno = t.d;



select round(1235123.2156, -5) 'yo';



-- Error Code: 1242. Subquery returns more than 1 row
select empno, ename
from employee
where salary = (select		min(salary)
				from		employee
                group by	deptno);
                
                
			
select ename, title, salary
from employee
where salary < any (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename, title, salary
from employee
where salary > any (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename, title, salary
from employee
where salary < all (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename, title, salary
from employee
where salary > all (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename, title, salary
from employee
where salary not in (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename, title, salary            
from employee
where salary in (select	salary
				from		employee
                where		title = 'senior engineer')
and title != 'senior engineer';


select ename
from	emp
where	empno in (select distinct mgrno
					from emp);
                    
                    
select ename
from	emp
where	empno not in (select distinct mgrno
					from emp
                    where mgrno != 'null');
                


select e.ename, e.title, e.salary,
		round(salary*100/ 
				(select sum(salary)
                from employee
                where deptno = e.deptno),1) 'percenttage'
from employee e
where e.deptno = 100;


select ename, salary, deptno
from 	employee e
where	salary in
			(select	min(salary)
				from employee
                group by deptno
                having	deptno = e.deptno);




select ename, salary, deptno
from 	employee e
where	salary in
			(select	min(salary)
				from employee
                where deptno = e.deptno);
                
                
                
create table emp100 as
	select	empno, ename, salary * 12 'annualsalary', hiredate
    from	employee
    where	deptnoemp100emp100 = 100;





