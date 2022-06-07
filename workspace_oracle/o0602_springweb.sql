-- spring���� ����� �Խ��� ���̺� ����

-- 1. �Խ��� ���̺� ����
create table board (
seq number(20) primary key,
title varchar2(200),
writer varchar2(60),
content varchar2(3000),
regdate date default sysdate,
cnt number(20) default 0
);

-- 2. �Խ��ǿ��� ����� ������ ����
create sequence board_seq start with 1 increment by 1;


desc board;
select * from board;

insert into board(seq, title, writer, content) values(
board_seq.nextval,
'�Խ��� �׽�Ʈ 1',
'�ۼ��� 1',
'�Խ����� �׽�Ʈ�ϴ� ���Դϴ�. 1'
);
commit;

-- 3. ȸ�� ���̺� ����
create table Member (
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(30) not null,
    role varchar2(30) not null
);
insert into member values('admin', '1234', '�ڼ���', '������');
insert into member values('aaa1111', '1234', '������', '�Ϲݻ����');
commit;

select * from member;