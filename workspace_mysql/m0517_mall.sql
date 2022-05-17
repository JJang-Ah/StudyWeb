
-- product 신상품 3개 가져오기
select product_name, publishing_date from product 
where product_kind = '110' order by publishing_date desc limit 3;
select * from product 
where product_kind = '110' order by publishing_date desc limit 3;

select * from product where product_id in (select max(product_id) 
from product group by product_kind)
order by product_kind;
select * from product where product_kind = '620';

