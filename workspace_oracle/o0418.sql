-- 2022.04.18 (��)

------------
/*
< �ε��� (index) >
- �˻� �ӵ��� ����� ���ؼ� ����ϴ� ����
- ���� �ε����� ������ ���� �ְ�, ������ ���Ἲ�� Ȯ���� ���� ���÷� ����ϴ� 
�⺻Ű�� �ε����� �ڵ����� ���� 

Ʃ�� - �ε����� ���ؼ� �˻� �ӵ��� ����Ű�� ���
*/

create table emp01 as select * from employee;
create table dept01 as select * from department;

select * from user_constraints where table_name in ('EMP01', 'DEPT01');

-- �������� �߰�
alter table dept01 modify dno constraint dept01_dno_pk primary key;
alter table emp01 modify eno constraint emp01_eno_pk primary key;
alter table emp01 modify dno constraint emp01_dno_fk references dept01;

-- �������� Ȯ��: PK�� �ε����� ����
select * from user_constraints where table_name in ('EMP01', 'DEPT01');

-- �ε��� Ȯ�� : user_ind_columns
select * from user_ind_columns where table_name in ('EMP01', 'DEPT01');

/*
< �ε����� ����ؾ� �ϴ� ��� >
1. ���̺� ��(������)�� ���� ���� ��� ex) ������ �̻��� �����Ͱ� ���� ��
2. where������ �ش� �÷��� ���� ���Ǵ� ���
3. �˻� ����� ��ü �������� 2% ~ 4% ������ ���
4. join�� ���� ���Ǵ� �÷��� �ִ� ���
5. �����Ϳ� null�� �����ϴ� �÷��� ���� ���

< �ε����� ������� ���ƾ� �ϴ� ��� >
1. ���̺��� ���� ���� ���
2. where������ �ؤ��� �÷��� ���� ������ ���� ��
3. �˻� ����� ��ü �������� 10%~15% ������ ���
4. ���̺��� select�� ������ DML, �۾�(insert, update, delete)�� ���� �߻��ϴ� ���


< �ε����� ���� >
1. �ε����� ������ ���� �������� ���ο� ����
- ���� �ε���(unique index): �ε����� ������ ���� ������ �ε���, 
ex) primary key(�⺻Ű), unique(����Ű)
- ����� �ε���(non-unique index): �ߺ��� �����͸� ���� �÷��� �����Ǵ� �ε���

2. �ε����� �����ϴ� �÷��� ������ ����
- ���� �ε���(single index): �Ѱ��� �÷����� �����Ǵ� �ε���
- ���� �ε���(composite index): �� �� �̻��� �÷����� �����Ǵ� �ε���

3. �Լ� ��� �ε���
- �����̳� 
*/

create table emp01 as select * from employee;
create table dept01 as select * from department;

alter table emp01 modify eno constraint emp01_eno_pk primary key;
alter table dept01 modify dno constraint dept01_dno_pk primary key;

select table_name, constraint_name, constraint_type, status
from user_constraints
where table_name in ('EMP01', 'DEPT01');

-- emp01, dept01 ���̺��� PK�� eno, dno �÷��� ������ �ε��� Ȯ��
select * from user_ind_columns where table_name in ('EMP01', 'DEPT01');
select * from user_indexes where table_name in ('EMP01', 'DEPT01');

-- ����1) dept01 ���̺��� dname �÷��� ���� �ε��� ����
create unique index  idx_dept01_dname on dept01(dname);

select * from user_indexes where table_name = 'DEPT01';

-- ���� �ε����� ���� �Ұ� -> ����� �ε����� ���� 
-- 1-1. loc�� �ߺ��� ���� ����
insert into dept01 values(50, 'IT', 'NEW YORK');
commit;

-- loc�� ���� �ε����� ����
create unique index idx_dept01_loc on dept01(loc);
-- ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found

-- 1-2. �ذ�å) loc�� �ߺ� �����͸� �����Ƿ� ����� �ε����� ����
create index idx_dept01_loc on dept01(loc);
select * from user_indexes where table_name = 'DEPT01';

-- 1-3. ���� �ε��� - �� �� �̻��� �÷��� �ε����� ����
-- dname�� loc �÷��� �����Ͽ� �ϳ��� �ε����� ����
create index idx_dept01_com on dept01(dname, loc);
select * from user_indexes where table_name = 'DEPT01';
select * from user_ind_columns where table_name = 'DEPT01';

-- 1-4. �Լ� ��� �ε��� - �����̳� �Լ��� ������� ������ �ε���
-- emp01 ���̺� salary �÷��� 12�� ���� ���Ŀ� �ε����� ����
create index idx_emp01_salary12 on emp01(salary*12);
select * from user_indexes where table_name = 'EMP01';
select * from user_ind_columns where table_name = 'EMP01';

----------------------
-- 1-5. �ε����� �����
-- �ε����� ������ ���Ŀ� ���ο� �����Ͱ� �߰�/ ���� �� �� �ε����� ���� �÷���
-- ���� ����ǰ�, �̸� �ε������� �ݿ��ؾߵ�

select * from user_indexes where table_name = 'DEPT01';
alter index dept01_dno_pk rebuild ;
alter index idx_dept01_dname rebuild;
select * from user_indexes where table_name = 'DEPT01';

-- 1-6. �ε��� ����
-- ���� �ε����� idx_dept01_com �ε��� ����
drop index idx_dept01_com;
select * from user_indexes where table_name = 'DEPT01';

----------------------

/*
< ��� ���� >
1. �ý��� ����: �ַ� DBA(Database Adminstrator, �����ͺ��̽� ������)���� �ο��� ����
- ������� ������ ����, �ڿ��� ������ ���� �����ͺ��̽��� �����ϴ� ����
- ex) create user ~, ����� ���� ���� 

2. ����� ����
- create table ~, create view ~, create sequence ~, create index ~ ...
- create session ~: ����ڰ� �ڽ��� ������ ������ �� �ִ� ����

3. ��ü ����
- ���̺�, ��, ������, �ε���, �Լ� ��� ���� ��ü���� ����� �� �ִ� ����
- create, drop (DDL)�� ��� ��ü���� ��� ����
             table  |  view  |  sequnce  |  procedure
select     |   ��   |   ��    |    ��     |      ��
insert     |   ��   |   ��    |           |
update     |   ��   |   ��    |           |
delete     |   ��   |   ��    |           |
alter      |   ��   |        |     ��     |
index      |   ��   |        |           |
reference  |   ��   |        |            |
execute    |        |        |            |     ��

4. ����� ���� / ����� ���� / ���� �ο� / ���� ����
����� ���� : crate user ����ڸ�(����) identified by ��й�ȣ;
����� ���� : drop user  ����ڸ�(����)
����� ��й�ȣ ���� : alter user ����ڸ� identified by ��й�ȣ

���� �ο� : grant ���Ѹ� ... to ����ڸ�(����);
���� ���� : revoke ���Ѹ�... from ����ڸ�(����);


(���� ����)
create user it01 identified by 1234;
(���� ���� �ο�)
grant create session to it01;
(���̺� ���� ���� �ο�)
grant create table to it01;
(���� ����)
conn it01/1234

(it01���� ezen01�� table�� �����ϱ�)
(���� �ο�)
SQL> grant select on ezen01.emp01 to it01;
Grant succeeded.
SQL> conn it01/1234
Connected.
SQL> show user;
USER is "IT01"
SQL> select * from ezen01.emp01;

(���� ����)
(���̺� ���� ���� ����)
revoke create table from it01;
(���� ���� ����)
 revoke create session from it01;
 
# Ư�� ����ڿ��� Ư�� ������ �ο��ϴ� ���
grant select on ezen01.emp01 to it01;

- ����ڰ� ���� ���� Ȯ��
select * from session_privs;

�ڡ�
5. with grant option
- ������ �ο����� ����ڰ� �ش������ �ٸ� ����ڿ��� �ο��� �� �ֵ��� �ϴ� ���
ex) grant select on ezen01.dept01 to it01 with grant option; --> �ٸ�������� ���� �ο�����
- grant select on ezen01.dept01 to it01; --> ����ڰ� �ο����� ������ �ٸ�����ڿ��� �ο� �Ұ�

�ڡ�
6. public ����
- ��� ����ڿ��� �ش� ������ �ο��ϴ� ���
ex) grant ���Ѹ�... to public.

�ڡڡ�
7. ��(role) ����
- ����ڰ� ȿ�������� ������ ������ �� �ֵ��� ���õ� ���ѳ��� ������� ��,
������ ���� �̴�.

<�� ������ ����>
- ������ Ȯ�� : 
- �Ϲ� ���� Ȯ�� : select * from session_privs;
- �� ���� Ȯ�� : select * fror user_role_privs;
(1) ���� ���ǵ� ��
- connect: create session, create table, create view, create sequence
, create synonym, alter session, create cluster, create database link
- resource: create table, create view, create sequence, create cluster, create procedure
, create trigger
- dba: with admin option �� ���� ��� ����

- connect: ����ڰ� �����ͺ��̽��� ������ �� �ֵ��� �ϴ� ���� �⺻���� �ý��� ����
8������ �׷�ȭ�� ��
- resource: ����ڰ� ��ü(table, view, sequence, procedure)�� ������ �� �ִ� ������
�׷�ȭ �� ���̴�.
- dba: �ý��� ������ �ʿ��� ��� ������ �׷�ȭ �� ��, ����ڵ��� ������ ��� ��ü��
�����ϰ�, ����ڸ� ����, ����, ������ �� �ִ� ��� ������ ����.

(2) ����� ������ ��
- �� ����ڰ� �� ������ �����Ϸ���, �� ����ڴ� dba������ �־�� �Ѵ�.

7-1. ����� �� ���� ����
create role role_test01; -- ����� ���� �� ����
grant create session, create table, create view to role_test01; -- ����� ���� �ѿ� ���� �ο�
grant role_test01 to it04; -- it04����ڿ��� role_test01 ������ �ο�

����� �� ������ ������ ����ڿ��� �� ������ Ȯ��
select * from role_sys_privs where role = '����� ���� �� �̸�';

����� �� ������ �ο����� ����ڿ��� �ο����� �� ������ Ȯ��
select * from user_role_privs; -- �� ���� Ȯ��
select * from session_privs; -- �� ���� �ȿ� �ִ� ���� Ȯ��

7-2. ����� �� ���� ����
- �� ����ڰ� �� ������ �����Ϸ���, �� ����ڴ� dba ������ �־�� �Ѵ�.

drop role '����� ���� �� �̸�';
- ������ ����ڴ� dba�̾�� ��.
- �� ������ �����ϸ�, �� ������ �ο����� ���̺����� �� ������ ������.

����) ezen01 ����ڿ��� �ڽ��� dept01 ���̺��� �˻��� �� �ִ� �� ������ 
role_select_dept01�� �����ϰ� it04 ����ڿ��� �� ������ �ο��Ͽ� Ȯ���Ͻÿ�.
create role role_select_dept01;
grant select on ezen01.dept01 to role_select_dept01;

-- �ѿ� �ο��� ���̺� ���� ���� ���� Ȯ��
ex)
select * form role_tab_privs where role like '%DEPT01';



--------------------------------
���� ���� �ϴ� ���
alter user it04 default tablespace users quota unlimited on users;
*/

select * from role_sys_privs;
select * from role_tab_privs where role like '%DEPT01';


/*
< ���Ǿ� > synonym
1. ���Ǿ�
- �����ͺ��̽� ��ü�� ���� ��Ī

2. ���Ǿ��� ����
- ���� ���Ǿ�: ���� ����ڸ� ������� �ϴ� ���Ǿ�, ��ü�� ���� ������ �ο����� ����ڰ� 
�����ϰ�, �ش� ����ڸ� ����� �� ����.
- ���� ���Ǿ�: ��ü ����ڸ� ������� �ϴ� ���Ǿ�, dba ������ ���� ����ڸ� 
������ �� ����. ������ �ִ� ����ڰ� ������ ���Ǿ ������ ����� ������.


*/

