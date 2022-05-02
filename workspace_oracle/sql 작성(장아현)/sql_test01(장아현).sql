
-- 1�� ���� -- 
select ename, salary, commission from employee
where commission is not null
order by salary + nvl(commission, 0) desc;

-- 2�� ���� --
select ename, salary, dno from employee
where (salary >= 2000 and salary <= 3000)
and (dno=20 or dno=30)
order by ename;

-- 3�� ���� --
select ename, job, salary from employee
where job in ('CLERK', 'SALESMAN')
order by salary desc;

-- 4�� ���� -- 
select eno, ename from employee
where ename not like '%A%'
and ename not like '%E%';

-- 5�� ���� --
select ename �����, salary �޿�, salary*12+nvl(commission,0) ���� 
from employee
order by ���� desc;

-- 6�� ���� --
select * from employee
where substr(hiredate, 4,2) = 09;

-- 7�� ���� --
select eno ���, ename �����, job ����, salary �޿�, 
case job
when 'ANALYST' then salary + 200
when 'SALESMAN' then salary + 180
when 'MANAGER' then salary + 150
when 'CLERK' then salary + 100
else salary
end "�λ�� �޿�" from employee
order by "�λ�� �޿�" desc;

-- 8�� ���� --
select dno �μ���, count(eno) �����, sum(salary) �޿��Ѿ� 
from employee
group by dno
having sum(salary) >= 10000;

-- 9�� ���� --
select job ���޺�, min(salary) �����޿� from employee
where manager is not null
group by job
having not min(salary) < 2000
order by �����޿� desc;

-- 10�� ���� --
select dno �μ���ȣ, count(eno) �����, round(avg(salary),2) ��ձ޿�
from employee
group by dno
order by dno;
