use db01;

select * from board;
-- 프로시저 생성
/*
delimiter $$
create procedure p_crush_board_insert() 
begin
	declare i int default 1;
    while i <= 253 do
		if i%10 = 0 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('aaa1111', '꿈에 크러쉬 나왔따 ㅠㅠ', '오늘 로또 산다~~!!', 610+i, 0, 0) ;
		elseif i%10 = 1 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('bbb2222', '오늘 하루종일 음악만 들어따', '크러쉬 노래만 계속 들어따 질리지가 않는다... 😁', 610+i, 0, 0) ;
		elseif i%10 = 2 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('ccc3333', '늦었지만 5월 3일 크러쉬 생일 축하해!@', '태어나줘서 고마워요~!~!', 610+i, 0, 0) ;
		elseif i%10 = 3 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('aaa1111', '이번 싸이 앨범에서 happier가 젤로 좋아!' , '이노래 없으면 어떢할뻔 했어 ㅠㅠ', 610+i, 0, 0) ;
		elseif i%10 = 4 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('bbb2222', '정말 치유된다 크러쉬....', '죽을때까지 노래해줘 ㅠㅠ', 610+i, 0, 0) ;
		elseif i%10 = 5 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('ccc3333', '크러쉬 요즘은 어떻게 지내?!', '나는 잘지내~!!', 610+i, 0, 0) ;
		elseif i%10 = 6 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('aaa1111', '크러쉬 최근에 올렸던 인스타 피드', '얼른 전역 했으면 좋겠다!!', 610+i, 0, 0) ;
		elseif i%10 = 7 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('bbb2222', '오늘 갑자기 광고에 효섭씨 노래가..♥', '생각치도 못했던 행복..', 610+i, 0, 0) ;
		elseif i%10 = 8 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('ccc3333', '바다에서 콘서트하는 꿈★', '행복해서 승천해 죽을뻔★', 610+i, 0, 0) ;
		elseif i%10 = 9 then
		insert into board(writer, subject, content, ref, re_step, re_level) 
		values('ccc3333', '효서비 빨리 목소리듣고싶고 보고싶다.', '얼른와 크러쉬 ㅠㅠ 보고시퍼', 610+i, 0, 0) ;
		end if;
		set i = i+1;
    end while;
end $$
delimiter $$
*/