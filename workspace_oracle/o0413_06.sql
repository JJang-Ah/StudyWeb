-- 2022/04/13


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

-- 과제 1
select e.dno, job, loc
from employee e, department d 
where e.dno = d.dno
and e.dno = 10;

-- 과제 2
select eno, ename, job, e.dno, dname, loc
from employee e, department d
where e.dno = d.dno
and job = 'ANALYST';

-- 과제 3
select s.ename, o.dno, o.job, o.ename
from employee s, employee o
where s.dno = o.dno
and s.ename = 'SCOTT'
and o.ename <> 'SCOTT';

-- 과제 4
select o.ename, o.hiredate
from employee w, employee o
where w.ename = 'WARD'
and o.hiredate > w.hiredate
order by hiredate desc;

-- 과제 5
select e.ename, e.hiredate, m.ename, m.hiredate
from employee e, employee m
where e.manager = m.eno
and e.hiredate < m.hiredate;

-- 과제 6
select eno, ename, job, salary
from employee
where salary > (select salary from employee where eno = 7499);

-- 과제 7
select ename, hiredate, dno 
from employee
where dno = (select dno from employee where ename = 'BLAKE');

-- 과제 8
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee);


/*
서브 쿼리의 종류
1. 단일형 서브쿼리 - 서브쿼리의 결과가 단 1개일 떄
- 서브쿼리의 결과가 1개의 행일 때
- =, <>, >, >=, <, <=

2. 다중행 서브쿼리 - 서브쿼리의 결과가 1개 이상일 때
- 서브쿼리의 결과가 2개 이상일 때
- in, any(some), all

- in(any) : 서브쿼리의 결과가 메인쿼리와 한 개라도 일치한다면 출력
- any : 서브쿼리의 여러 결과 중에서 메인쿼리와 한가지 조건만 만족해도 출력
- < any : 서브쿼리의 최대값보다 작은 값은 출력 
- > any : 서브쿼리의 최소값보다 큰 값을 출력
- all : 서브쿼리의 여러 결과를 메인쿼리와 모두 만족해야 출력
- < all : 서브쿼리의 최소값보다 작은 값을 출력
- > all : 서브쿼리의 최댓값보다 큰 값을 출력
*/

-- 문제5) 부서별 최소급여를 받는 사원의 사번과 사원명, 부서번호, 최소급여를 구하시오.
-- 해결시간: 3분
-- single-row subquery returns more than one row
-- 다중행 서브쿼리를 단일행 서브쿼리로 풀어서 발생하는 에러
select eno, ename, dno, salary from employee
where salary in (select min(salary) from employee group by dno);

-- 문제6) 직급이 'SALESMAN'이 아니면서 , 'SALESMAN'보다 작은 급여를 받는 사원의
-- 사번, 사원명, 직급, 급여를 출력하시오.
-- 서브쿼리: 'SALESMAN'의 급여 -> 4개 -> 다중행 서브쿼리
select eno, ename, job, salary
from employee
where job <> 'SALESMAN'
and salary < any (select salary from employee where job = 'SALESMAN');

-- 문제7) 모든 'SALESMAN' 급여보다 작은 급여를 받는 사원의 사번, 사원명, 직급, 급여를 출력
select eno, ename, job, salary
from employee
where salary < all (select salary from employee where job = 'SALESMAN')
and job <> 'SALESMAN';

-- < 다중행 서브쿼리 확인 학습 >
-- 확인문제1) 사원명에 'K'가 포함된 사원과 같은 부서에서 근무하는 사원의 사번, 사원명, 부서번호 출력
select eno, ename, dno
from employee
where dno in (select dno from employee where ename like '%K%');

-- 확인문제2) 업무가 'ANALYST'인 사원이 소속된 부서와 같은 부서에서 근무하는 사원의 부서번호, 사원명, 업무
select dno, ename, job
from employee
where dno in (select dno from employee where job = 'ANALYST');

-- 확인문제3) 평균급여보다 많은 급여를 받고, 사원명에 'M'이 포함된 사원과 같은 부서에서 근무하는 사원의 사번, 사원명, 급여 출력
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
and dno in (select dno from employee where ename like '%M%');

-- < 단일행 서브쿼리 확인 학습 >
-- 확인문제4) 평균급여가 가장 작은 업무를 출력
select job, round(avg(salary), 2) from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

-- 확인문제5) 부서위치가 'DALLAS'인 사원의 사원명, 부서번호, 업무를 출력
select ename, e.dno, job, loc
from employee e, department d
where e.dno = d.dno
and loc = 'DALLAS';

-- 확인문제6) 'RESEARCH' 부서에서 근무하는 사원의 부서번호, 사원명, 업무를 출력
select dno, ename, job
from employee
where dno = (select dno from department where dname = 'RESEARCH');

-----------------
-- < 테이블 생성/구조변경/제거 > : DDL(데이터 정의의)
/*
테이블명을 만드는 방법
1. 사용문자는 영어 대소문자, 숫자, 문자(_, $, #)만 사용가능, $와 #는 사용안하는걸 권장
2. 시작문자는 영어 대소문자로 시작하고, 30자 이내로 작성
3. 예약어와 중복되지 않도록 정의
4. 대소문자를 구분하지는 않음
*/
-- 1. 테이블 생성
create table dept (
dno number(2),
dname varchar(2),
loc varchar2(13)
);
desc dept;
select * from dept;

-- 2. 테이블 복사 방법
-- 2-1. 테이블 복사 방법 1번 : 테이블의 모든 구조와 모든 데이터를 모두 복사, 
-- 무결성 제약조건은 복사되지 않음 (기본키와 외래키)
create table dept_second
as select * from department;

desc dept_second;
select * from department;

-- 2-2. 테이블 복사 방법 2 : 테이블의 특정 컬럼(필드)과 모든 데이터를 복사
create table emp02
as select eno, ename, job, salary from employee;
desc emp02;
select * from emp02;

-- 2-3. 테이블 복사 방법 3 : 테이블의 수식 컬럼은 알리아스를 사용하여 생성해야함
create table emp03
as select eno, ename, salary, salary*12 annual_salary from employee;
desc emp03;
select * from emp03;

-- 2-4. 테이블 복사 방법 4 :테이블에 조건에 따라 특정 데이터만 복사하여 생성
create table emp04
as select * from employee where job = 'SALESMAN';
desc emp04;
select * from emp04;

-- 2-5. 테이블 복사 방법 5 : 조건식에 맞는 데이터가 없으므로 테이블의 구조만 복사한다.
create table emp05
as select * from employee where 0 = 1;
desc emp05;
select * from emp05;

-- 3. 테이블의 구조를 변경하는 방법
-- 컬럼 추가, 컬럼 삭제, 컬럼명 변경, 컬럼의 타입 변경
-- alter table 테이블명~
-- 3-1. 컬럼 추가, emp02 테이블에 birthday (date타입)
-- add 예약어의 괄호 안에 컬럼명과 타입을 나열하면 됨, 여러 개도 가능
desc emp02;
alter table emp02 add(birthday date);
desc emp02;
alter table emp02 add(sex char(1), hobby varchar2(30));
desc emp02;

-- 3-2. 컬럼명 변경
-- emp02 테이블의 birthday를 b_day로 변경
-- rename 예약어를 사용
alter table emp02 rename column birthday to b_day;
desc emp02;

-- 3-3. 컬럼의 타입 변경 
-- ex) emp02 테이블의 sex의 타입을 varchar(6)으로 변경
alter table emp02 modify sex varchar(6);
desc emp02;

alter table emp02 modify (ename varchar2(20), job varchar2(18));
desc emp02;

-- 3-4. 컬럼의 제거
-- ex) emp02테이블의 hobby 컬럼을 제거
alter table emp02 drop column hobby;
desc emp02;

-- 4. 테이블의 제거
select * from tab;
drop table dept_second;
select * from tab;

-- 5. 테이블명 변경
-- ex) emp03테이블의 이름을 emp_copy로 변경
rename emp03 to emp_copy;
select * from tab;

-- 6. 테이블의 모든 데이터를 삭제 ( 테이블의 구조는 유지)
-- ex) emp02의 모든 데이터를 삭제
-- 6-1 truncate 명령 > DDL (데이터 정의어)
select * from emp02;
truncate table emp02;
desc emp02;
select * from emp02;

-- 6-2. delete 명령 - DML(데이터 조작어)
select * from emp04;
delete from emp04;
desc emp04;
select * from emp04;

/*
데이터 사전 (data dictionary) - 오라클에서만 존재하는 기능
- 사용자가 데이터베이스의 자원을 효율적으로 관리할 수 있도록 다양한 정보를
제공하는 시스템 테이블의 집합
- 사용자가 테이블을 생성하거나 사용자를 변경하는 등의 작업을 할 때 데이터베이스 서버에 의해서
자동으로 갱신되는 테이블
- 사용자는 데이터 사전의 내용을 수정하거나 삭제할 수 없고,
사용자는 데이터 사전의 내용을 확인만 가능
- 데이터 사전은 읽기 전용 뷰 형태로 제공됨.

데이터 사전의 종류 - 접두어에 따라
user_ : 자신의 계정이 소유한 객체의 정보를 확인
all_ : 자신의 계정 또는 권한을 부여받은 객체의 정보를 확인
dba_ : 데이터베이스 관리자가 접근 가능한 객체의 정보를 확인

user_tables : 자신의 계정이 소유한 테이블의 정보를 확인
user_sequences : 자신의 계정이 소유한 시퀀스의 정보를 확인
user_indexes : 자신의 계정이 소유한 인덱스의 정보를 확인
user_views : 자신의 계정이 소유한 뷰의 정보를 확인

all_tables : 전체 사용자(자신의 계정과 권한을 부여받은 객체)가 사용한 테이블의 정보 확인
dba_tables : 곤리자가 접근가능한 테이블의 정보를 확인

*/

select * from user_tables;
select table_name from user_tables;
select * from tab;

select * from all_tables;
select * from dba_tables;

/*
테이블에 데이터 추가/ 데이터 수정/ 데이터 삭제 -> DML(데이터 조작어)
DML - insert, update, delete, select 
CRUD - create(insert), read(select), update, delete
*/

-- 1. 데이터 추가, insert into 테이블명 ~

-- 
select * from tab;
-- 1-1. 데이터 추가 1번
-- 테이블 생성
create table dept01 (
dno number(2),
dname varchar(14),
loc varchar2(13)
);
desc dept01;
select * from dept01;
-- 데이터 추가 / insert into~ 테이블명(컬럼명..) value(값..) ;
insert into dept01(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- 1-2. 데이터 추가 4번 : 컬럼명을 생략하면, 모든 컬럼에 대한 값을 만든 순서대로 적어줌
insert into dept01 values(40, 'OPERATIONS', 'BOSTON');
select * from dept01;
commit;

-- 1-3. 데이터 추가 3번 : 컬럼명을 명시하면, 값의 순서는 컬럼명의 순서를 따르면 된다.
insert into dept01(loc, dno, dname) values('CHICAGO', 30, 'SALES');
select * from dept01;
commit;

-- 1-4. 데이터 추가 2번 : null인 컬럼을 생략하고 값을 추가
-- (not null인 컬럼은 반드시 사용해야함)
insert into dept01(dno) values(20);
select * from dept01;
commit; -- 확정

-- 1-5. 데이터 추가 5번 : 명시적으로 null을 삽입
insert into dept01(dno, dname, loc) values (50, null, null);
select * from dept01;
commit;

-- 1-6. 데이터 추가 6번 : 명시적으로 빈문자열을 삽입 빈문자열은 nul로 인식 
insert into dept01(dno, dname, loc) values(60, '', '');
select * from dept01;
commit;

-- 1-7. 데이터 추가 7번 :
truncate table dept01;
select * from dept01;

-- 테이블의 내용을 복사하여 추가.
insert into dept01 select * from department;
--insert into dept01(dno, dname, loc) select dno, dname, loc from department;
select * from dept01;


/*
< 확인 학습 >
문제1) employee 테이블에서 데이터는 복사하지 않고, 구조만 복사하여 emp01
테이블을 생성하시오.
문제2) emp01 테이블에 데이터를 5개를 추가하여 확인하ㅣ오. (employee 테이블 참고)
*/

create table emp01 
as select * from employee where 0=1;

desc emp01;
select * from emp01;

insert into emp01 values(7369, 'SMITH', 'CLERK', 7902, 
to_date('1980.12.17', 'yyyy.MM.DD'), 800, null, 20);
select * from emp01;
commit;

truncate table emp01;
insert into emp01 select * from employee;
commit;
-- 2. 데이터 수정 : update 테이블명 set 수정할 필드와 값 where 조건
-- 2-1. dept01 테이블에서 10번 부서의 부서명을 'PROGRAMMING'으로 변경하시오
update dept01
set dname = 'PROGRAMMING'
where dno=10;

select * from dept01;
commit;

-- 2-2. dept01 테이블에서 20번 부서의 부서명을 'MARCKETING', 
-- 지역명을 'TEXAS'로 수정하시오
update dept01
set dname='MARCKETING', loc='TEXAS'
where dno=20;














