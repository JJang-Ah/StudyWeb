-- 쇼핑몰 장바구니 테이블 생성

/*
- product, manager, member, review
- 5번째 테이블: 장바구니
- 테이블명: cart, 11개의 필드가 필요
- cart_id(장바구니 번호), 
- buyer(member 테이블의 member_id 세션), 
- product_id(product 테이블의 product_id)
- product_name(product 테이블의 product_name), 
- publishing_com()(product 테이블의 publising_com))
- author(product 테이블의 author)
- product_price(product 테이블의 가격(정가))
- discount_rate(product 테이블의 할인율)
- buy_price(구매가격),
- buy_count(구매수량)
- product_image(product 테이블의 product_image)
*/

create table cart (
cart_id bigint primary key auto_increment,
buyer varchar(50) not null,
product_id bigint not null,
product_name varchar(100) not null,
author varchar(50) not null,
publishing_com varchar(30) not null,
product_price int not null,
discount_rate int not null,
buy_price int null,
buy_count int not null,
product_image varchar(30) not null
);
use db01;
drop table cart;
desc cart;




