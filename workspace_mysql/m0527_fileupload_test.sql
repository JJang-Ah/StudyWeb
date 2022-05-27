-- 파일 업로드 테스트
use db01;

-- 파일 업로드 테이블
create table fileUpload (
writer varchar(30) not null,
subject varchar(100) not null,
uploadFile1 varchar(30),
uploadFile2 varchar(30),
uploadFile3 varchar(30),
uploadFile4 varchar(30),
uploadFile5 varchar(30)
);

select * from fileUpload;
