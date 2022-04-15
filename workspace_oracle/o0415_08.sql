
-- 2022/04/15(��) 8���� ����

/*
�ڡڡ�
��(View)
- ���� ���̺�
- �ϳ� �̻��� ���̺��̳� �ٸ� �並 �̿��Ͽ� �����Ǵ� ���� ���̺�
- ���������� �����͸� �������� �ʰ�, �並 ������ �� ����� �������� �����.
- �並 ���ؼ� �����͸� �߰�/����/������ �ϸ� �䰡 ����ϴ� �⺻ ���̺� �ݿ��ǰ�,
- �⺻ ���̺��� �����͸� �߰�/����/������ �ϸ� �信�� �ݿ���

< ���� ���� >
1. �ܼ� ��(simple view): �ϳ��� �⺻ ���̺�κ��� ������ ��
- DML ������ ����� �� ����.
- �ܼ� ���� DML ����� �⺻ ���̺� �ݿ���

2. ���� ��(complex view): �ΰ� �̻��� �⺻ ���̺�κ��� ������ ��
- ���Ἲ ��������, group by ��, ǥ���� ���� ������ ���� DML ����� ���������� ����
- ���� ��� distinct, group by, �׷��Լ�, rownum�� ����� �� ����.
*/

-- employee, department ���̺��� �����Ͽ� emp01, dept01�� ����
create table emp01 as select * from employee;
create table dept01 as select * from department;

desc emp01;
select * from emp01;
desc dept01;
select * from dept01;

-- 1. ���� ����
-- ���� : create view 

-- 1-1. �ܼ� �� : �÷����� ����
create view v_emp01 (���, �����, �μ���ȣ, ����)
as select eno, ename, dno, job from emp01 where job = 'SALESMAN';
select * from v_emp01;

-- 1-2. �ܼ� �� : �÷����� �״�� ���
create view v_emp02
as select eno, ename, dno, job from emp01 where job = 'SALESMAN';

select * from v_emp02;

-- 1-3 �ܼ� ��
create view v_emp03
as select * from emp01;

select * from v_emp03;

-- 1-4. ���� �� : 2�� �̻��� ���̺�κ� ������ ��, ���� �Ǵ� �������� ���
-- ����1) emp01 ���̺�� dept01 ���̺��� ������ ��
create view v_emp04
as select * from emp01 natural join dept01;

select * from v_emp04;

-- ����) emp01, dept01 ���̺�κ��� ���, �����, ����, �μ���ȣ, �μ���, ��������
-- �����ִ� �並 ���� �Ͻÿ�.
create view v_emp05(���, �����, ����, �μ���ȣ, �μ���, ������)
as select eno, ename, job, e.dno, dname, loc from emp01 e join dept01 d 
on e.dno = d.dno;

select * from v_emp05;

-- ����3) emp01, dept01 ���̺�κ��� ���, �����, ����, ����, �μ���ȣ, �μ�����
-- �Ի����� 1981���� ����� ������ �����ִ� �並 �����Ͻÿ�. (������ equi join�� ���)
create view v_emp06(���, �����, ����, ����, �μ���ȣ, �μ���, �Ի���)
as select eno, ename, job, salary, e.dno, dname, hiredate
from emp01 e, dept01 d
where e.dno = d.dno
and substr(hiredate, 1, 2) = 81;
drop view v_emp06;

select * from v_emp06;

-- ������ ������ ���� ���� ���θ� Ȯ��
select * from user_views;

/*
< �並 ����ϴ� ���� >
1. ���� - �並 ����Ͽ� �߿��� �������� ������ ���� �� ����
2. ����� ���Ǽ� - ����ڿ��� �ʿ��� �����͸� �����ϰ� �Ͽ� ���Ǽ��� ���� �� ����

< �並 ����� �� �����Ǵ� ��� ���� >
*/

-- 2-1. v_emp02 �信 �����͸� �߰�
--> ������: SALESMAN�� ��ȸ�ϴ� ���ε�, CLERK�� �⺻ ���̺� �Էµǰ� �ִ� ��
insert into v_emp02(eno, ename, dno, job) values(9000, 'KIM', 10, 'CLERK');
select * from v_emp02;
select * from emp01;

-- 2-2. �μ��� �����հ�, ��������� �����ִ� �並 �����Ͻÿ�.
create view v_emp_dno
as
select dno, sum(salary), avg(salary)
from emp01
group by dno;
-- > ����: ORA-00998: must name this expression with a column alias
--> �ذ�å: �並 ������ �� �׷��Լ��� �÷��� ����� ���� �˸��ƽ��� �����.

create view v_emp_dno
as
select dno, sum(salary) "sum", round(avg(salary), 2) "avg"
from emp01
group by dno;

select * from v_emp_dno;

-- v_emp_dno �信 �����͸� ���� - �Ұ���
insert into v_emp_dno values(10, 1000, 1500);
-- ����:ORA-01733: virtual column not allowed here
-- �׷��Լ��� ����� �信�� ���� ������ �� ����.

-- 3. ���� ����
-- ����: drop view �� �̸�;
select * from user_views;
drop view v_emp_dno;

-- 4. �並 ����
-- create view ���̸�: ���̸��� �ش��ϴ� �䰡 ���� ���� ���� ����, �ִٸ� ����
-- create or replace view ���̸�: ���̸��� �ش��ϴ� �䰡 ���� ���� ���� ����
-- , �ִٸ� �����ϰ� ���� ����
desc v_emp_dno;

create or replace view v_emp_dno
as
select eno, ename, job, dno from emp01;

desc v_emp_dno;

-- 4-2. ������ �並 ����: �並 ������ �� ���� ��Ȳ�ӿ��� ������ �並 ����
-- 
create or replace force view v_notable
as
select * from member;
-- ����: ORA-00942: table or view does not exist
-- ���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.

select * from user_views; -- Ȯ��
desc v_notable; -- Ȯ�� �Ұ�
select * from v_notable; -- Ȯ�� �Ұ�

-- 5-1. with check option ���
-- �信�� �������� ���� �������� insert�� update�� �����ϵ��� �ϴ� 
-- emp01 ���̺�κ��� eno, ename, dno, job�� �����ִ� �並 �����Ͻÿ�.
create or replace view v_emp01
as select eno, ename, dno, job from emp01
where job = 'MANAGER';

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- �並 ���� ������ ����
-- MANAGER�� �˻��ϴ� ���̴� MANAGER�� �����ϴ� ���� �մ�
insert into v_emp01 values (9001, 'KIM', 10, 'MANAGER');
commit;
select * from v_emp01; -- �信�� Ȯ��
select * from emp01; -- �⺻ ���̺��� Ȯ��

-- �並 ���� ������ ����
-- MANAGER�� �˻��ϴ� ���ε� SALESMAN�� �����ϴ� ���� �մ����� ����
insert into v_emp01 values(9002, 'LEE', 20, 'SALESMAN');
commit;
select * from v_emp01; -- �信�� Ȯ��: ������ ����
select * from emp01; -- �⺻ ���̺��� Ȯ��: Ȯ�� ����

-- ���� ������ �ذ�: MANAGER�� �˻��ϴ� ���� �̺並 ���ؼ��� MANAGER �����͸�
-- �߰�/������ �����ϵ��� ��, ������ �ȵ�
create or replace view v_emp01
as select eno, ename, dno, job from emp01 where job = 'MANAGER'
with check option;

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- Ȯ��: 'MANAGER' �����͸� ����
insert into v_emp01 values(9003, 'CHOI', 30, 'MANAGER');
commit;
select * from v_emp01;
select * from emp01;

-- Ȯ��: 'SALESMAN' �����͸� ����
insert into v_emp01 values(9004, 'PARK', 10, 'SALESMAN');
-- ����: ORA-01402: view WITH CHECK OPTION where-clause violation

-- ������ ���� Ȯ�� : 'MANAGER' �������� �μ���ȣ 40������ ���� --> ����
update v_emp01
set dno = 40
where job = 'MANAGER';
commit;

select * from emp01;
select * from v_emp01;

-- ������ ���� Ȯ�� : 'SALESMAN' ��������9001���� ������ 'CLERK'�� ���� > �������� ����
-- 'MANAGER'�� �������� ������ ���� �Ұ�
update v_emp01
set job = 'CLERK'
where eno = 9001;
-- > 0�� �� ��(��) ������Ʈ �Ǿ����ϴ�.

select * from emp01;
select * from v_emp01;

-- ������ ���� Ȯ��: 'MANAGER' �������� 9001�� ������ ����
delete from v_emp01 where eno = 9001;
commit;

select * from emp01;
select * from v_emp01;

-- ������ ���� Ȯ�� : 'SALESMAN' �������� 9002�� ������ ����

------------
-- 5-2. with read only
-- �並 ���ؼ��� select�� �����ϰ�, insert/update/delete�� ����� �Ұ�
create or replace view v_emp01
as select eno, ename, job, dno from emp01
where job = 'MANAGER'
with read only;

desc v_emp01;
select * from v_emp01;
select * from user_views;

-- ������ ����
insert into v_emp01 values(1001, 'AAA', 10, 'MANAGER');
-- ����: ORA-42399: cannot perform a DML operation on a read-only view

-- ������ ����
update v_emp01
set ename = 'BBB'
where eno = 9001;
-- SQL ����: ORA-42399: cannot perform a DML operation on a read-only view

----------------------
/*
< ������ (Sequence) >
-- ���̺� ������ �ڵ����� �����ǰ�, ���ӵǴ� ������ ����(����)
-- ���̺��� �Ϸù�ȣ, ��ǰ��ȣ �� �����ϰ� �ڵ����� �����Ǵ� ��ȣ�� ���

< ������ ���� ���� >
create sequence ��������
start with ���� -- �����ϴ� ����
increment by ���� -- ����ġ 
minvalue ���� -- �������� �ּڰ�, �⺻���� 1
maxvalue ���� -- �ִ�, �⺻���� 10�� 27��
cycle or nocycle -- �ִ밪���� ���� �������� �� cycle�̸� �ּڰ����� �ٽ�
-- ����, nocycle�̸� ���� �߻�
cache or nocache -- �������� �����ϴ� ĳ�ð��� ����, �⺻���� 20

< nextval, currval >
- nextval: �������� ���� ���� ����
- currval: �������� ���� ���� Ȯ��

< nextval, currval�� ����� �� �ִ� ��� >
- ���������� �ƴ� select ��
- insert���� select ��
- insert���� values�� --> ���� ���� ��� (nextval)
- update���� set��

< nextval, currval�� ����� �� ���� ��� >
- view�� select�� 
- distinct �ִ� select��
- group by, having, order by���� �ִ� select��

*/

select * from user_views;
select * from user_tables;

-- < 1. ������ ���� >
-- 1���� 1�� �����ϴ� ������ ����
create sequence test01_seq start with 1 increment by 1; 

-- ������ Ȯ��
select * from user_sequences;

select test01_seq.nextval from dual; -- ���� ������ �� Ȯ��
select test01_seq.currval from dual; -- ���� ������ �� Ȯ��

-- ������ ���� emp01, dept01 ���̺� ����
create table emp01 as select * from employee where 1=0;
create table dept01 as select * from department where 1=0;

desc emp01;
select * from emp01;
desc dept01;
select * from dept01;

-- epm01 ���̺��� ����� ������ ����
-- ����� 1001������ 1�� �����ϴ� �������� �����Ͽ�, ��� ���̺� ����
create sequence emp01_seq start with 1001 increment by 1;

-- emp01 ���̺� �����͸� �߰��� �� �������� ���
insert into emp01(eno, ename) values(emp01_seq.nextval, 'person1');
commit;
select * from emp01;

-- dept01 ���̺��� ����� ������ ����
-- �μ���ȣ�� 10������ 10�� �����ϴ� �������� �����Ͽ�, �μ� ���̺� ����
create sequence dept01_seq start with 10 increment by 10;

-- dept01 ���̺� �����͸� �߰��� �� �������� ���
insert into dept01(dno, dname, loc) values(dept01_seq.nextval, 'P3', 'L3');
commit;
select * from dept01;

select * from user_sequences;

-- < 2. ������ ���� >
-- start with�� ���� �Ұ�: ������ ��ȣ ������ ����Ǳ� ����
alter sequence emp01_seq increment by 10;
select * from user_sequences;

insert into emp01(eno, ename) values(emp01_seq.nextval, 'TOM');
commit;
select * from emp01;

alter sequence dept01_seq maxvalue 100;
select * from user_sequences;

insert into dept01(dno, dname, loc) values(dept01_seq.nextval, 'P9', 'L9');
commit;
select * from dept01;

select dept01_seq.currval from dual;

-- < 3. ������ ���� >
drop sequence emp01_seq;
select * from user_sequences;

------------
/*
< �ε��� (index) >
- �˻� �ӵ��� ����� ���ؼ� ����ϴ� ����
- ���� �ε����� ������ ���� �ְ�, ������ ���Ἲ�� Ȯ���� ���� ���÷� ����ϴ� �⺻Ű�� �ε�����
�ڵ����� ���� 
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











