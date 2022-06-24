-- spring에서 사용한 게시판 테이블 생성

-- 1. 게시판 테이블 생성
create table board (
seq number(20) primary key,
title varchar2(200),
writer varchar2(60),
content varchar2(3000),
regdate date default sysdate,
cnt number(20) default 0
);

-- 2. 게시판에서 사용할 시쿼스 생성
create sequence board_seq start with 1 increment by 1;


desc board;
select * from board;

insert into board(seq, title, writer, content) values(
board_seq.nextval,
'게시판 테스트 1',
'작성자 1',
'게시판을 테스트하는 중입니다. 1'
);
commit;

-- 3. 회원 테이블 생성
create table Member (
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(30) not null,
    role varchar2(30) not null
);
insert into member values('admin', '1234', '박성실', '관리자');
insert into member values('aaa1111', '1234', '최정직', '일반사용자');
commit;

select * from member;

-- 4. 게시판 테이블 수정 -> 업로드 파일 추가
-- uploadFile varchar(100) 필드 추가

drop table board;
create table board (
seq number(20) primary key,
title varchar2(200),
writer varchar2(60),
content varchar2(3000),
uploadFile varchar2(100) default 'default.jpg',
regdate date default sysdate,
cnt number(20) default 0
);
select * from board;
commit;

-- 5. member 테이블 수정
desc member;
-- id, password, name, email, tel, address, regdate
drop table member;

create table member (
id varchar2(20) primary key, 
password varchar2(20) not null, 
name varchar2(30) not null,
email varchar2(30) not null,
tel varchar2(20) not null,
address varchar2(300) not null,
regdate date default sysdate
);

insert into member(id, password, name, email, tel, address) 
values('aaa1111', '1234', '이용진', 'leeyj@gmail.com', 
'010-1111-1111', '서울시 강남구 강남동 강남아파트 101동 101호');

select * from member;
commit;