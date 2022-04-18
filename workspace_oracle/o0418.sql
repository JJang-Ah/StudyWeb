-- 2022.04.18 (월)

------------
/*
< 인덱스 (index) >
- 검색 속도의 향상을 위해서 사용하는 가능
- 직접 인덱스를 생성할 수도 있고, 데이터 무결성의 확인을 위해 수시로 사용하는 
기본키는 인덱스가 자동으로 생성 

튜닝 - 인덱스를 통해서 검색 속도를 향상시키는 기법
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

/*
< 인덱스르 사용해야 하는 경우 >
1. 테이블에 행(데이터)이 아주 많은 경우 ex) 수만건 이상의 데이터가 있을 때
2. where절에서 해당 컬럼이 자주 사용되는 경우
3. 검색 결과가 전체 데이터의 2% ~ 4% 정도인 경우
4. join에 자주 사용되는 컬럼이 있는 경우
5. 데이터에 null을 포함하는 컬럼이 많은 경우

< 인덱스를 사용하지 말아야 하는 경우 >
1. 테이블의 행이 적은 경우
2. where절에서 해ㅅ당 컬럼이 자주 사용되지 않을 때
3. 검색 결과가 전체 데이터의 10%~15% 정도인 경우
4. 테이블에서 select를 제외한 DML, 작업(insert, update, delete)이 자주 발생하는 경우


< 인덱스의 종류 >
1. 인덱스가 유일한 값을 갖는지의 여부에 따라
- 고유 인덱스(unique index): 인덱스가 유일한 값을 가지는 인덱스, 
ex) primary key(기본키), unique(유일키)
- 비고유 인덱스(non-unique index): 중복된 데이터를 갖는 컬럼에 생성되는 인덱스

2. 인덱스를 구성하는 컬럼의 개수에 따라
- 단일 인덱스(single index): 한개의 컬럼으로 구성되는 인덱스
- 결합 인덱스(composite index): 두 개 이상의 컬럼으로 구성되는 인덱스

3. 함수 기반 인덱스
- 수식이나 
*/

create table emp01 as select * from employee;
create table dept01 as select * from department;

alter table emp01 modify eno constraint emp01_eno_pk primary key;
alter table dept01 modify dno constraint dept01_dno_pk primary key;

select table_name, constraint_name, constraint_type, status
from user_constraints
where table_name in ('EMP01', 'DEPT01');

-- emp01, dept01 테이블의 PK인 eno, dno 컬럼에 생성된 인덱스 확인
select * from user_ind_columns where table_name in ('EMP01', 'DEPT01');
select * from user_indexes where table_name in ('EMP01', 'DEPT01');

-- 문제1) dept01 테이블의 dname 컬럼에 고유 인덱스 설정
create unique index  idx_dept01_dname on dept01(dname);

select * from user_indexes where table_name = 'DEPT01';

-- 고유 인덱스의 생성 불가 -> 비고유 인덱스를 생성 
-- 1-1. loc에 중복된 값을 삽입
insert into dept01 values(50, 'IT', 'NEW YORK');
commit;

-- loc에 고유 인덱스를 생성
create unique index idx_dept01_loc on dept01(loc);
-- ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found

-- 1-2. 해결책) loc가 중복 데이터를 가지므로 비고유 인덱스를 생성
create index idx_dept01_loc on dept01(loc);
select * from user_indexes where table_name = 'DEPT01';

-- 1-3. 결합 인덱스 - 두 개 이상의 컬럼에 인덱스를 생성
-- dname과 loc 컬럼을 결합하여 하나의 인덱스를 생성
create index idx_dept01_com on dept01(dname, loc);
select * from user_indexes where table_name = 'DEPT01';
select * from user_ind_columns where table_name = 'DEPT01';

-- 1-4. 함수 기반 인덱스 - 수식이나 함수를 기반으로 생성된 인덱스
-- emp01 테이블에 salary 컬럼에 12를 곱한 수식에 인덱스를 생성
create index idx_emp01_salary12 on emp01(salary*12);
select * from user_indexes where table_name = 'EMP01';
select * from user_ind_columns where table_name = 'EMP01';

----------------------
-- 1-5. 인덱스의 재생성
-- 인덱스가 생성된 이후에 새로운 데이터가 추가/ 삭제 될 때 인덱스로 사용된 컬럼의
-- 값이 변경되고, 이를 인덱스에도 반영해야됨

select * from user_indexes where table_name = 'DEPT01';
alter index dept01_dno_pk rebuild ;
alter index idx_dept01_dname rebuild;
select * from user_indexes where table_name = 'DEPT01';

-- 1-6. 인덱스 제거
-- 결합 인덱스인 idx_dept01_com 인덱스 삭제
drop index idx_dept01_com;
select * from user_indexes where table_name = 'DEPT01';

----------------------

/*
< 사용 권한 >
1. 시스템 권한: 주로 DBA(Database Adminstrator, 데이터베이스 관리자)에게 부여된 권한
- 사용자의 생성과 제거, 자원의 관리와 같이 데이터베이스를 관리하는 권한
- ex) create user ~, 사용자 생성 권한 

2. 사용자 권한
- create table ~, create view ~, create sequence ~, create index ~ ...
- create session ~: 사용자가 자신의 계정에 접속할 수 있는 권한

3. 객체 권한
- 테이블, 뷰, 시퀀스, 인덱스, 함수 등과 같이 객체별로 사용할 수 있는 권한
- create, drop (DDL)은 모든 객체에서 사용 가능
             table  |  view  |  sequnce  |  procedure
select     |   ○   |   ○    |    ○     |      ○
insert     |   ○   |   ○    |           |
update     |   ○   |   ○    |           |
delete     |   ○   |   ○    |           |
alter      |   ○   |        |     ○     |
index      |   ○   |        |           |
reference  |   ○   |        |            |
execute    |        |        |            |     ○

4. 사용자 생성 / 사용자 제거 / 권한 부여 / 권한 제거
사용자 생성 : crate user 사용자명(계정) identified by 비밀번호;
사용자 제거 : drop user  사용자명(계정)
사용자 비밀번호 변경 : alter user 사용자명 identified by 비밀번호

권한 부여 : grant 권한명 ... to 사용자명(계정);
권한 제거 : revoke 권한명... from 사용자명(계정);


(계정 생성)
create user it01 identified by 1234;
(접속 권한 부여)
grant create session to it01;
(테이블 생성 권한 부여)
grant create table to it01;
(계정 접속)
conn it01/1234

(it01에서 ezen01의 table에 접근하기)
(권한 부여)
SQL> grant select on ezen01.emp01 to it01;
Grant succeeded.
SQL> conn it01/1234
Connected.
SQL> show user;
USER is "IT01"
SQL> select * from ezen01.emp01;

(권한 뺏기)
(테이블 생성 권한 제거)
revoke create table from it01;
(접속 권한 제거)
 revoke create session from it01;
 
# 특정 사용자에게 특정 권한을 부여하는 방법
grant select on ezen01.emp01 to it01;

- 사용자가 가진 권한 확인
select * from session_privs;

★★
5. with grant option
- 권한을 부여받은 사용자가 해당권한을 다른 사용자에게 부여할 수 있도록 하는 명령
ex) grant select on ezen01.dept01 to it01 with grant option; --> 다른사람에게 권한 부여가능
- grant select on ezen01.dept01 to it01; --> 사용자가 부여받은 권한을 다른사용자에게 부여 불가

★★
6. public 권한
- 모든 사용자에게 해당 권한을 부여하는 명령
ex) grant 권한명... to public.

★★★
7. 롤(role) 권한
- 사용자가 효과적으로 권한을 관리할 수 있도록 관련된 권한끼리 묶어놓은 것,
권한의 묶음 이다.

<롤 권한의 종류>
- 권한의 확인 : 
- 일반 권한 확인 : select * from session_privs;
- 롤 권한 확인 : select * fror user_role_privs;
(1) 사전 정의된 롤
- connect: create session, create table, create view, create sequence
, create synonym, alter session, create cluster, create database link
- resource: create table, create view, create sequence, create cluster, create procedure
, create trigger
- dba: with admin option 에 대한 모든 권한

- connect: 사용자가 데이터베이스에 접속할 수 있도록 하는 가장 기본적인 시스템 권한
8가지를 그룹화한 것
- resource: 사용자가 객체(table, view, sequence, procedure)를 생성할 수 있는 권한을
그룹화 한 것이다.
- dba: 시스템 관리에 필요한 모든 권한을 그룹화 한 것, 사용자들이 소유한 모든 객체를
관리하고, 사용자를 생성, 변경, 제거할 수 있는 모든 권한을 가짐.

(2) 사용자 정의한 롤
- ★ 사용자가 롤 권한을 생성하려면, 그 사용자는 dba권한이 있어야 한다.

7-1. 사용자 롤 권한 생성
create role role_test01; -- 사용자 정의 롤 생성
grant create session, create table, create view to role_test01; -- 사용자 정의 롤에 권한 부여
grant role_test01 to it04; -- it04사용자에게 role_test01 권한을 부여

사용자 롤 권한을 생성한 사용자에서 롤 권한을 확인
select * from role_sys_privs where role = '사용자 정의 롤 이름';

사용자 롤 권한을 부여받은 사용자에서 부여받은 롤 권한을 확인
select * from user_role_privs; -- 롤 권한 확인
select * from session_privs; -- 롤 권한 안에 있는 권한 확인

7-2. 사용자 롤 권한 삭제
- ★ 사용자가 롤 권한을 삭제하려면, 그 사용자는 dba 권한이 있어야 한다.

drop role '사용자 정의 롤 이름';
- 삭제할 사용자는 dba이어야 함.
- 롤 권한을 삭제하면, 롤 권한을 부여받은 테이블에서도 롤 권한이 삭제됨.

문제) ezen01 사용자에서 자신의 dept01 테이블을 검색할 수 있는 롤 권한인 
role_select_dept01를 생성하고 it04 사용자에게 이 권한을 부여하여 확인하시오.
create role role_select_dept01;
grant select on ezen01.dept01 to role_select_dept01;

-- 롤에 부여한 테이블 관련 권한 정보 확인
ex)
select * form role_tab_privs where role like '%DEPT01';



--------------------------------
뭔지 몰라서 일단 써놈
alter user it04 default tablespace users quota unlimited on users;
*/

select * from role_sys_privs;
select * from role_tab_privs where role like '%DEPT01';


/*
< 동의어 > synonym
1. 동의어
- 데이터베이스 객체에 대한 별칭

2. 동의어의 종류
- 전용 동의어: 개별 사용자를 대상으로 하는 동의어, 객체의 접근 권한을 부여받은 사용자가 
정의하고, 해당 사용자만 사용할 수 있음.
- 공용 동의어: 전체 사용자를 대상으로 하는 동의어, dba 권한을 가진 사용자만 
생성할 수 있음. 권한을 주는 사용자가 정의한 동의어를 누구나 사용할 수있음.


*/

