select * FROM employee;
select ename,salary,title FROM employee;
select 10 / (3 + 2) AS 'JASON', 10 div 3, 10 % 3 , 10 * null; 
select ename AS '員工姓名' , salary * 12 AS 年薪 from employee;

select ename AS '員工 姓名' , salary * 12 AS 年薪 from employee;

SELECT SUBSTRING(ename, 1, 1) '姓氏' FROM employee;
SELECT SUBSTRING(ename, 2) '姓名' FROM employee;
SELECT SUBSTRING('David Wang', 1, 5) 'boss';
SELECT SUBSTRING('David Wang', 7) 'boss';
SELECT SUBSTRING('David Wang', -4) 'boss';

select concat(ename, ' is a ', title) '員 工' from employee;
select length('我是一個student') 'length';
select char_length('我是一個student') 'length';
select sysdate() + interval 5 day;
desc employee;
select * from employee;


select hiredate , hiredate + interval 3 day 'test period' from employee;


select sysdate(), sleep(2), sysdate();
select now(), sleep(2), now();

select adddate(sysdate() ,interval 5 minute);
select subdate(sysdate() ,interval 5 month);

select now() 'now time', year(now()) 'year', month(now()) 'month' ,day(now()) 'day';


select empno, ename, hiredate, 
		datediff(now(), hiredate) div 365 'year', 
        datediff(now(), hiredate) / 365 'year',
        round(datediff(now(), hiredate) / 365 ) 'year',
        round(datediff(now(), hiredate) / 365, 1 ) 'year'
        from employee;


select empno, ename, hiredate, 
		datediff(now(), hiredate) div 365 'year', 
        datediff(now(), hiredate) / 365 'year',
        round(datediff(now(), hiredate) / 365 ) 'year',
        round(datediff(now(), hiredate) / 365, 1 ) 'year',
		round(datediff(now(), hiredate) / 365 * 12  ) 'month',
        round(datediff(now(), hiredate) % 365 div 30 ) 'month'
        from employee;
        
        
        
select empno, ename, salary,
	salary * if(salary >= 50000, 2, 1.5) 'bounus'
from employee;


select empno, ename, salary,
	case
		when salary > 100000 then 'A'
		when salary between 70000 and 1000000 then 'B'
		when salary between 50000 and 69999 then 'C'
		when salary between 30000 and 49999 then 'D'
        else 'E'
	END 'Grade'
from employee;


select distinct deptno, title from employee;
select * from employee where deptno = 100;
select * from employee where title = 'engineer';
select * from employee where hiredate = '2007/07/06';


select * from employee where salary >= 50000;
select * from employee where salary between 50000 and 70000;
select * from employee where title in('manager','engineer');
select * from department where mgrno is null;
select * from employee where ename like '林%';
select * from employee where ename like '%生';
select * from employee where ename like '%林%';


select * from employee where title like '%SA\_%';
select * from employee where title like '%SA$_%' escape '$';


select * from employee where salary >= 30000 AND salary <= 40000;
select * from employee where ename like '林%' or salary >= 45000;
select * from employee where title like 'manager' or title like 'engineer';


select * from employee where title not in('manager','engineer');
select * from employee where salary not between 50000 and 70000;
select * from department where mgrno is not null;
select * from employee where ename not like '林%';
select * from employee where month(hiredate) >= 5 and month(hiredate) <= 10;
select * from employee where hiredate != '2010-11-10' and ename not like '林%';

select ename, deptno, salary from employee order by 2, 3 desc;
select ename, deptno, salary from employee order by 2 desc, 3 desc;
select ename, salary * 12'annual' from employee order by 2;

select * from employee order by 3 limit 3;

select sum(salary) 'sum', avg(salary) 'avg', max(salary) 'max', min(salary) 'min' from employee;

select count(deptno) from employee;
select count(distinct deptno) from employee;
select count(deptno) from department;
select count(mgrno) from department;


select sum(salary) 'sum', avg(salary) 'avg', max(salary) 'max', min(salary) 'min' from employee;
select deptno, sum(salary) 'sum', avg(salary) 'avg', max(salary) 'max', min(salary) 'min' from employee
	group by deptno;
select deptno, sum(salary) 'sum', avg(salary) 'avg', max(salary) 'max', min(salary) 'min' from employee
	group by deptno
	order by salary desc;

select deptno, title, sum(salary) 'total' from employee
	group by deptno, title with rollup;

select deptno, title, sum(salary) 'total' from employee
	group by deptno, title with rollup
    having sum(salary) > 70000;
    
select title, sum(salary) 'total' from employee
	where title not like '%SA%'
    group by title
    having sum(salary) > 100000
    order by sum(salary) desc;


