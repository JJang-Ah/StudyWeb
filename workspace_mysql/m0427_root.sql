-- 2022년 4월 27일 (수)

-- 현재 root 계정 (관리자 계정) -> root 페이지

-- 1. 사용자 계정 생성하고 권한 부여
-- id: ezen01, pwd: 1234

-- 1-1. 사용자 계정 생성
create user ezen01@'%' identified by '1234';	

-- 1-2. 사용자 권한 부여
-- *.*, 모든 데이터베이스의 모든 테이블 -> 데이터베이스명.테이블명
grant all on *.* to ezen01@'%' with grant option;


