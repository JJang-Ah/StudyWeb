-- ����1) --
select eno, ename, salary, e.dno, dname
from employee e, department d
where e.dno = d.dno and salary > 2000
order by e.dno;

-- ����2) --
select ename, job, hiredate, dname, loc
from employee join department
using (dno)
where substr(hiredate, 4, 2) = '12'
order by ename;

-- ����3) --
select e.ename, e.hiredate
from employee e, employee m
where m.ename = 'MARTIN' and m.hiredate > e.hiredate
order by e.hiredate desc;

-- ����4) --
select e.ename �����, e.eno ���, m.ename �����ڸ�, m.eno �����ڹ�ȣ
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno;

-- ����5) --
select * from employee
where salary < (select salary from employee where ename='ALLEN');

-- ����6) --
select ename, job from employee
where dno in (select dno from employee where job='ANALYST');

-- ����7) --
select eno, ename, salary from employee
where salary > (select avg(salary) from employee)
and dno in (select dno from employee where ename like '%A%')
order by eno;

-- ����8) --
create table emp01
as select eno, ename, job, salary from employee where 0=1;
desc emp01;
select table_name from user_tables
where table_name = 'EMP01';

-- ����9) --
alter table emp01 modify (ename varchar2(12), job varchar(10));
desc emp01;

-- ����10) --
drop table emp01;
select * from user_tables where table_name='EMP01';



