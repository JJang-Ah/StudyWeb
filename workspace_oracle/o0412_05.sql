-- 2022/04/12(화) - 5일차 수업

-- 주석 표시 
select table_name from user_tables;
desc employee;
select * from employee;

/*
2. 넌이퀴 조인 (non-equi join)
- 조인 조건이 = (equal)이 아닌 연산자를 사용하는 조인
- 조인 조건이 특정 범위 내에 있는지를 조사하기 위해 사용
*/

--문제21) 사원의 연봉에 해당하는 연봉등급을 출력하시오.
-- 사번, 사원명, 업무, 연봉, 연봉등급의 5개 필드 -> employee, salgrade
select eno, ename, job, salary, grade
from employee, salgrade
where salary between losal and hisal;
-- join on
select eno, ename, salary, grade
from employee join salgrade
on salary between losal and hisal;

--문제22) 사원명, 부서명, 연봉, 연봉등급
-- employee, department, salgrade 테이블 사용
select ename, dname, salary, grade
from employee, department, salgrade
where employee.dno = department.dno
and salary between losal and hisal;

-- join on
select ename, dname, salary, grade
from employee e
join department d
on e.dno = d.dno
join salgrade s
on salary between losal and hisal;

/*
3. self join
- 하나의 테이블에 있는 필드(column 2개 이상)끼리 조인하는 것
- 하나의 테이블을 두개 이상의 테이블로 활용하여 조인하는 방법
*/

-- 문제23) 사번, 사원명, 사원의 직속상관번호, 사원의 직속상관이름을 출력하시오.
select eno, ename, manager from employee;
-- self join 
select e.eno 사번, e.ename 성명, m.eno 관리자번호, m.ename 관리자 이름
from employee e, employee m
where e.manager = m.eno; --조인조건

-- join on
select e.eno 사번, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e join employee m
on e.manager = m.eno;

select e.ename ||'의 관리자는 ' || m.ename || '입니다.'
from employee e join employee m
on e.manager = m.eno;

/*
4. outer join
- 기본적인 join의 결과는 두 테이블 중에서 어느 한개의 필드값이
null이면 결과를 출력하지 않는다.
- outer join은 어느 한개의 필드값이 null이라도 결과를 출력하도록함
*/
-- oracle에서 사용 가능한 방식, null값이 존재하는 쪽에 (+)를 사용
select e.eno 사번, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e, employee m
where e.manager = m.eno(+);

-- 표준 방식, 기준이 되는 쪽의 예약어를 사용한다. (left, right)
select e.eno 사번, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e left outer join employee m
on e.manager = m.eno;

/*
서브 쿼리(Sub Query)
- 여러개의 쿼리문을 통해서 확인해야 하는 것을 하나의 쿼리문으로 결과를
확인하도록 하는 방법
- 메인 쿼리 안에 서브 쿼리가 존재하는 형태를 가지는 쿼리문
- 서브 쿼리문은 where절을 사용
*/

-- Q1) 'SCOTT'사원보다 급여를 많이 받는 사원을 검색하시오.
-- 1단계 : 'SCOTT'사원의 연봉을 알아내야함
select ename, salary from employee where ename = 'SCOTT';
-- 2단계 : 알아낸 연봉보다 높은 연봉을 받는 사원과 연봉을 알아냄
select ename, salary 
from employee
where salary > 2000;

-- 위의 문제를 하나의 서브쿼리문으로 해결하고자함.
-- 아래 문제는 조인 문제로 해결할수도 있음, 서브쿼리가 훨씬 보기 편하다.
select ename, salary
from employee
where salary > (select salary from employee where ename = 'SCOTT');

-- 문제2) 'MARTIN'과 같은 부서에서 일하는 모든 사원의 사번, 사원명, 부서번호를 검색
select eno, ename, dno 
from employee
where dno = (select dno from employee where ename ='MARTIN');

/*
문제10) 사원 테이블에서 최고 연봉을 받는 사원의 사원명과 연봉을 구하시오.
-> 문제점) not a single-group group function
-> 해결책) 서브쿼리로 해결
*/
select ename, salary 
from employee
where salary = (select max(salary) from employee);

-- 문제4) 부서별 최소급여가 30번부서의 최소급여보다 큰 부서의 최소급여를 구하시오
select dno, min(salary)
from employee join department
using(dno)
group by dno
having min(salary) >
(select min(salary) from employee 
group by dno having dno=30);

/*
서브 쿼리의 종류
1. 단일형 서브쿼리
- 서브쿼리의 결과가 1개의 행일 때
- =, <>, >, >=, <, <=

2. 다중행 서브쿼리
- 서브쿼리의 결과가 2개 이상일 때
- in, any(some), all

*/
-- 문제5) 부서별 최소급여를 받는 사원의 사번과 사원명, 부서번호, 최소급여를 구하시오.
-- 해결시간: 3분
-- single-row subquery returns more than one row
-- 다중행 서브쿼리를 단일행 서브쿼리로 풀어서 발생하는 에러
select eno, ename, dno, salary from employee
where salary in (select min(salary) from employee group by dno);

-- 문제6) 직급이 'SALESMAN'이 아니면서 , 'SALESMAN'보다 작은 급여를 받는 사원의
-- 사번, 사원명, 직급, 급여를 출력하시오.
select eno, ename, job, salary
from employee
where job <> 'SALESMAN'
and salary < any (select salary from employee where job = 'SALESMAN');

/*
과제1) 10번 부서에 속하는 사원의 부서번호, 업무, 지역명을 출력하시오.

과제2) 업무가 'ANALYST'인 사원의 사번, 사원명, 업무, 부서번호, 부서명, 지역명을 출력

과제3) 'SCOTT'과 동일한 부서에서 근무하는 사원의 사원명, 부서번호, 부서명, 'SCOTT'를 제외하고 출력

과제4) 'WARD'사원보다 늦게 입사한 사원의 사원명, 입사일을 출력하시오.

과제5) 관리자보다 먼저 입사한 사원의 사원명, 사원의 입사일, 관리자명, 관리자의 입사일을 출력

< 서브쿼리 문제 >
과제6) 사번이 7499인 사원보다 급여가 많은 사원의 사번, 사원명, 업무, 급여를 출력하시오.

과제7) 'BLAKE'와 동인한 부서에서 근무하는 사원의 사원명과 입사일, 부서번호를 출력

과제8) 급여가 평균급여보다 많은 사원의 사번, 사원명, 급여를 출력


*/




