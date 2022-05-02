
-- 1번 문제 -- 
select ename, salary, commission from employee
where commission is not null
order by salary + nvl(commission, 0) desc;

-- 2번 문제 --
select ename, salary, dno from employee
where (salary >= 2000 and salary <= 3000)
and (dno=20 or dno=30)
order by ename;

-- 3번 문제 --
select ename, job, salary from employee
where job in ('CLERK', 'SALESMAN')
order by salary desc;

-- 4번 문제 -- 
select eno, ename from employee
where ename not like '%A%'
and ename not like '%E%';

-- 5번 문제 --
select ename 사원명, salary 급여, salary*12+nvl(commission,0) 연봉 
from employee
order by 연봉 desc;

-- 6번 문제 --
select * from employee
where substr(hiredate, 4,2) = 09;

-- 7번 문제 --
select eno 사번, ename 사원명, job 직무, salary 급여, 
case job
when 'ANALYST' then salary + 200
when 'SALESMAN' then salary + 180
when 'MANAGER' then salary + 150
when 'CLERK' then salary + 100
else salary
end "인상된 급여" from employee
order by "인상된 급여" desc;

-- 8번 문제 --
select dno 부서별, count(eno) 사원수, sum(salary) 급여총액 
from employee
group by dno
having sum(salary) >= 10000;

-- 9번 문제 --
select job 직급별, min(salary) 최저급여 from employee
where manager is not null
group by job
having not min(salary) < 2000
order by 최저급여 desc;

-- 10번 문제 --
select dno 부서번호, count(eno) 사원수, round(avg(salary),2) 평균급여
from employee
group by dno
order by dno;
