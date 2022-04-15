-- 2022/04/14 (목) 7일차 수업

--
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

select * from dept01;
commit;

-- 2-3. where 생략하면 모든 데이터의 내용이 변경된다.
update dept01
set dname = 'TF';

select * from dept01;
commit;

-- 2-4. set절에서는 서브쿼리를 사용 가능
update dept01
set dname = (select dname from department where dno = 30)
where dno =30;

select * from dept01;
commit;

-- 2-5. set절에서 서브쿼리를 여러개를 사용가능
-- dept01 테이블의 20번 부서의 부서명과 지역명을 department 테이블의
-- 20번 부서의 부서명과 지역명으로 수정하시오.
update dept01
set dname = (select dname from department where dno = 20), 
loc = (select loc from department where dno = 20)
where dno = 30;
-- 이렇게도 작성가능
update dept01
set (dname, loc) = (select dname, loc from department where dno=20)
where dno = 30;

select * from dept01;
commit;

-- 3. 데이터 삭제
-- delete from 테이블명 where 조건

-- 3-1. dept01 테이블에서 부서번호 40인 데이터를 삭제하시오.
delete dept01
where dno = 40;

select * from dept01;
commit;

-- 3-2. where 절에서 서브쿼리를 사용
-- dept01 테이블에서 department 테이블의 'SALES'부서명에 해당하는 부서번호를 삭제하시오.
delete from dept01
where dno in (select dno from department where dname = 'SALES');

select * from department;
select * from dept01;
commit;

-- 3-3. where 절을 생략하면 모든 데이터를 삭제
delete from dept01;

select * from dept01;
commit;

--------------------

/*
트랜젝션(transaction)
- 데이터 처리(추가, 수정, 삭제)의 과정을 논리적으로 하나의 작업 단위로 처리하는 것
- ex) 계좌 이체의 예
- 두 계좌 사이에서 일정한 금액을 이체하려면, 출금 금액과 입금 금액이 동일해야함
- 이 두가지 작업은 반드시 함께 처리되거나, 취소되어야 함
- 만약에 출금은 되었으나, 입금이 되지 않았다면 데이터의 일관성을 유지하지 못하므로,
이런 일은 발생하면 안된다.
- 이러한 문제를 막기 위해서 트랜잭션 처리를 한다.
- ALL or Nothing
- 여러개의 작업이 하나의 논리적인 작업을 이루고 있을 때 모두다 실행되거나,
중간에 문제가 생겼을 때는 아예 전체를 취소하는 것을 말함

sql에서 트랜젝션을 처리하는 명령
- commit, rollback
*/

insert into dept01 select * from department;
commit; -- 확정

delete from dept01 where dno=40;
select * from dept01;
rollback;
select * from dept01;

-----------------
/*
-- ★★★★★
-- 제약조건 (constraint)
-- 데이터 무결성 제약조건 (Data Intergrity Constraint)
-- 테이블에 유효하지 않은(부적절한) 데이터가 입력되는 것을 방지하기 위해서 
-- 테이블을 생성할 때 각 컬럼에 정의하는 여러 가지의 규칙(제약조건)을 정하는 것
-- 데이터를 추가/수정/삭제할 때 정의된 제약조건이 적용됨

-- 제약조건의 종류
1. not null : 컬럼에 null을 포함하지 않도록 하는 제약조건
2. unique : 컬럼에 유일한 값을 갖도록 하는 제약조건, null은 유일한 값으로 인정
3. primary key : 기본키, 주키, PK, not null과 unique 제약조건을 모두 만족하는 제약조건
- 다른 행과 구분되는 유일한 키면서 not null인 데이터를 입력하도록 하는 제약조건
4. foreign key : 외래키, FK
5. check : 컬럼의 값이 특정한 범위한 값을 가지도록 하는 제약조건

#. default : 아무런 값을 입력하지 않았을 때 디폴트로 설정한 값이 입력

< foreign key와 참조 무결성 >
1.참조 무결성
- 자식 테이블이 부모 테이블 참조할 때,
- 자식 테이블의 컬럼에 값을 입력할 떄, 부모 테이블에 없는 컬럼의 값을 입력하지 못하도록 제약조건을 설정하는 것.

2. foreign key, 외래키, FK
- 참조 무결성을 성립시키기 위해 자식 테이블의 컬럼에 설정하는 제약조건
- foreign key가 참조하는 부모 테이블의 컬럼은 반드시 primary key로 설정 되어야한다.

ex)
- employee 테이블은 department 테이블을 참조하고 있음
- 참조를 하고 있는 employee 테이블: 자식 테이블, 참조를 당하는(해주는) department 테이블: 부모테이블
- employee 테이블의 dno 컬럼은 department 테이블의 dno를 참조하여 사용해야 함.
- employee 테이블에 데이터를 입력할 떄 dno 컬럼의 값은 department 테이블의 dno값을 참조해야 하고
- department 테이블에 없는 dno의 값을 입력하지 못하도록 제약조건을 설정하는 것
*/

-- <테이블 생성 (제약조건 포함)>
-- 1. 테이블 생성 1번 방법 : 컬럼 레벨로 테이블 생성
create table dept01 (
dno number(2) constraint dept01_dno_pk primary key,
dname varchar2(14),
loc varchar2(13)
);

desc dept01;
-- 제약조건 확인
select * from user_constraints;

-- 2. 테이블 생성 2번 방법 : 테이블 레벨로 테이블 생성
-- 테이블 레벨로는 not null 제약조건은 설정할 수 없음.
drop table dept01;
create table dept01 (
dno number(2),
dname varchar(14),
loc varchar2(13),
constraint dept01_dno_pk primary key(dno)
);

desc dept01;
select * from user_constraints;
select owner, table_name, constraint_name, constraint_type,
status from user_constraints;

select owner, table_name, constraint_name, constraint_type,
status from user_constraints
where table_name = 'DEPT01';
-- 오라클에서는 대문자로 들어간다.

-- 1. not null 제약조건
-- not null 제약조건은 컬럼 레벨로만 생성할 수 있음, 테이블 레벨로는 생성불가

create table dept02 (
dno number(2) not null,
dname varchar2(14) not null,
loc varchar2(13) not null
);

desc dept02;
select * from user_constraints where table_name = 'DEPT02';

-- 데이터 입력: not null 제약조건 확인
insert into dept02(dno, dname) values(10, 'ACCOUNTING');
-- > 에러 발생 : ORA-01400: cannot insert NULL into ("EZEN01"."DEPT02"."LOC")

insert into dept02(dno, dname) values(10, 'ACCOUNTING', null);
-- > 에러발생

insert into dept02(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
-- > 데이터 추가 성공

select * from dept02;
commit;

-- 2. unique 제약조건
create table dept03 (
dno number(2) unique,
dname varchar2(14) not null,
loc varchar2(13)not null
);

desc dept03;
select * from user_constraints where table_name = 'DEPT03';

-- 데이터 추가: unique 제약조건 확인
insert into dept03(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept03;
insert into dept03(dno, dname, loc) values(10, 'MARCKETING', 'LA');
-- > 에러발생 : ORA-00001: unique constraint (EZEN01.SYS_C007035) violated

insert into dept03(dno, dname, loc) values(20, 'MARCKETING', 'LA');
-- > 추가 성공

select * from dept03;
commit;

insert into dept03(dno, dname, loc) values(null, 'TF', 'SEATLE');
-- 추가 성공
select * from dept03;
commit;

insert into dept03(dno, dname, loc) values (null, 'IT', 'San Fracisco');
-- > 추가 성공 : 모든 null은 unique한 것으로 판단
select * from dept03;
commit;

-- 3. check 제약조건
-- salary 컬럼의 데이터를 입력할 때 반드시 3000~5000 사이의 연봉만 입력가능하도록 설정
create table emp01 (
eno number(4) primary key,
ename varchar2(10) not null,
job varchar2(9) not null,
salary number(7, 2) constraint emp01_salary_ck check(salary between 3000 and 5000)
);

desc emp01;
select * from user_constraints where table_name = 'EMP01';

-- 데이터 추가 : salary 컬럼의 check 제약조건 확인
insert into emp01(eno, ename, job, salary) values(1001, 'TOM', 'ACTOR', 5001);
-- > 에러발생 : ORA-02290: check constraint (EZEN01.EMP01_SALARY_CK) violated

insert into emp01(eno, ename, job, salary) values(1001, 'TOM', 'ACTOR', 5000);
-- 추가 성공
select * from emp01;
commit;

-- 4. defalut 값
create table emp02 (
eno number(4) primary key,
ename varchar2(10) not null,
job varchar2(9) not null,
salary number(7, 2) default 3000
);

desc emp02;
select * from user_constraints where table_name = 'EMP02'; -- default값 확인 불가
select * from user_tab_columns where table_name = 'EMP02'; -- default값 확인 가능
select table_name, column_name, data_default from user_tab_columns where table_name = 'EMP02';

-- 데이터 추가 : default값 확인
insert into emp02(eno, ename, job) values(1001, 'Sandra', 'ACTRESS');
select * from emp02;
commit;

-- 5. primary key 제약조건
select * from user_constraints where table_name = 'DEPT01';

-- 데이터 추가: primary key 확인
insert into dept01(dno, dname, loc) values(10, 'A', 'Seoul');
select * from dept01;
commit;

insert into dept01(dno, dname, loc) values(10, 'B', 'Busan');
-- > 에러 : ORA-00001: unique constraint (EZEN01.DEPT01_DNO_PK) violated

insert into dept01(dname, loc) values('B', 'Busan');
--> 에러 : ORA-01400: cannot insert NULL into ("EZEN01"."DEPT01"."DNO")

insert into dept01(dno, dname, loc) values(20, 'B', 'Busan');
-- 추가 성공, dno컬럼의 값이 null이 아니고, 유일한 값일 떄 입력 성공

----------------------
-- 제약조건을 포함하여 employee 테이블과 department 테이블 생성
-- employee 테이블은 department 테이블을 참조함
-- department: 부모 테이블
-- employee: 자식 테이블


-- 테이블 생성: dept01, 부모 테이블
create table dept01 (
dno number(2) constraint dep01_dno_pk primary key,
dname varchar2(14) constraint dep01_dname_nn not null,
loc varchar2(13) constraint dept01_loc_nn not null
);

-- 테이블 생성: emp01, 자식 테이블
create table emp01 (
eno number(4) constraint emp01_eno_pk primary key,
ename varchar2(10) constraint emp01_ename_nn not null,
job varchar2(9) constraint emp01_job_nn not null,
manager number(4),
hiredate date constraint emp01_hiredate_nn not null,
salary number(7, 2) constraint emp01_salary_nn not null,
commission number(7, 2),
dno number(2) constraint emp01_dno_nn not null constraint emp01_dno_fk references dept01
);

-- 테이블의 구조와 제약조건 확인
desc dept01;
select * from user_constraints where table_name = 'DEPT01';

desc emp01;
select * from user_constraints where table_name = 'EMP01';

-- dept01 테이블에 데이터 입력
insert into dept01 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH', 'DALLAS');
insert into dept01 values(30, 'SALES', 'CHICAGO');
insert into dept01 values(40, 'OPERATIONS', 'BOSTON');
commit;

-- 자식 테이블인 emp01 테이블에 데이터 입력: 참조 무결성 확인
insert into emp01 values(1001, 'TOM', 'ACTOR', 9000, 
to_date('2015.04.14', 'yyyy.mm.dd'), 3000, null, 40);
-- 추가 성공: 참조 무결성에 위배되지 않음
select * from emp01;
commit;

insert into emp01 values(1002, 'JULIA', 'ACTRESS', null, 
to_date('2017,7,17', 'yyyy,mm,dd'), 2500, null, 50);
--> 에러:ORA-02291: integrity constraint (EZEN01.EMP01_DNO_FK) violated - parent key not found
-- 참조 무결성 위배됨, 부모 테이블의 컬럼 dno에 존재하지 않는 값을 자식 테이블에 추가 할 수 없음.

--> 위의 참조 무결성 위배 문제를 해결하는 방법
-- 1. emp01 테이블의 dno 컬럼의 값을 10, 20, 30, 40 중 하나로 바꾼다.
-- 2. emp01 테이블의 참조 무결성을 제거한다. (권장하지는 않음)
-- 3. 부모 테이블인 dept01 테이블에 dno가 50번인 값을 넣는다.

-- 3번 방법
insert into dept01 values(50, 'IT', 'SEOUL');
select * from dept01;
commit;

insert into emp01 values(1002, 'JULIA', 'ACTRESS', null, 
to_date('2017,7,17', 'yyyy,mm,dd'), 2500, null, 50);
select * from emp01;
commit;

-----------------------
-- < 테이블 구조 변경 > 제약조건의 추가 / 변경 / 삭제
-- 테이블을 복사해서 생성하면 제약조건은 복사되지 않는다.
create table emp02 as select * from employee;
create table dept02 as select * from department;

desc dept02;
select * from dept02;
select * from user_constraints where table_name = 'DEPT02';

desc emp02;
select * from emp02;
select * from user_constraints where table_name = 'EMP02';

-- constraint_type - P: Primary Key, R: Forign Key, U: Unique, C: Not Null, Check

-- 1. 제약조건의 추가 : 부모 테이블의 제약조건부터 추가하고, 자식 테이블의 제약조건을 추가해야 함

-- 1-1. add 명령으로 추가하는 방법, 
-- 단점) null, not null 제약조건이 변경되지 않는다.
-- 부모 테이블 : dept02 테이블의 dno 컬럼에 Primary Key를 추가함
alter table dept02 add constraint dept02_dno_pk Primary Key(dno);

select * from user_constraints where table_name = 'DEPT02';

-- 자식 테이블 : emp02 테이블의 eno 컬럼에 primary key를 추가함,
-- dno 컬럼에 foreign key 를 추가함.
alter table emp02 add constraint emp02_eno_pk primary key(eno);
select * from user_constraints where table_name = 'EMP02';
alter table emp02 add constraint emp02_dno_fk foreign key(dno) references dept02(dno);
select * from user_constraints where table_name = 'EMP02';


-- 1-2. modify 명령으로 추가하는 방법(권장)
-- 장점) 식이 간결, null, not null 제약조건 변경도 가능하다.
-- 부모 테이블 : dept02 테이블의 dno ㅋㄹ럼에 primary key를 추가함
alter table dept02 modify dno constraint dept02_dno_pk primary key;
select * from user_constraints where table_name = 'DEPT02';
-- 자식 테이블 : emp02 테이블의 eno 컬럼에 primary key를 추가함, 
-- dno 컬럼에 forign key를 추가함.
alter table emp02 modify eno constraint emp02_eno_pk primary key;
select * from user_constraints where table_name = 'EMP02';
alter table emp02 modify dno constraint emp02_eno_fk references dept02;




-- 참조 무결성 테스트
select * from dept02;
insert into emp02 values(9000, 'KIM', 'DOCTOR',
null, to_date('2020.10.12', 'yyyy,mm,dd'), 5000, null, 40);
select * from emp02;
commit;
insert into emp02 values(9100, 'LEE', 'TEACHER', null,
to_date('2021,7,17','yyyy,mm,dd'), 4000, null, 50);
-- 참조 무결성에 위배
--> 에러: ORA-02291: integrity constraint (EZEN01.EMP02_DNO_FK) violated - parent key not found

-- 2. 제약조건의 변경
-- emp02 테이블의 ename 컬럼의 제약조건을 not null로 변경
alter table emp02 modify ename constraint emp02_ename_nn not null;
select * from user_constraints where table_name = 'EMP02';

-- emp02 테이블의 commission 컬럼의 제약조건을 not null로 변경
alter table emp02 modify commission constraint emp02_commission_nn not null;
-- 실패, commission 컬럼에 null값이 이미 존재하때문에 설정을 바꿀수 없다.

-- 3. 제약조건의 제거
-- emp02 테이블의 ename 컬럼의 not null 제약조건을 제거
-- 3-1. 제약조건의 이름으로 제거
alter table emp02 drop constraint emp02_ename_nn;
select * from user_constraints where table_name = 'EMP02';

-- 3-2. 제약조건으로 제거
-- emp02 테이블의 pk와 fk를 제거
alter table emp02 drop primary key;
select * from user_constraints where table_name = 'EMP02';
alter table emp02 drop constraint emp02_eno_fk;
select * from user_constraints where table_name = 'EMP02';

-- dept02 테이블의 pk를 제거
alter table dept02 drop constraint dept02_dno_pk;
select * from user_constraints where table_name = 'DEPT02';

-- 3-3. 종속 관계(부모 자식 간의 관계)를 모두 제거하는 명령
alter table dept02 drop primary key cascade;


--------------------

select * from user_constraints where table_name in ('EMP02', 'DEPT02');
select * from user_constraints where table_name in ('EMP01', 'DEPT01');
-- 4. 제약조건의 활성화/ 비활성화(enable, desable)
-- emp02 테이블의 eno 컬럼의 Primary key 제약조건을 비활성화(disable)
alter table emp02 disable constraint emp02_eno_pk;
select * from user_constraints where table_name = 'EMP02';

select * from emp02;
desc emp02;

-- eno 컬럼의 PK 제약조건 비활성화 한후 eno 컬럼에 이미 존재하는 데이터 삽입 확인
insert into emp02(eno) values(9000);
select * from emp02;
commit;

-- 4-2. emp02 테이블의 eno 컬럼을 disable(비활성화)에서 enable(활성화)로 변경
alter table emp02 enable constraint emp02_eno_pk;
--> 에러: PK 제약조건을 활성화하려면, 중복값과 null값을 제거하고 해야함.
/*
오류 보고 -
ORA-02437: cannot validate (EZEN01.EMP02_ENO_PK) - primary key violated
02437. 00000 -  "cannot validate (%s.%s) - primary key violated"
*Cause:    attempted to validate a primary key with duplicate values or null
           values.
*Action:   remove the duplicates and null values before enabling a primary
           key.
*/

-- 중복값과 null값을 제거
delete from emp02 where eno = 9000 and ename is null;
delete from emp02 where eno is null;
select * from emp02;

-- 중복값과 null값을 제거
alter table emp02 enable constraint emp02_eno_pk;
select table_name, constraint_name, constraint_type, status 
from user_constraints where table_name = 'EMP02';

-- 중복값을 삽입 -> pk 제약조건을 활성화 하였으므로 불가능
insert into emp02(eno) values (9000);

insert into emp02(eno) values (null);











