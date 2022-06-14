-- 장아현의 개인 쇼핑몰

drop database db02;

-- 쇼핑몰은 db02로 작업
create database db02;
use db02;

/*
1. 개인 쇼핑몰 product 테이블 생성
2. 데이터 추가해서 확인
---------
3. 자료를 모아서 테이블 삽입
images_petlove에 이미지 넣어두어야 한다.
메인메뉴(최소5개) - 하위메뉴(3개 이상)
메인메뉴_하위메뉴
상품 종류 110 -> 1번째 메인메뉴에 대한 첫번째 하위메뉴 
110_001.PNG 

PetLove 쇼핑몰이라는 가정하에
3. manager/product/ 안에 있는 jsp파일을 수정, ProductDAO 수정
productList.jsp부터 차례대로 완성해 나가시오.
4. mall/shopping/ 안에 shopAll.jsp, shopMain.jsp를 만들어서 확인
*/
-- (1) 상품 테이블 생성
use db02;
create table product (
product_id bigint primary key auto_increment,
product_kind varchar(3) not null,
product_name varchar(100) not null,
product_price int not null,
product_count int not null,
brand varchar(50) not null,
product_size varchar(100),
product_weight varchar(15),
product_image varchar(30) default 'nothing.jpg',
product_content varchar(50) not null,
discount_rate int default 0,
reg_date datetime default now()
);

-- (2) member 테이블
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

insert into manager values('admin', 1234);

select * from manager;
select * from product;

-- 0612
use db02;
show tables;

create table cart (
cart_id bigint primary key auto_increment,
buyer varchar(50) not null,
product_id bigint not null,
product_name varchar(100) not null,
brand varchar(50) not null,
product_price int not null,
discount_rate int not null,
buy_price int null,
buy_count int not null,
product_image varchar(30) not null
);


create table review (
num int primary key auto_increment,
member_id varchar(50) not null,
product_id bigint not null,
subject varchar(100) not null,
content text not null,
regDate datetime default now(),
readcount int default 0
);

