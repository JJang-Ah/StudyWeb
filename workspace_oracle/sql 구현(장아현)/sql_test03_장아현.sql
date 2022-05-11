-- ����1 --
create table emp03
as select * from employee;
alter table emp03 add constraint emp03_eno_pk primary key(eno);
select * from user_constraints where table_name = 'EMP03';

-- ����2 --
create table dept03
as select * from department;
alter table dept03 add constraint dept03_dno_pk primary key(dno);
select * from user_constraints where table_name = 'DEPT03';

-- ����3 --
alter table emp03 add constraint emp03_dno_fk 
foreign key(dno) references dept03(dno);
select * from user_constraints where table_name = 'EMP03';

-- ����4 --
insert into emp03(eno, ename, dno) values('7777', 'AHHYUN', '50');

-- ����5 --
alter table emp03 add constraint emp03_salary_check 
check(salary between 500 and 6000);
insert into emp03(eno, ename, salary) values('7777', 'DUBU', 100);

-- ����6 --
create view v_emp_salary 
as select * from emp03 where salary >= 2000;
select * from v_emp_salary;

-- ����7 --
create or replace view v_emp_job_check
as select * from emp03 where job = 'CLERK'
with check option;
insert into v_emp_job_check(eno, ename, job) 
values(8888, 'BADA', 'KING');

-- ����8 --
create or replace view v_emp_salary_read
as select eno, ename, job, salary from emp03 
where salary between 1000 and 2000
with read only;
insert into v_emp_salary_read(eno, ename, salary) 
values(8888, 'HAHA', 1700);

-- ����9 --
create sequence seq_dno
start with 10
increment by 10;
select * from user_sequences where sequence_name = 'SEQ_DNO';

-- ����10 --
create table dept04 as select * from department
where 1=0;
insert into dept04 values(seq_dno.nextval, 'ȸ��', '����');
insert into dept04 values(seq_dno.nextval, '����', '�λ�');
insert into dept04 values(seq_dno.nextval, '�', '�뱸');
select * from dept04;