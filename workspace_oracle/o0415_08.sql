
-- 2022/04/15(금) 8일차 수업

/*
★★★
뷰(View)
- 가상 테이블
- 하나 이상의 테이블이나 다른 뷰를 이용하여 생성되는 가상 테이블
- 실질적으로 데이터를 저장하지 않고, 뷰를 정의할 떄 기술한 쿼리문만 저장됨.
- 뷰를 통해서 데이터를 추가/수정/삭제를 하면 뷰가 사용하는 기본 테이블에 반영되고,
- 기본 테이블에서 데이터를 추가/수정/삭제를 하면 뷰에도 반영됨

< 뷰의 종류 >
1. 단순 뷰(simple view): 하나의 기본 테이블로부터 생성된 뷰
- DML 병령을 사용할 수 있음.
- 단순 뷰의 DML 명령은 기본 테이블 반영됨

2. 복합 뷰(complex view): 두개 이상의 기본 테이블로부터 생성된 뷰
- 무결성 제약조건, group by 절, 표현식 등의 유무에 따라 DML 명령이 제한적으로 사용됨
- 복합 뷰는 distinct, group by, 그룹함수, rownum을 사용할 수 없음.
*/

-- employee, department 테이블을 복사하여 emp01, dept01를 생성
create table emp01 as select * from employee;
create table dept01 as select * from department;

desc emp01;
select * from emp01;
desc dept01;
select * from dept01;

-- 1. 뷰의 생성
-- 형식 : create view 

-- 1-1. 단순 뷰 : 컬럼명을 변경
create view v_emp01 (사번, 사원명, 부서번호, 업무)
as select eno, ename, dno, job from emp01 where job = 'SALESMAN';
select * from v_emp01;

-- 1-2. 단순 뷰 : 컬럼명을 그대로 사용
create view v_emp02
as select eno, ename, dno, job from emp01 where job = 'SALESMAN';

select * from v_emp02;

-- 1-3 단순 뷰
create view v_emp03
as select * from emp01;

select * from v_emp03;

-- 1-4. 복합 뷰 : 2개 이상의 테이블로붙 생성한 뷰, 조인 또는 서브쿼리 사용
-- 문제1) emp01 테이블과 dept01 테이블을 조인한 뷰
create view v_emp04
as select * from emp01 natural join dept01;

select * from v_emp04;

-- 문제) emp01, dept01 테이블로부터 사번, 사원명, 업무, 부서번호, 부서명, 지역명을
-- 보여주는 뷰를 생성 하시오.
create view v_emp05(사번, 사원명, 업무, 부서번호, 부서명, 지역명)
as select eno, ename, job, e.dno, dname, loc from emp01 e join dept01 d 
on e.dno = d.dno;

select * from v_emp05;

-- 문제3) emp01, dept01 테이블로부터 사번, 사원명, 업무, 연봉, 부서번호, 부서명을
-- 입사일이 1981년인 사원의 정보를 보여주는 뷰를 생성하시오. (조인은 equi join를 사용)
create view v_emp06(사번, 사원명, 업무, 연봉, 부서번호, 부서명, 입사일)
as select eno, ename, job, salary, e.dno, dname, hiredate
from emp01 e, dept01 d
where e.dno = d.dno
and substr(hiredate, 1, 2) = 81;
drop view v_emp06;

select * from v_emp06;

-- 데이터 사전을 통해 뷰의 정로를 확인
select * from user_views;

/*
< 뷰를 사용하는 장점 >
1. 보안 - 뷰를 사용하여 중요한 데이터의 접근을 막을 수 있음
2. 사용의 편의성 - 사용자에게 필요한 데이터만 접근하게 하여 편의성을 높일 수 있음

< 뷰를 사용할 때 발현되는 몇가지 문제 >
*/

-- 2-1. v_emp02 뷰에 데이터를 추가
--> 문제점: SALESMAN을 조회하는 뷰인데, CLERK이 기본 테이블 입력되고 있는 점
insert into v_emp02(eno, ename, dno, job) values(9000, 'KIM', 10, 'CLERK');
select * from v_emp02;
select * from emp01;

-- 2-2. 부서별 연봉합계, 연봉평균을 보여주는 뷰를 생성하시오.
create view v_emp_dno
as
select dno, sum(salary), avg(salary)
from emp01
group by dno;
-- > 에러: ORA-00998: must name this expression with a column alias
--> 해결책: 뷰를 생성할 때 그룹함수를 컬럼에 사용할 때는 알리아스를 사용함.

create view v_emp_dno
as
select dno, sum(salary) "sum", round(avg(salary), 2) "avg"
from emp01
group by dno;

select * from v_emp_dno;

-- v_emp_dno 뷰에 데이터를 삽입 - 불가능
insert into v_emp_dno values(10, 1000, 1500);
-- 에러:ORA-01733: virtual column not allowed here
-- 그룹함수를 사용한 뷰에는 값을 삽입할 수 없음.

-- 3. 뷰의 제거
-- 형식: drop view 뷰 이름;
select * from user_views;
drop view v_emp_dno;

-- 4. 뷰를 생성
-- create view 뷰이름: 뷰이름에 해당하는 뷰가 없을 때는 새로 생성, 있다면 에러
-- create or replace view 뷰이름: 뷰이름에 해당하는 뷰가 없을 때는 새로 생성
-- , 있다면 삭제하고 새로 생성
desc v_emp_dno;

create or replace view v_emp_dno
as
select eno, ename, job, dno from emp01;

desc v_emp_dno;

-- 4-2. 강제로 뷰를 생성: 뷰를 생성할 수 없는 상황임에도 강제로 뷰를 생성
-- 
create or replace force view v_notable
as
select * from member;
-- 오류: ORA-00942: table or view does not exist
-- 경고: 컴파일 오류와 함께 뷰가 생성되었습니다.

select * from user_views; -- 확인
desc v_notable; -- 확인 불가
select * from v_notable; -- 확인 불가

-- 5-1. with check option 사용
-- 뷰에서 보여지는 범위 내에서만 insert와 update가 가능하도록 하는 
-- emp01 테이블로부터 eno, ename, dno, job을 보여주는 뷰를 생성하시오.
create or replace view v_emp01
as select eno, ename, dno, job from emp01
where job = 'MANAGER';

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- 뷰를 통해 데이터 삽입
-- MANAGER를 검색하는 뷰이니 MANAGER를 삽입하는 것은 합당
insert into v_emp01 values (9001, 'KIM', 10, 'MANAGER');
commit;
select * from v_emp01; -- 뷰에서 확인
select * from emp01; -- 기본 테이블에서 확인

-- 뷰를 통해 데이터 삽입
-- MANAGER를 검색하는 뷰인데 SALESMAN을 삽입하는 것은 합당하지 않음
insert into v_emp01 values(9002, 'LEE', 20, 'SALESMAN');
commit;
select * from v_emp01; -- 뷰에서 확인: 보이지 않음
select * from emp01; -- 기본 테이블에서 확인: 확인 가능

-- 위의 문제를 해결: MANAGER를 검색하는 뷰라면 이뷰를 통해서는 MANAGER 데이터만
-- 추가/수정이 가능하도록 함, 삭제는 안됨
create or replace view v_emp01
as select eno, ename, dno, job from emp01 where job = 'MANAGER'
with check option;

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- 확인: 'MANAGER' 데이터를 삽입
insert into v_emp01 values(9003, 'CHOI', 30, 'MANAGER');
commit;
select * from v_emp01;
select * from emp01;

-- 확인: 'SALESMAN' 데이터를 삽입
insert into v_emp01 values(9004, 'PARK', 10, 'SALESMAN');
-- 오류: ORA-01402: view WITH CHECK OPTION where-clause violation

-- 데이터 수정 확인 : 'MANAGER' 데이터의 부서번호 40번으로 수정 --> 성공
update v_emp01
set dno = 40
where job = 'MANAGER';
commit;

select * from emp01;
select * from v_emp01;

-- 데이터 수정 확인 : 'SALESMAN' 데이터인9001번의 업무를 'CLERK'로 수정 > 수정되지 않음
-- 'MANAGER'인 데이터의 업무는 수정 불가
update v_emp01
set job = 'CLERK'
where eno = 9001;
-- > 0개 행 이(가) 업데이트 되었습니다.

select * from emp01;
select * from v_emp01;

-- 데이터 삭제 확인: 'MANAGER' 데이터인 9001번 데이터 삭제
delete from v_emp01 where eno = 9001;
commit;

select * from emp01;
select * from v_emp01;

-- 데이터 삭제 확인 : 'SALESMAN' 데이터인 9002번 데이터 삭제

------------
-- 5-2. with read only
-- 뷰를 통해서는 select만 가능하고, insert/update/delete는 사용이 불가
create or replace view v_emp01
as select eno, ename, job, dno from emp01
where job = 'MANAGER'
with read only;

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- 데이터 삽입
insert into v_emp01 values(1001, 'AAA', 10, 'MANAGER');
-- 오류: ORA-42399: cannot perform a DML operation on a read-only view

-- 데이터 수정
update v_emp01
set ename = 'BBB'
where eno = 9001;
-- SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view

----------------------
/*
< 시퀀스 (Sequence) >
-- 테이블 내에서 자동으로 생성되고, 연속되는 유일한 숫자(정수)
-- 테이블에서 일련번호, 제품번호 등 유일하고 자동으로 생성되는 번호에 사용

< 시퀀스 생성 형식 >
create sequence 시퀀스명
start with 숫자 -- 시작하는 숫자
increment by 숫자 -- 증가치 
minvalue 숫자 -- 시퀀스의 최솟값, 기본값은 1
maxvalue 숫자 -- 최댓값, 기본값은 10의 27승
cycle or nocycle -- 최대값까지 값이 증가했을 때 cycle이면 최솟값부터 다시
-- 시작, nocycle이면 에러 발생
cache or nocache -- 시퀀스를 관리하는 캐시값을 설정, 기본값은 20

< nextval, currval >
- nextval: 시퀀스의 다음 값을 설정
- currval: 시쿼스의 현재 값을 확인

< nextval, currval을 사용할 수 있는 경우 >
- 서브쿼리가 아닌 select 문
- insert문의 select 문
- insert문의 values절 --> 가장 많이 사용 (nextval)
- update문의 set절

< nextval, currval을 사용할 수 없는 경우 >
- view의 select절 
- distinct 있는 select문
- group by, having, order by절이 있는 select문

*/

select * from user_views;
select * from user_tables;

-- < 1. 시퀀스 생성 >
-- 1부터 1씩 증가하는 시퀀스 생성
create sequence test01_seq start with 1 increment by 1; 

-- 시퀀스 확인
select * from user_sequences;

select test01_seq.nextval from dual; -- 다음 시퀀스 값 확인
select test01_seq.currval from dual; -- 현재 시퀀스 값 확인

-- 데이터 없이 emp01, dept01 테이블 생성
create table emp01 as select * from employee where 1=0;
create table dept01 as select * from department where 1=0;

desc emp01;
select * from emp01;
desc dept01;
select * from dept01;

-- epm01 테이블에서 사용할 시퀀스 생성
-- 사번은 1001번부터 1씩 증가하는 시퀀스를 생성하여, 사원 테이블에 적용
create sequence emp01_seq start with 1001 increment by 1;

-- emp01 테이블 데이터를 추가할 때 시퀀스를 사용
insert into emp01(eno, ename) values(emp01_seq.nextval, 'person1');
commit;
select * from emp01;

-- dept01 테이블에서 사용할 시퀀스 생성
-- 부서번호는 10번부터 10씩 증가하는 시퀀스를 생성하여, 부서 테이블에 적용
create sequence dept01_seq start with 10 increment by 10;

-- dept01 테이블에 데이터를 추가할 때 시퀀스를 사용
insert into dept01(dno, dname, loc) values(dept01_seq.nextval, 'P3', 'L3');
commit;
select * from dept01;

select * from user_sequences;

-- < 2. 시퀀스 변경 >
-- start with는 변경 불가: 유일한 번호 생성에 위배되기 때문
alter sequence emp01_seq increment by 10;
select * from user_sequences;

insert into emp01(eno, ename) values(emp01_seq.nextval, 'TOM');
commit;
select * from emp01;

alter sequence dept01_seq maxvalue 100;
select * from user_sequences;

insert into dept01(dno, dname, loc) values(dept01_seq.nextval, 'P9', 'L9');
commit;
select * from dept01;

select dept01_seq.currval from dual;

-- < 3. 시퀀스 제거 >
drop sequence emp01_seq;
select * from user_sequences;

------------
/*
< 인덱스 (index) >
- 검색 속도의 향상을 위해서 사용하는 가능
- 직접 인덱스를 생성할 수도 있고, 데이터 무결성의 확인을 위해 수시로 사용하는 기본키는 인덱스가
자동으로 생성 
*/

create table emp01 as select * from employee;
create table dept01 as select * from department;

select * from user_constraints where table_name in ('EMP01', 'DEPT01');

-- 제약조건 추가
alter table dept01 modify dno constraint dept01_dno_pk primary key;
alter table emp01 modify eno constraint emp01_eno_pk primary key;
alter table emp01 modify dno constraint emp01_dno_fk references dept01;

-- 제약조건 확인: PK에 인덱스가 생성
select * from user_constraints where table_name in ('EMP01', 'DEPT01');

-- 인덱스 확인 : user_ind_columns
select * from user_ind_columns where table_name in ('EMP01', 'DEPT01');











