-- 2002년 05월 03일 (화)

/*
< 프로젝트에서 사용할 게시판 테이블 설계 >
- 쇼핑몰 사용할 게시판 테이블 설계
- 기능: CRUD, 추가, 수정, 삭제, 글 상세보기, 글 전체보기
- 테이블 명: board
- 필드: 글번호, 글쓴이, 글제목, 글내용, 등록일시, 조회수 
- 댓글에 관한 필드: 댓글 그룹, 댓글 순서, 댓글 레벨
글번호: num, int, primary key, auto_increment //Oracle의 sequence같은 기능 mysql은 시퀀스가 없다.
글쓴이: writer, varchar(30), not null
글제목: subject, varchar(100), not null
글내용: content, text, not null
등록일시: regDate, datetime, not null
조회수: int, default 0
댓글 그룹: ref, int, not null
댓글 순서: re_step, int, not null
댓글 레벨: re_level, int, not null





*/