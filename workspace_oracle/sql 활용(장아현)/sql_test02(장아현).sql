-- 문제1) --
select eno, ename, salary, e.dno, dname
from employee e, department d
where e.dno = d.dno and salary > 2000
order by e.dno;

-- 문제2) --
select ename, job, hiredate, dname, loc
from employee join department
using (dno)
where substr(hiredate, 4, 2) = '12'
order by ename;

-- 문제3) --
select e.ename, e.hiredate
from employee e, employee m
where m.ename = 'MARTIN' and m.hiredate > e.hiredate
order by e.hiredate desc;

-- 문제4) --
select e.ename 사원명, e.eno 사번, m.ename 관리자명, m.eno 관리자번호
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno;

-- 문제5) --
select * from employee
where salary < (select salary from employee where ename='ALLEN');

-- 문제6) --
select ename, job from employee
where dno in (select dno from employee where job='ANALYST');

-- 문제7) --
select eno, ename, salary from employee
where salary > (select avg(salary) from employee)
and dno in (select dno from employee where ename like '%A%')
order by eno;

-- 문제8) --
create table emp01
as select eno, ename, job, salary from employee where 0=1;
desc emp01;
select table_name from user_tables
where table_name = 'EMP01';

-- 문제9) --
alter table emp01 modify (ename varchar2(12), job varchar(10));
desc emp01;

-- 문제10) --
drop table emp01;
select * from user_tables where table_name='EMP01';



