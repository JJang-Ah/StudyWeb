/*

-- 쇼핑몰에서 사용할 리뷰 테이블 설계
1. review 테이블 생성 - 7개 필드사용, 댓글 처리 x
-- num, member_id, product_id, subject, content, regDate, readcount의 7개 필드로 구성
-- PK: num, auto_increment, 자동으로 1씩 증가, 
-- 변경할 필드: write를 member_id로 변경하고, 회원의 아이디를 저장함
-- 삭제할 필드: ref, re_step, re_level, 댓글 처리에 대한 3개의 필드 
-- 새로 추가할 필드: product_id, 상품의 아이디

*/
/*
create table review (
num int primary key auto_increment,
member_id varchar(50) not null,
product_id bigint not null,
subject varchar(100) not null,
content text not null,
regDate datetime default now(),
readcount int default 0
);
*/

/*
delimiter $$
create procedure p_review_insert3() 
begin
	declare i int default 1;
    while i <= 80 do
		insert into review(member_id, product_id, subject, content)
        values('aaa1111', 83, concat('한국 사회에서 공정이란 무엇인가', i, '번'), 
        ' 새로운 대통령을 맞이하는 한국 사회는 그동안 얼마나 공정해졌을까? 2020년  《경향신문》의 여론조사에 따르면, 한국 사회가 공정하다고 생각하는 사람은 응답자 중 30퍼센트에 불과했다. 언론에서는 공정 과 관련된 기사가 쏟아지고, 서점에는 공정에 대한 책이 한두 권이 아니다. 공정에 대한 사람들의 요구가 많아지는 만큼 사회가 더 공정해져야 하는데, 왜 이럴까?
『한국 사회에서 공정이란 무엇인가』의 저자 김범수 서울대 교수에 의하면, 한국 사회가 여전히 불공정하다고 인식되는 이유는 공정을 논의하는 방식인 공정 담론에 문제가 있기 때문이다. 한국의 공정 담론은 분배와 경쟁에 치중되어 있다. 경쟁에서 승리한 사람에게 그에 합당한 몫이 돌아가야 한다는 것, 즉 능력주의가 한국의 주요 공정 담론이다. 그런데 공정 담론에는 능력주의만 있는 게 아니다.'
        
        ) ;
		set i = i+1;
    end while;
end $$
delimiter $$
*/

-- 생성된 프로시저 확인
show procedure status;
show create procedure p_review_insert250;
-- drop procedure p_review_insert;
-- 프로시저 실행
-- call p_review_insert;

-- select * from review where product_id = 3;

