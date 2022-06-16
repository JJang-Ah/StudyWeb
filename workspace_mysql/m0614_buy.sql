-- 쇼핑몰 구매 테이블 생성, 카드(결제) 테이블 생성

/*
필드 구성: 
구매번호, 구매자, 상품번호, 상품 이름, 구매가격, 구매수량, 상품이미지, 구매일자, 경제정보(카드),
수령인, 수령인 전화번호, 수령인 주소, 배송상태alter
- buy-id: 구매번호, int, PK, auto_increment
- buyer: 구매자, varchar -> member 테이블의 id(memberId 세션)
- product_id: 상품번호, int -> product 테이블의 product_id
- product_name: 상품이름, vachar -> product 테이블의 product_name, cart 테이블의 product_name
- buy_price: 구매가격, int -> cart 테이블의 buy_price, product 테이블의 product_price와 discount_rate를 사용하여 구함
- buy_count: 구매수량, int -> cart 테이블의 buy_count,
- product_image: 상품이미지, varchar -> cart 테이블의 product_image, product 테이블의 product_image
- buy_date: 구매일자, date -> default now()
- account: 결제정보, 은행카드번호와 카드이름, varchar
- delivery_name: 수령인, varchar
- delivery_tel: 수령인 전화번호 varchar
- delivery_address: 수령인 주소, varchar
- delivery_state: 배송상태, varchar
*/
use db01;
create table buy (
buy_id bigint primary key auto_increment,
buyer varchar(50) not null,
product_id bigint not null,
product_name varchar(100) not null,
buy_price int not null,
buy_count int not null,
product_image varchar(30) not null,
buy_date datetime default now(),
account varchar(50) not null, 
delivery_name varchar(30) not null,
delivery_tel varchar(20) not null,
delivery_address varchar(100) not null,
delivery_state varchar(20) default '상품 준비중'
);
desc buy;
select * from buy;
/*
은행(bank) 테이블의 필드 구성
- 카드번호, 카드회사(은행), 사용자아이디, 사용자이름
- cart_no : varchar(20), not null
- card_com : varchar(20), not null
- member_id : varchar(50), not null
- member_name : varchar(50), not null
*/