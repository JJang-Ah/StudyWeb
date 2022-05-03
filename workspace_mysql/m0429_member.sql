-- 2022년 4월 29일 (금요일)

select user();
show databases;
select database();
use db01;
select database();
show tables;

drop table member;

show tables;

/*
< 프로젝트에서 사용할 회원가입 테이블 설계 >
- 쇼핑몰에서 사용할 회원 테이블
- 기능: CRUD, 회원가입, 회원수정, 회원확인(1명), 회원삭제(탈퇴)
- 로그인, 로그아웃
- 테이블명: member
- 필드 구성
-- id: 아이디, varchar(50), primary key
-- pwd: 비밀번호, varchar(20), not null
-- name: 이름, varchar(30), not null
-- email: 이메일, varchar(50), not null
-- tel: 전화번호, varchar(20), not null
-- address: 주소, varchar(100), not null
-- regDate:  datetime, not null

*/

create table member (
id varchar(50) primary key,
pwd varchar(20) not null,
name varchar(30) not null,
email varchar(30) not null,
tel varchar(20) not null,
address varchar(100) not null,
regDate datetime not null
);

desc member;
select * from member;

insert into member values('aaa1111', '1234', '박선영', 'parksy@naver.com', '010-1111-1111', 
'서울시 용산구 용산대로 30', now());
insert into member values('bbb2222', '1234', '신효범', 'shinhb@naver.com', '010-2222-2222', 
'서울시 서초구 서초대로 20', now());
insert into member values('ccc3333', '1234', '송은이', 'songee@naver.com', '010-3333-3333', 
'서울시 마포구 마포대로 30', now());
select * from member;

