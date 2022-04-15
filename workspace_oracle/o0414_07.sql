-- 2022/04/14 (��) 7���� ����

--
-- 2. ������ ���� : update ���̺�� set ������ �ʵ�� �� where ����
-- 2-1. dept01 ���̺��� 10�� �μ��� �μ����� 'PROGRAMMING'���� �����Ͻÿ�
update dept01
set dname = 'PROGRAMMING'
where dno=10;

select * from dept01;
commit;

-- 2-2. dept01 ���̺��� 20�� �μ��� �μ����� 'MARCKETING', 
-- �������� 'TEXAS'�� �����Ͻÿ�
update dept01
set dname='MARCKETING', loc='TEXAS'
where dno=20;

select * from dept01;
commit;

-- 2-3. where �����ϸ� ��� �������� ������ ����ȴ�.
update dept01
set dname = 'TF';

select * from dept01;
commit;

-- 2-4. set�������� ���������� ��� ����
update dept01
set dname = (select dname from department where dno = 30)
where dno =30;

select * from dept01;
commit;

-- 2-5. set������ ���������� �������� ��밡��
-- dept01 ���̺��� 20�� �μ��� �μ���� �������� department ���̺���
-- 20�� �μ��� �μ���� ���������� �����Ͻÿ�.
update dept01
set dname = (select dname from department where dno = 20), 
loc = (select loc from department where dno = 20)
where dno = 30;
-- �̷��Ե� �ۼ�����
update dept01
set (dname, loc) = (select dname, loc from department where dno=20)
where dno = 30;

select * from dept01;
commit;

-- 3. ������ ����
-- delete from ���̺�� where ����

-- 3-1. dept01 ���̺��� �μ���ȣ 40�� �����͸� �����Ͻÿ�.
delete dept01
where dno = 40;

select * from dept01;
commit;

-- 3-2. where ������ ���������� ���
-- dept01 ���̺��� department ���̺��� 'SALES'�μ��� �ش��ϴ� �μ���ȣ�� �����Ͻÿ�.
delete from dept01
where dno in (select dno from department where dname = 'SALES');

select * from department;
select * from dept01;
commit;

-- 3-3. where ���� �����ϸ� ��� �����͸� ����
delete from dept01;

select * from dept01;
commit;

--------------------

/*
Ʈ������(transaction)
- ������ ó��(�߰�, ����, ����)�� ������ �������� �ϳ��� �۾� ������ ó���ϴ� ��
- ex) ���� ��ü�� ��
- �� ���� ���̿��� ������ �ݾ��� ��ü�Ϸ���, ��� �ݾװ� �Ա� �ݾ��� �����ؾ���
- �� �ΰ��� �۾��� �ݵ�� �Բ� ó���ǰų�, ��ҵǾ�� ��
- ���࿡ ����� �Ǿ�����, �Ա��� ���� �ʾҴٸ� �������� �ϰ����� �������� ���ϹǷ�,
�̷� ���� �߻��ϸ� �ȵȴ�.
- �̷��� ������ ���� ���ؼ� Ʈ����� ó���� �Ѵ�.
- ALL or Nothing
- �������� �۾��� �ϳ��� ������ �۾��� �̷�� ���� �� ��δ� ����ǰų�,
�߰��� ������ ������ ���� �ƿ� ��ü�� ����ϴ� ���� ����

sql���� Ʈ�������� ó���ϴ� ���
- commit, rollback
*/

insert into dept01 select * from department;
commit; -- Ȯ��

delete from dept01 where dno=40;
select * from dept01;
rollback;
select * from dept01;

-----------------
/*
-- �ڡڡڡڡ�
-- �������� (constraint)
-- ������ ���Ἲ �������� (Data Intergrity Constraint)
-- ���̺� ��ȿ���� ����(��������) �����Ͱ� �ԷµǴ� ���� �����ϱ� ���ؼ� 
-- ���̺��� ������ �� �� �÷��� �����ϴ� ���� ������ ��Ģ(��������)�� ���ϴ� ��
-- �����͸� �߰�/����/������ �� ���ǵ� ���������� �����

-- ���������� ����
1. not null : �÷��� null�� �������� �ʵ��� �ϴ� ��������
2. unique : �÷��� ������ ���� ������ �ϴ� ��������, null�� ������ ������ ����
3. primary key : �⺻Ű, ��Ű, PK, not null�� unique ���������� ��� �����ϴ� ��������
- �ٸ� ��� ���еǴ� ������ Ű�鼭 not null�� �����͸� �Է��ϵ��� �ϴ� ��������
4. foreign key : �ܷ�Ű, FK
5. check : �÷��� ���� Ư���� ������ ���� �������� �ϴ� ��������

#. default : �ƹ��� ���� �Է����� �ʾ��� �� ����Ʈ�� ������ ���� �Է�

< foreign key�� ���� ���Ἲ >
1.���� ���Ἲ
- �ڽ� ���̺��� �θ� ���̺� ������ ��,
- �ڽ� ���̺��� �÷��� ���� �Է��� ��, �θ� ���̺� ���� �÷��� ���� �Է����� ���ϵ��� ���������� �����ϴ� ��.

2. foreign key, �ܷ�Ű, FK
- ���� ���Ἲ�� ������Ű�� ���� �ڽ� ���̺��� �÷��� �����ϴ� ��������
- foreign key�� �����ϴ� �θ� ���̺��� �÷��� �ݵ�� primary key�� ���� �Ǿ���Ѵ�.

ex)
- employee ���̺��� department ���̺��� �����ϰ� ����
- ������ �ϰ� �ִ� employee ���̺�: �ڽ� ���̺�, ������ ���ϴ�(���ִ�) department ���̺�: �θ����̺�
- employee ���̺��� dno �÷��� department ���̺��� dno�� �����Ͽ� ����ؾ� ��.
- employee ���̺� �����͸� �Է��� �� dno �÷��� ���� department ���̺��� dno���� �����ؾ� �ϰ�
- department ���̺� ���� dno�� ���� �Է����� ���ϵ��� ���������� �����ϴ� ��
*/

-- <���̺� ���� (�������� ����)>
-- 1. ���̺� ���� 1�� ��� : �÷� ������ ���̺� ����
create table dept01 (
dno number(2) constraint dept01_dno_pk primary key,
dname varchar2(14),
loc varchar2(13)
);

desc dept01;
-- �������� Ȯ��
select * from user_constraints;

-- 2. ���̺� ���� 2�� ��� : ���̺� ������ ���̺� ����
-- ���̺� �����δ� not null ���������� ������ �� ����.
drop table dept01;
create table dept01 (
dno number(2),
dname varchar(14),
loc varchar2(13),
constraint dept01_dno_pk primary key(dno)
);

desc dept01;
select * from user_constraints;
select owner, table_name, constraint_name, constraint_type,
status from user_constraints;

select owner, table_name, constraint_name, constraint_type,
status from user_constraints
where table_name = 'DEPT01';
-- ����Ŭ������ �빮�ڷ� ����.

-- 1. not null ��������
-- not null ���������� �÷� �����θ� ������ �� ����, ���̺� �����δ� �����Ұ�

create table dept02 (
dno number(2) not null,
dname varchar2(14) not null,
loc varchar2(13) not null
);

desc dept02;
select * from user_constraints where table_name = 'DEPT02';

-- ������ �Է�: not null �������� Ȯ��
insert into dept02(dno, dname) values(10, 'ACCOUNTING');
-- > ���� �߻� : ORA-01400: cannot insert NULL into ("EZEN01"."DEPT02"."LOC")

insert into dept02(dno, dname) values(10, 'ACCOUNTING', null);
-- > �����߻�

insert into dept02(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
-- > ������ �߰� ����

select * from dept02;
commit;

-- 2. unique ��������
create table dept03 (
dno number(2) unique,
dname varchar2(14) not null,
loc varchar2(13)not null
);

desc dept03;
select * from user_constraints where table_name = 'DEPT03';

-- ������ �߰�: unique �������� Ȯ��
insert into dept03(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept03;
insert into dept03(dno, dname, loc) values(10, 'MARCKETING', 'LA');
-- > �����߻� : ORA-00001: unique constraint (EZEN01.SYS_C007035) violated

insert into dept03(dno, dname, loc) values(20, 'MARCKETING', 'LA');
-- > �߰� ����

select * from dept03;
commit;

insert into dept03(dno, dname, loc) values(null, 'TF', 'SEATLE');
-- �߰� ����
select * from dept03;
commit;

insert into dept03(dno, dname, loc) values (null, 'IT', 'San Fracisco');
-- > �߰� ���� : ��� null�� unique�� ������ �Ǵ�
select * from dept03;
commit;

-- 3. check ��������
-- salary �÷��� �����͸� �Է��� �� �ݵ�� 3000~5000 ������ ������ �Է°����ϵ��� ����
create table emp01 (
eno number(4) primary key,
ename varchar2(10) not null,
job varchar2(9) not null,
salary number(7, 2) constraint emp01_salary_ck check(salary between 3000 and 5000)
);

desc emp01;
select * from user_constraints where table_name = 'EMP01';

-- ������ �߰� : salary �÷��� check �������� Ȯ��
insert into emp01(eno, ename, job, salary) values(1001, 'TOM', 'ACTOR', 5001);
-- > �����߻� : ORA-02290: check constraint (EZEN01.EMP01_SALARY_CK) violated

insert into emp01(eno, ename, job, salary) values(1001, 'TOM', 'ACTOR', 5000);
-- �߰� ����
select * from emp01;
commit;

-- 4. defalut ��
create table emp02 (
eno number(4) primary key,
ename varchar2(10) not null,
job varchar2(9) not null,
salary number(7, 2) default 3000
);

desc emp02;
select * from user_constraints where table_name = 'EMP02'; -- default�� Ȯ�� �Ұ�
select * from user_tab_columns where table_name = 'EMP02'; -- default�� Ȯ�� ����
select table_name, column_name, data_default from user_tab_columns where table_name = 'EMP02';

-- ������ �߰� : default�� Ȯ��
insert into emp02(eno, ename, job) values(1001, 'Sandra', 'ACTRESS');
select * from emp02;
commit;

-- 5. primary key ��������
select * from user_constraints where table_name = 'DEPT01';

-- ������ �߰�: primary key Ȯ��
insert into dept01(dno, dname, loc) values(10, 'A', 'Seoul');
select * from dept01;
commit;

insert into dept01(dno, dname, loc) values(10, 'B', 'Busan');
-- > ���� : ORA-00001: unique constraint (EZEN01.DEPT01_DNO_PK) violated

insert into dept01(dname, loc) values('B', 'Busan');
--> ���� : ORA-01400: cannot insert NULL into ("EZEN01"."DEPT01"."DNO")

insert into dept01(dno, dname, loc) values(20, 'B', 'Busan');
-- �߰� ����, dno�÷��� ���� null�� �ƴϰ�, ������ ���� �� �Է� ����

----------------------
-- ���������� �����Ͽ� employee ���̺�� department ���̺� ����
-- employee ���̺��� department ���̺��� ������
-- department: �θ� ���̺�
-- employee: �ڽ� ���̺�


-- ���̺� ����: dept01, �θ� ���̺�
create table dept01 (
dno number(2) constraint dep01_dno_pk primary key,
dname varchar2(14) constraint dep01_dname_nn not null,
loc varchar2(13) constraint dept01_loc_nn not null
);

-- ���̺� ����: emp01, �ڽ� ���̺�
create table emp01 (
eno number(4) constraint emp01_eno_pk primary key,
ename varchar2(10) constraint emp01_ename_nn not null,
job varchar2(9) constraint emp01_job_nn not null,
manager number(4),
hiredate date constraint emp01_hiredate_nn not null,
salary number(7, 2) constraint emp01_salary_nn not null,
commission number(7, 2),
dno number(2) constraint emp01_dno_nn not null constraint emp01_dno_fk references dept01
);

-- ���̺��� ������ �������� Ȯ��
desc dept01;
select * from user_constraints where table_name = 'DEPT01';

desc emp01;
select * from user_constraints where table_name = 'EMP01';

-- dept01 ���̺� ������ �Է�
insert into dept01 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH', 'DALLAS');
insert into dept01 values(30, 'SALES', 'CHICAGO');
insert into dept01 values(40, 'OPERATIONS', 'BOSTON');
commit;

-- �ڽ� ���̺��� emp01 ���̺� ������ �Է�: ���� ���Ἲ Ȯ��
insert into emp01 values(1001, 'TOM', 'ACTOR', 9000, 
to_date('2015.04.14', 'yyyy.mm.dd'), 3000, null, 40);
-- �߰� ����: ���� ���Ἲ�� ������� ����
select * from emp01;
commit;

insert into emp01 values(1002, 'JULIA', 'ACTRESS', null, 
to_date('2017,7,17', 'yyyy,mm,dd'), 2500, null, 50);
--> ����:ORA-02291: integrity constraint (EZEN01.EMP01_DNO_FK) violated - parent key not found
-- ���� ���Ἲ �����, �θ� ���̺��� �÷� dno�� �������� �ʴ� ���� �ڽ� ���̺� �߰� �� �� ����.

--> ���� ���� ���Ἲ ���� ������ �ذ��ϴ� ���
-- 1. emp01 ���̺��� dno �÷��� ���� 10, 20, 30, 40 �� �ϳ��� �ٲ۴�.
-- 2. emp01 ���̺��� ���� ���Ἲ�� �����Ѵ�. (���������� ����)
-- 3. �θ� ���̺��� dept01 ���̺� dno�� 50���� ���� �ִ´�.

-- 3�� ���
insert into dept01 values(50, 'IT', 'SEOUL');
select * from dept01;
commit;

insert into emp01 values(1002, 'JULIA', 'ACTRESS', null, 
to_date('2017,7,17', 'yyyy,mm,dd'), 2500, null, 50);
select * from emp01;
commit;

-----------------------
-- < ���̺� ���� ���� > ���������� �߰� / ���� / ����
-- ���̺��� �����ؼ� �����ϸ� ���������� ������� �ʴ´�.
create table emp02 as select * from employee;
create table dept02 as select * from department;

desc dept02;
select * from dept02;
select * from user_constraints where table_name = 'DEPT02';

desc emp02;
select * from emp02;
select * from user_constraints where table_name = 'EMP02';

-- constraint_type - P: Primary Key, R: Forign Key, U: Unique, C: Not Null, Check

-- 1. ���������� �߰� : �θ� ���̺��� �������Ǻ��� �߰��ϰ�, �ڽ� ���̺��� ���������� �߰��ؾ� ��

-- 1-1. add ������� �߰��ϴ� ���, 
-- ����) null, not null ���������� ������� �ʴ´�.
-- �θ� ���̺� : dept02 ���̺��� dno �÷��� Primary Key�� �߰���
alter table dept02 add constraint dept02_dno_pk Primary Key(dno);

select * from user_constraints where table_name = 'DEPT02';

-- �ڽ� ���̺� : emp02 ���̺��� eno �÷��� primary key�� �߰���,
-- dno �÷��� foreign key �� �߰���.
alter table emp02 add constraint emp02_eno_pk primary key(eno);
select * from user_constraints where table_name = 'EMP02';
alter table emp02 add constraint emp02_dno_fk foreign key(dno) references dept02(dno);
select * from user_constraints where table_name = 'EMP02';


-- 1-2. modify ������� �߰��ϴ� ���(����)
-- ����) ���� ����, null, not null �������� ���浵 �����ϴ�.
-- �θ� ���̺� : dept02 ���̺��� dno �������� primary key�� �߰���
alter table dept02 modify dno constraint dept02_dno_pk primary key;
select * from user_constraints where table_name = 'DEPT02';
-- �ڽ� ���̺� : emp02 ���̺��� eno �÷��� primary key�� �߰���, 
-- dno �÷��� forign key�� �߰���.
alter table emp02 modify eno constraint emp02_eno_pk primary key;
select * from user_constraints where table_name = 'EMP02';
alter table emp02 modify dno constraint emp02_eno_fk references dept02;




-- ���� ���Ἲ �׽�Ʈ
select * from dept02;
insert into emp02 values(9000, 'KIM', 'DOCTOR',
null, to_date('2020.10.12', 'yyyy,mm,dd'), 5000, null, 40);
select * from emp02;
commit;
insert into emp02 values(9100, 'LEE', 'TEACHER', null,
to_date('2021,7,17','yyyy,mm,dd'), 4000, null, 50);
-- ���� ���Ἲ�� ����
--> ����: ORA-02291: integrity constraint (EZEN01.EMP02_DNO_FK) violated - parent key not found

-- 2. ���������� ����
-- emp02 ���̺��� ename �÷��� ���������� not null�� ����
alter table emp02 modify ename constraint emp02_ename_nn not null;
select * from user_constraints where table_name = 'EMP02';

-- emp02 ���̺��� commission �÷��� ���������� not null�� ����
alter table emp02 modify commission constraint emp02_commission_nn not null;
-- ����, commission �÷��� null���� �̹� �����϶����� ������ �ٲܼ� ����.

-- 3. ���������� ����
-- emp02 ���̺��� ename �÷��� not null ���������� ����
-- 3-1. ���������� �̸����� ����
alter table emp02 drop constraint emp02_ename_nn;
select * from user_constraints where table_name = 'EMP02';

-- 3-2. ������������ ����
-- emp02 ���̺��� pk�� fk�� ����
alter table emp02 drop primary key;
select * from user_constraints where table_name = 'EMP02';
alter table emp02 drop constraint emp02_eno_fk;
select * from user_constraints where table_name = 'EMP02';

-- dept02 ���̺��� pk�� ����
alter table dept02 drop constraint dept02_dno_pk;
select * from user_constraints where table_name = 'DEPT02';

-- 3-3. ���� ����(�θ� �ڽ� ���� ����)�� ��� �����ϴ� ���
alter table dept02 drop primary key cascade;


--------------------

select * from user_constraints where table_name in ('EMP02', 'DEPT02');
select * from user_constraints where table_name in ('EMP01', 'DEPT01');
-- 4. ���������� Ȱ��ȭ/ ��Ȱ��ȭ(enable, desable)
-- emp02 ���̺��� eno �÷��� Primary key ���������� ��Ȱ��ȭ(disable)
alter table emp02 disable constraint emp02_eno_pk;
select * from user_constraints where table_name = 'EMP02';

select * from emp02;
desc emp02;

-- eno �÷��� PK �������� ��Ȱ��ȭ ���� eno �÷��� �̹� �����ϴ� ������ ���� Ȯ��
insert into emp02(eno) values(9000);
select * from emp02;
commit;

-- 4-2. emp02 ���̺��� eno �÷��� disable(��Ȱ��ȭ)���� enable(Ȱ��ȭ)�� ����
alter table emp02 enable constraint emp02_eno_pk;
--> ����: PK ���������� Ȱ��ȭ�Ϸ���, �ߺ����� null���� �����ϰ� �ؾ���.
/*
���� ���� -
ORA-02437: cannot validate (EZEN01.EMP02_ENO_PK) - primary key violated
02437. 00000 -  "cannot validate (%s.%s) - primary key violated"
*Cause:    attempted to validate a primary key with duplicate values or null
           values.
*Action:   remove the duplicates and null values before enabling a primary
           key.
*/

-- �ߺ����� null���� ����
delete from emp02 where eno = 9000 and ename is null;
delete from emp02 where eno is null;
select * from emp02;

-- �ߺ����� null���� ����
alter table emp02 enable constraint emp02_eno_pk;
select table_name, constraint_name, constraint_type, status 
from user_constraints where table_name = 'EMP02';

-- �ߺ����� ���� -> pk ���������� Ȱ��ȭ �Ͽ����Ƿ� �Ұ���
insert into emp02(eno) values (9000);

insert into emp02(eno) values (null);











