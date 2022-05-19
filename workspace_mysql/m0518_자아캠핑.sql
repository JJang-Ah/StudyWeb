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
-- 상품 테이블 생성
create table product (
product_num bigint primary key auto_increment,
product_kind varchar(3) not null,
product_name varchar(100) not null,
product_image varchar(30) default 'nothing.jpg',
product_size varchar(30),
product_weight varchar(15),
product_content varchar(30) not null,
product_brand varchar(30) not null,
product_count int not null,
product_price int not null,
product_discount_rate int default 0,
reg_date datetime default now()
);


