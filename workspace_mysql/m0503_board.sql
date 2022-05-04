-- 2002년 05월 03일 (화)

/*
< 프로젝트에서 사용할 게시판 테이블 설계 >
- 쇼핑몰 사용할 게시판 테이블 설계
- 기능: CRUD, 추가, 수정, 삭제, 글 상세보기, 글 전체보기
- 테이블 명: board
- 필드: 글번호, 글쓴이, 글제목, 글내용, 등록일시, 조회수 
- 댓글에 관한 필드: 댓글 그룹, 댓글 순서, 댓글 레벨
글번호: num, int, primary key, auto_increment //Oracle의 sequence같은 기능 mysql은 시퀀스가 없다.
글쓴이: writer, varchar(50), not null
글제목: subject, varchar(100), not null
글내용: content, text, not null
등록일시: regDate, datetime, not null
조회수: int, default 0
댓글 그룹: ref, int, not null
댓글 순서: re_step, int, not null
댓글 레벨: re_level, int, not null
*/

use db01;
show tables;

-- board 테이블 생성
-- auto_increment: 자동으로 1씩 증가하는 유일한 번호를 생성할 때 사용, oracle에서는 sequence로 생성
create table board (
num int primary key auto_increment,
writer varchar(50) not null,
subject varchar(100) not null,
content text not null,
regDate datetime default now(),
readcount int default 0,
ref int not null,
re_step int not null,
re_level int not null
);

show tables;
desc board;

insert into board(writer, subject, content, ref, re_step, re_level) 
values('aaa1111', '게시판 생성중', '게시판 생성중입니다.', 0, 0, 0);

insert into board(writer, subject, content, ref, re_step, re_level) 
values('bbb2222', 'JSP 스터디3', 'JSP 스터디 중이라구~~~', 0, 0, 0);








