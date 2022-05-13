
-- product 테이블 페이징 테스트
/*
insert문을 반복적으로, 대량으로 사용하는 프로시저 작성
- 253건의 상품을 게시판에 삽입할 예정
- 프로시저를 만들어 사용
*/


-- 프로시저 생성
/*
delimiter $$
create procedure p_product_insert() 
begin
	declare i int default 1;
    while i <= 250 do
		insert into product(product_kind, product_name, product_price, product_count, author,
        publishing_com, publishing_date, product_image, product_content) 
        values('110', concat('꽃잎 한 장처럼 ', i, '번'), 16000, 100, '이해인', '샘터', '2022-02-28', '110_001.PNG', '오늘을 살아가는 당신을 위한 수녀의 시 편지') ;
		set i = i+1;
    end while;
end $$
delimiter $$
*/

-- 생성된 프로시저 확인
show procedure status;

-- 프로시저 실행
call p_product_insert;

select * from product;

-- limit 끝번호, 처음부터 10개를 가져온다.
select * from board limit 10;

update product
set product_image = '110_001.PNG'
where author = '이해인';

-- 12번째 데이터부터 5개를 출력
-- limit에서는 시작번호0부터 시작
select * from board limit 11, 5;

select * from board order by ref desc, re_step asc limit 11,10;
