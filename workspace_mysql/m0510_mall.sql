-- 쇼핑몰에 대한 테이블 설계
/*
< 쇼핑몰에 대한 테이블 설계 >
전체: 북 쇼핑몰
개인: 어떤 쇼핑몰을 설계할 것인가?

1. 쇼핑몰 프로젝트의 설계
- 관리자의 관점, 사용자의 관점에서의 활용이 모두 가능하도록 설계

(1) 관리자의 관점: 상품의 관리(등록, 수정, 삭제, 조회), 회원의 관리(정보확인, 수정, 삭제)
(2) 사용자의 관점: 회원 관리(등록, 수정, 삭제, 정보 조회, 로그인, 로그아웃), 상품(나열, 상세, 구매)
	, 장바구니!!(등록, 수정, 삭제), 상품에 대한 리뷰(등록, 수정, 삭제, 조회), QnA,  상품 구매 처리

2. 쇼핑몰 프로젝트의 테이블
- manager, product, member, cart, buy, bank, review, qna ... 
- 8개의 테이블 활용

(1) member 테이블
- 회원(사용자) 테이블
- 기능: CRUD, 회원가입, 회원수정, 회원확인(1명), 회원삭제(탈퇴)
- 로그인, 로그아웃
- 테이블명: member
- 필드 구성: 7개의 컬럼 구성
-- id: 아이디, varchar(50), primary key
-- pwd: 비밀번호, varchar(20), not null
-- name: 이름, varchar(30), not null
-- email: 이메일, varchar(50), not null
-- tel: 전화번호, varchar(20), not null
-- address: 주소, varchar(100), not null
-- regDate:  datetime, not null

(2) manager 테이블
- 관리자 테이블
- 필드 구성: 아이디, 비밀번호로 구성
- 기능: 상품의 관리와 회원의 관리를 위해 관리자 1명을 등록시켜 놓음

(3) product 테이블 -> 책 기준 
-> 학생 본인 설계할 테이블에는 어떤 컬럼이 필요한가?
- 상품 정보 테이블 -> 가장 중요한 핵심 테이블
- 필드 구성: 상품 아이디, 상품 종류, 상품 이름, 상품 가격(정가), 상품 재고 수량, 
- 북 저자, 출판사(제조사), 출판일(제조일), 
- 상품 이미지(책은 1개), 상품 설명, 할인율, 상품 등록일 
- 필드 구성: 12개의 컬럼으로 구성 

-- product_id : 상품 아이디, bigint, PK, auto_increment
-- product_kind : 상품 종류, varchar(3), not null
-- product_name : 상품 이름, varchar(100), not null
-- product_price : 상품 가격, int, not null
-- product_count : 상품 재고 수량, int, not null
-- author : 책 저자, varchar(50), not null
-- publishing_com : 출판사, varchar(30), not null
-- publishing_date : 출판사, varchar(15), not null
-- product_image : 상품 이미지, varchar(30), default 'nothing'
-- product_content : 상품 설명, text, not null
-- discount_rate : 할인율, int, default 10
-- regDate : datetime, default now()

*/

-- (1) member 테이블
create table member (
id varchar(50) primary key,
pwd varchar(20) not null,
name varchar(30) not null,
email varchar(30) not null,
tel varchar(20) not null,
address varchar(100) not null,
regDate datetime not null
);

-- (2) manager 테이블
create table manager (
managerId varchar(50) primary key,
managerPwd varchar(20) not null
);

desc manager;
insert into manager values('admin', '1234');
select * from manager;
drop table product;
-- (3) product 테이블 -> 수업: 책, 학생: 개인별 아이템(?)
create table product (
product_id bigint primary key auto_increment,
product_name varchar(100) not null,
product_kind varchar(3) not null,
product_price int not null,
product_count int not null,
author varchar(50) not null,
publishing_com varchar(30) not null,
publishing_date varchar(15) not null,
product_image varchar(30) default 'nothing.jpg',
product_content text not null,
discount_rate int default 10,
reg_date datetime default now()
);

insert into product(product_name, product_kind, product_price, product_count, author, 
publishing_com, publishing_date, product_content)
values (
'스마일', 
'100',
14000,
100,
'김중혁',
'문학과지성사',
'2022년 04월 20일',
'예의를 갖춰서 웃으며 말해라, 그리고 땅을 보지 말고 정면을 봐라.'
);
select * from product;








