-- 2022/04/13


/*
����1) 10�� �μ��� ���ϴ� ����� �μ���ȣ, ����, �������� ����Ͻÿ�.

����2) ������ 'ANALYST'�� ����� ���, �����, ����, �μ���ȣ, �μ���, �������� ���

����3) 'SCOTT'�� ������ �μ����� �ٹ��ϴ� ����� �����, �μ���ȣ, �μ���, 'SCOTT'�� �����ϰ� ���

����4) 'WARD'������� �ʰ� �Ի��� ����� �����, �Ի����� ����Ͻÿ�.

����5) �����ں��� ���� �Ի��� ����� �����, ����� �Ի���, �����ڸ�, �������� �Ի����� ���

< �������� ���� >
����6) ����� 7499�� ������� �޿��� ���� ����� ���, �����, ����, �޿��� ����Ͻÿ�.

����7) 'BLAKE'�� ������ �μ����� �ٹ��ϴ� ����� ������ �Ի���, �μ���ȣ�� ���

����8) �޿��� ��ձ޿����� ���� ����� ���, �����, �޿��� ���
*/

-- ���� 1
select e.dno, job, loc
from employee e, department d 
where e.dno = d.dno
and e.dno = 10;

-- ���� 2
select eno, ename, job, e.dno, dname, loc
from employee e, department d
where e.dno = d.dno
and job = 'ANALYST';

-- ���� 3
select s.ename, o.dno, o.job, o.ename
from employee s, employee o
where s.dno = o.dno
and s.ename = 'SCOTT'
and o.ename <> 'SCOTT';

-- ���� 4
select o.ename, o.hiredate
from employee w, employee o
where w.ename = 'WARD'
and o.hiredate > w.hiredate
order by hiredate desc;

-- ���� 5
select e.ename, e.hiredate, m.ename, m.hiredate
from employee e, employee m
where e.manager = m.eno
and e.hiredate < m.hiredate;

-- ���� 6
select eno, ename, job, salary
from employee
where salary > (select salary from employee where eno = 7499);

-- ���� 7
select ename, hiredate, dno 
from employee
where dno = (select dno from employee where ename = 'BLAKE');

-- ���� 8
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee);


/*
���� ������ ����
1. ������ �������� - ���������� ����� �� 1���� ��
- ���������� ����� 1���� ���� ��
- =, <>, >, >=, <, <=

2. ������ �������� - ���������� ����� 1�� �̻��� ��
- ���������� ����� 2�� �̻��� ��
- in, any(some), all

- in(any) : ���������� ����� ���������� �� ���� ��ġ�Ѵٸ� ���
- any : ���������� ���� ��� �߿��� ���������� �Ѱ��� ���Ǹ� �����ص� ���
- < any : ���������� �ִ밪���� ���� ���� ��� 
- > any : ���������� �ּҰ����� ū ���� ���
- all : ���������� ���� ����� ���������� ��� �����ؾ� ���
- < all : ���������� �ּҰ����� ���� ���� ���
- > all : ���������� �ִ񰪺��� ū ���� ���
*/

-- ����5) �μ��� �ּұ޿��� �޴� ����� ����� �����, �μ���ȣ, �ּұ޿��� ���Ͻÿ�.
-- �ذ�ð�: 3��
-- single-row subquery returns more than one row
-- ������ ���������� ������ ���������� Ǯ� �߻��ϴ� ����
select eno, ename, dno, salary from employee
where salary in (select min(salary) from employee group by dno);

-- ����6) ������ 'SALESMAN'�� �ƴϸ鼭 , 'SALESMAN'���� ���� �޿��� �޴� �����
-- ���, �����, ����, �޿��� ����Ͻÿ�.
-- ��������: 'SALESMAN'�� �޿� -> 4�� -> ������ ��������
select eno, ename, job, salary
from employee
where job <> 'SALESMAN'
and salary < any (select salary from employee where job = 'SALESMAN');

-- ����7) ��� 'SALESMAN' �޿����� ���� �޿��� �޴� ����� ���, �����, ����, �޿��� ���
select eno, ename, job, salary
from employee
where salary < all (select salary from employee where job = 'SALESMAN')
and job <> 'SALESMAN';

-- < ������ �������� Ȯ�� �н� >
-- Ȯ�ι���1) ����� 'K'�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� ���, �����, �μ���ȣ ���
select eno, ename, dno
from employee
where dno in (select dno from employee where ename like '%K%');

-- Ȯ�ι���2) ������ 'ANALYST'�� ����� �Ҽӵ� �μ��� ���� �μ����� �ٹ��ϴ� ����� �μ���ȣ, �����, ����
select dno, ename, job
from employee
where dno in (select dno from employee where job = 'ANALYST');

-- Ȯ�ι���3) ��ձ޿����� ���� �޿��� �ް�, ����� 'M'�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� ���, �����, �޿� ���
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
and dno in (select dno from employee where ename like '%M%');

-- < ������ �������� Ȯ�� �н� >
-- Ȯ�ι���4) ��ձ޿��� ���� ���� ������ ���
select job, round(avg(salary), 2) from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

-- Ȯ�ι���5) �μ���ġ�� 'DALLAS'�� ����� �����, �μ���ȣ, ������ ���
select ename, e.dno, job, loc
from employee e, department d
where e.dno = d.dno
and loc = 'DALLAS';

-- Ȯ�ι���6) 'RESEARCH' �μ����� �ٹ��ϴ� ����� �μ���ȣ, �����, ������ ���
select dno, ename, job
from employee
where dno = (select dno from department where dname = 'RESEARCH');

-----------------
-- < ���̺� ����/��������/���� > : DDL(������ ������)
/*
���̺���� ����� ���
1. ��빮�ڴ� ���� ��ҹ���, ����, ����(_, $, #)�� ��밡��, $�� #�� �����ϴ°� ����
2. ���۹��ڴ� ���� ��ҹ��ڷ� �����ϰ�, 30�� �̳��� �ۼ�
3. ������ �ߺ����� �ʵ��� ����
4. ��ҹ��ڸ� ���������� ����
*/
-- 1. ���̺� ����
create table dept (
dno number(2),
dname varchar(2),
loc varchar2(13)
);
desc dept;
select * from dept;

-- 2. ���̺� ���� ���
-- 2-1. ���̺� ���� ��� 1�� : ���̺��� ��� ������ ��� �����͸� ��� ����, 
-- ���Ἲ ���������� ������� ���� (�⺻Ű�� �ܷ�Ű)
create table dept_second
as select * from department;

desc dept_second;
select * from department;

-- 2-2. ���̺� ���� ��� 2 : ���̺��� Ư�� �÷�(�ʵ�)�� ��� �����͸� ����
create table emp02
as select eno, ename, job, salary from employee;
desc emp02;
select * from emp02;

-- 2-3. ���̺� ���� ��� 3 : ���̺��� ���� �÷��� �˸��ƽ��� ����Ͽ� �����ؾ���
create table emp03
as select eno, ename, salary, salary*12 annual_salary from employee;
desc emp03;
select * from emp03;

-- 2-4. ���̺� ���� ��� 4 :���̺� ���ǿ� ���� Ư�� �����͸� �����Ͽ� ����
create table emp04
as select * from employee where job = 'SALESMAN';
desc emp04;
select * from emp04;

-- 2-5. ���̺� ���� ��� 5 : ���ǽĿ� �´� �����Ͱ� �����Ƿ� ���̺��� ������ �����Ѵ�.
create table emp05
as select * from employee where 0 = 1;
desc emp05;
select * from emp05;

-- 3. ���̺��� ������ �����ϴ� ���
-- �÷� �߰�, �÷� ����, �÷��� ����, �÷��� Ÿ�� ����
-- alter table ���̺��~
-- 3-1. �÷� �߰�, emp02 ���̺� birthday (dateŸ��)
-- add ������� ��ȣ �ȿ� �÷���� Ÿ���� �����ϸ� ��, ���� ���� ����
desc emp02;
alter table emp02 add(birthday date);
desc emp02;
alter table emp02 add(sex char(1), hobby varchar2(30));
desc emp02;

-- 3-2. �÷��� ����
-- emp02 ���̺��� birthday�� b_day�� ����
-- rename ���� ���
alter table emp02 rename column birthday to b_day;
desc emp02;

-- 3-3. �÷��� Ÿ�� ���� 
-- ex) emp02 ���̺��� sex�� Ÿ���� varchar(6)���� ����
alter table emp02 modify sex varchar(6);
desc emp02;

alter table emp02 modify (ename varchar2(20), job varchar2(18));
desc emp02;

-- 3-4. �÷��� ����
-- ex) emp02���̺��� hobby �÷��� ����
alter table emp02 drop column hobby;
desc emp02;

-- 4. ���̺��� ����
select * from tab;
drop table dept_second;
select * from tab;

-- 5. ���̺�� ����
-- ex) emp03���̺��� �̸��� emp_copy�� ����
rename emp03 to emp_copy;
select * from tab;

-- 6. ���̺��� ��� �����͸� ���� ( ���̺��� ������ ����)
-- ex) emp02�� ��� �����͸� ����
-- 6-1 truncate ��� > DDL (������ ���Ǿ�)
select * from emp02;
truncate table emp02;
desc emp02;
select * from emp02;

-- 6-2. delete ��� - DML(������ ���۾�)
select * from emp04;
delete from emp04;
desc emp04;
select * from emp04;

/*
������ ���� (data dictionary) - ����Ŭ������ �����ϴ� ���
- ����ڰ� �����ͺ��̽��� �ڿ��� ȿ�������� ������ �� �ֵ��� �پ��� ������
�����ϴ� �ý��� ���̺��� ����
- ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ� ���� �۾��� �� �� �����ͺ��̽� ������ ���ؼ�
�ڵ����� ���ŵǴ� ���̺�
- ����ڴ� ������ ������ ������ �����ϰų� ������ �� ����,
����ڴ� ������ ������ ������ Ȯ�θ� ����
- ������ ������ �б� ���� �� ���·� ������.

������ ������ ���� - ���ξ ����
user_ : �ڽ��� ������ ������ ��ü�� ������ Ȯ��
all_ : �ڽ��� ���� �Ǵ� ������ �ο����� ��ü�� ������ Ȯ��
dba_ : �����ͺ��̽� �����ڰ� ���� ������ ��ü�� ������ Ȯ��

user_tables : �ڽ��� ������ ������ ���̺��� ������ Ȯ��
user_sequences : �ڽ��� ������ ������ �������� ������ Ȯ��
user_indexes : �ڽ��� ������ ������ �ε����� ������ Ȯ��
user_views : �ڽ��� ������ ������ ���� ������ Ȯ��

all_tables : ��ü �����(�ڽ��� ������ ������ �ο����� ��ü)�� ����� ���̺��� ���� Ȯ��
dba_tables : �︮�ڰ� ���ٰ����� ���̺��� ������ Ȯ��

*/

select * from user_tables;
select table_name from user_tables;
select * from tab;

select * from all_tables;
select * from dba_tables;

/*
���̺� ������ �߰�/ ������ ����/ ������ ���� -> DML(������ ���۾�)
DML - insert, update, delete, select 
CRUD - create(insert), read(select), update, delete
*/

-- 1. ������ �߰�, insert into ���̺�� ~

-- 
select * from tab;
-- 1-1. ������ �߰� 1��
-- ���̺� ����
create table dept01 (
dno number(2),
dname varchar(14),
loc varchar2(13)
);
desc dept01;
select * from dept01;
-- ������ �߰� / insert into~ ���̺��(�÷���..) value(��..) ;
insert into dept01(dno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- 1-2. ������ �߰� 4�� : �÷����� �����ϸ�, ��� �÷��� ���� ���� ���� ������� ������
insert into dept01 values(40, 'OPERATIONS', 'BOSTON');
select * from dept01;
commit;

-- 1-3. ������ �߰� 3�� : �÷����� ����ϸ�, ���� ������ �÷����� ������ ������ �ȴ�.
insert into dept01(loc, dno, dname) values('CHICAGO', 30, 'SALES');
select * from dept01;
commit;

-- 1-4. ������ �߰� 2�� : null�� �÷��� �����ϰ� ���� �߰�
-- (not null�� �÷��� �ݵ�� ����ؾ���)
insert into dept01(dno) values(20);
select * from dept01;
commit; -- Ȯ��

-- 1-5. ������ �߰� 5�� : ��������� null�� ����
insert into dept01(dno, dname, loc) values (50, null, null);
select * from dept01;
commit;

-- 1-6. ������ �߰� 6�� : ��������� ���ڿ��� ���� ���ڿ��� nul�� �ν� 
insert into dept01(dno, dname, loc) values(60, '', '');
select * from dept01;
commit;

-- 1-7. ������ �߰� 7�� :
truncate table dept01;
select * from dept01;

-- ���̺��� ������ �����Ͽ� �߰�.
insert into dept01 select * from department;
--insert into dept01(dno, dname, loc) select dno, dname, loc from department;
select * from dept01;


/*
< Ȯ�� �н� >
����1) employee ���̺��� �����ʹ� �������� �ʰ�, ������ �����Ͽ� emp01
���̺��� �����Ͻÿ�.
����2) emp01 ���̺� �����͸� 5���� �߰��Ͽ� Ȯ���Ϥӿ�. (employee ���̺� ����)
*/

create table emp01 
as select * from employee where 0=1;

desc emp01;
select * from emp01;

insert into emp01 values(7369, 'SMITH', 'CLERK', 7902, 
to_date('1980.12.17', 'yyyy.MM.DD'), 800, null, 20);
select * from emp01;
commit;

truncate table emp01;
insert into emp01 select * from employee;
commit;
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














