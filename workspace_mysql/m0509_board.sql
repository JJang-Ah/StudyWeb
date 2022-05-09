-- 05/09 (월)

show databases;
use db01;

/*
insert문을 반복적으로, 대량으로 사용하는 프로시저 작성
- 253건의 게시글을 게시판에 삽입할 예정
- 프로시저를 만들어 사용
*/

/*
-- 프로시저 생성
delimiter $$
create procedure p_board_insert() 
begin
	declare i int default 1;
    while i <= 253 do
		insert into board(writer, subject, content, ref, re_step, re_level) 
        values('aaa1111', concat('게시글', i, '번'), concat(i, '번 게시글을 등록합니다.'), 61+i, 0, 0) ;
		set i = i+1;
    end while;
end $$
delimiter $$
*/

-- 생성된 프로시저 확인
-- show procedure status;

-- 프로시저 확인
call p_board_insert;

-- limit 끝번호, 처음부터 10개를 가져온다.
select * from board limit 10;

-- 12번째 데이터부터 5개를 출력
-- limit에서는 시작번호0부터 시작
select * from board limit 11, 5;

select * from board order by ref desc, re_step asc limit 11,10;
