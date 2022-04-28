
-- 2022년 4월 27일 (수)

-- 여기는 사용자 계정 ezen01 안이다.
-- mysql에서는 oracle처럼 계정안에 바로 테이블이나 뷰를 만들어 사용하지 않고,
-- 데이터베이스를 만들어서 그 안에서 테이블이나 뷰를 만들어 사용함.

-- 1. 사용자 확인
select user();

-- 2. 데이터베이스 확인
select database();

-- 3. 데이터베이스 생성
create database db01;
select database(); -- null -> 생성만 하고, 사용하겠다고 하지 않았기 때문

-- 4. 데이터베이스 사용
use db01;
select database();

-- 5. 데이터베이스 삭제
drop database db01;
select database();

--------------------
create database db01;
use db01;
select database();

-- 6. 현재 계정의 모든 데이터베이스 확인
create database db02;
show databases;

-- 7. 현재 데이터베이스 안의 있는 모든 테이블 확인
use db01;
select database();
show tables;

-- 8. 테이블 생성
-- 
/*
<MySQL의 데이터 타입 >
1. 정수 
-- tinyint(1B), smallint(2B), mediumint(3B), int(4B), bigint(8B)
-- 대개는 int를 주로 사용
2. 실수
- decimal(전체 자리수, 소수점이하 자리수)
- float, double
3. 문자열
- char: 고정 문자열, ex) char(5)
- varchar: 가변 문자열 ex) varchar(5)
4. 날짜와 시간
- date: 3B, 날짜
- time: 3B, 시간
- datetime: 8B, 날짜와 시간
- timestamp: 4B, 날짜와 시간
5. 기타 데이터 타입
- blob(binary large object): 바이너리 데이터 중에서 아주 큰 데이터
- text: 문자의 아주 큰 데이터


< 사원 테이블 설계 >
-- oracle에서 사용했던 employee 테이블과 동일한 테이블을 직접 생성
-- 테이블명: employee
-- 필드(컬럼): eno(문자), ename(문자), job(문자), manager(정수), hiredate(날짜),
 salary(실수), commission(실수), dno(정수)
-- PK(Primary Key): eno
*/
drop table employee;

-- 테이블 생성
create table employee (
eno int primary key,
ename varchar(20) not null,
job varchar(20) not null,
manager int,
hiredate date,
salary decimal(7, 2),
commission decimal(7, 2),
dno int
);

-- 데이터베이스와 테이블 확인
use db01;
select database();
show tables;
desc employee;
select * from employee;

delete from employee;
-- employee 테이블에 데이터 삽입

INSERT INTO EMPLOYEE VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO EMPLOYEE VALUES(7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30);
INSERT INTO EMPLOYEE VALUES(7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30);
INSERT INTO EMPLOYEE VALUES(7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20);
INSERT INTO EMPLOYEE VALUES(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1250,1400,30);
INSERT INTO EMPLOYEE VALUES(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30);
INSERT INTO EMPLOYEE VALUES(7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10);
INSERT INTO EMPLOYEE VALUES(7788,'SCOTT','ANALYST',7566,'1987-07-13',3000,NULL,20);
INSERT INTO EMPLOYEE VALUES(7839,'KING','PRESIDENT', NULL,'1981-11-17',5000,NULL,10);
INSERT INTO EMPLOYEE VALUES(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30);
INSERT INTO EMPLOYEE VALUES(7876,'ADAMS','CLERK',7788,'1987-07-13',1100,NULL,20);
INSERT INTO EMPLOYEE VALUES(7900,'JAMES','CLERK',7698,'1981-12-3',950,NULL,30);
INSERT INTO EMPLOYEE VALUES(7902,'FORD','ANALYST',7566,'1981-12-3',3000,NULL,20);
INSERT INTO EMPLOYEE VALUES(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

select * from employee;
commit;

-- JSP 프로그램에서 DB연동할 테이블 생성
-- 회원 테이블, member 테이블 생성
-- 필드: id(아이디, 문자), pwd(비밀번호, 문자), name(이름, 문자), age(나이, 정수), regDate(가입일, 날짜)
-- id는 PK로 설정
create table member (
id varchar(20) primary key,
pwd varchar(20) not null,
name varchar(20) not null,
age int not null,
regDate datetime not null
);

desc member;

insert into member values('aaa1111', '1234', '이현이', 35, now());
insert into member values('bbb2222', '1234', '송혜나', 34, now());
insert into member values('ccc3333', '1234', '아이린', 33, now());

select * from member;





