-- 2022/04/21

/*
-- ���ν����� ����
create or replace procedure p_emp01
is
v_salary employee.salary%type;
begin
    select salary into v_salary
    from employee
    where ename = 'SCOTT';
    
    DBMS_OUTPUT.PUT_line('SCOTT ����� �޿��� ' || v_salary||'�Դϴ�.');
end;
*/

-- ���ν��� Ȯ��
select * from user_procedures; -- �̸� Ȯ��
select * from user_source; -- ���� Ȯ��

-- ���ν��� ���
execute p_emp01;

-- ����2) ����� �̸��� �Ű������� �޾Ƽ� �ش� ����� �޿��� ���ϴ� ���ν����� �����Ͻÿ�.
-- in �Ű������� ���
/*
create or replace procedure p_emp02
(v_ename in employee.ename%type) -- in �Ű�����: ȣ���� �� ���� �����ϴ� �Ű�����
is
v_salary employee.salary%type;
begin
    select salary into v_salary
    from employee
    where ename = v_ename;
    DBMS_OUTPUT.put_line(v_ename||'����� �޿��� '||v_salary||'�Դϴ�~');
end;
*/
-- ���ν��� Ȯ��
select * from user_procedures;
select * from user_source;

-- ���ν��� ���
execute p_emp02('ALLEN');
execute p_emp02('JONES');
execute p_emp02('TURNER');

set serveroutput on;

-- ����3) ��� ���̺��� ������� �Ű������� �޾Ƽ� �ش� ����� �޿��� �����ϴ� 
-- ���ν����� �����Ͻÿ�. (in �Ű�����, out �Ű�����)

--create or replace procedure p_emp03 
--(v_ename in employee.ename%type, v_salary out employee.salary%type)
--is
--begin
--    select salary into v_salary
--    from employee
--    where ename = v_ename;
--end;

-- ���ν��� Ȯ��
select * from user_procedures;
select * from user_source where name = 'P_EMP03';

-- ���ν��� ����
-- ���� ����: var(variable)
--variable v_salary number;
--execute p_emp03('SCOTT', :v_salary);
--print v_salary;

/*
< �Լ� >
- �Լ� �ȿ��� ó���� ������� �����ִ� �뵵�θ� ��� -> ���ν������� ������(���ν��� �ȿ��� ���� ó���� ���� �ְ�, ���� ������ ���� ����)
- �Լ���  �ݵ�� �ϳ��� ���� ������. -> ���ν����� ������(���ν����� out�� ������ ����Ͽ� ���� ������ ������ �� ����)
- return Ű���带 �����.
- �� �Լ��� �ܺ��� SQL �ȿ��� ����� ���� ����.

< �Լ��� ���� >
create or replace function �Լ���
() -- �Ű�����
return ���ϰ��� Ÿ��
is
   -- ��������
 begin
    ���๮;
    ...
    
    return ������;
end;
*/

-- ����4) ����� �̸��� �޾Ƽ�, �ش����� �޿��� �����ϴ� �Լ��� �����Ͻÿ�.
--create or replace function f_emp01
--(v_ename in employee.ename%type)
--return number
--is
--v_salary employee.salary%type;
--begin
--    select salary into v_salary
--    from employee
--    where ename = v_ename;
--    
--    return v_salary;
--end;

-- �Լ� Ȯ��
--select * from user_source where name = 'F_EMP01';

-- �Լ� ���
--var v_salary number;
--execute :v_salary := f_emp01('SCOTT');
--print v_salary;

-- �Լ� ���2 : �Լ� ����� Ư¡(���ν������� ������), ����
-- 'SCOTT' ����� �̸��� �޿��� ����Ͻÿ�.
select ename, f_emp01('SCOTT')
from employee
where ename = 'SCOTT';

/*
< Ʈ����(trigger)>
-- ���� ��Ƽ� �κ�, 
-- �������� ���� �Ǵ� �Ϸ��� ����� �����ϴ� �ڱ��� �Ǵ� ���(��, ����)
-- � �̺�Ʈ�� �߻����� �� ����ǵ��� ���� ������ ���� ���ν��� 
-- �̺�Ʈ�� �ַ� DML(insert, update, delete)�� ��

< Ʈ������ ���� >
- ���̺�, �信 ���� ó�� ����, ���� ����, ���� �ð��� �����ϰ�, ���� ���ǿ� �ڵ����� ����
- �����͸� �����ϴ� �߿� Ʈ���Ÿ� �����ϸ�, ������ �߻��Ǿ��� �� �������� ������ ����

< Ʈ������ ���� >
- Ʈ���Ÿ� �ʹ� ����ϸ� ������ ���ϰ� �߻���.

< Ʈ������ ���� >
1. �̺�Ʈ�� �߻��ϴ� ������ ����
(1) after Ʈ����: �̺�Ʈ�� �߻��ϰ� �� �Ŀ� Ʈ���� �߻�
- ���̺� insert, update, delete�� �۾��� �߻��� �Ŀ� �ڵ����� �۵�
- ���̺��� �۵�, �信�� �۵����� ����

(2) before Ʈ����: �̺�Ʈ�� �߻��ϱ� ���� Ʈ���� �߻�
- ���̺� insert, update, delete�� �۾��� �߻��ϱ� ���� �ڵ����� �۵�
- ���̺�� �信 ��� �۵�, �ַ� �䰡 ������Ʈ�ǵ��� ���

2. Ʈ������ ��ü(begin)�� ������ �� �� ����Ǵ����� ����
(1) ���� ���� Ʈ���� - �̺�Ʈ�� ���� �� �ѹ��� Ʈ���Ű� �߻�

(2) �� ���� Ʈ���� - �̺�Ʈ�� ���� ���� ���� ���� ����ȴٸ� ���� ���� Ʈ���� �߻�

�� Ʈ������ ����: 3(insert, update, delete) * 2(after, before) * 2(���巹��, �෹��) = 12����

< Ʈ������ ���� >
create or replace trigger Ʈ���Ÿ�
    (after or before) (insert or update or delete) on ���� ���̺��(�̺�Ʈ�� �߻��ϴ� ���̺�)
    for each row -- �෹��
begin
    �̺�Ʈ�� �߻����� �� �����ϴ� ��ɹ�;
    ...
end;

< Ʈ������ �ۼ� ��� >
:old - ���� ���� ��
:new - ���� ���� ��
ex) salary�� ���� ���� �۾��� ���� ��, salary�� ���� ���� ��
*/

-- < Ʈ���� ���� >
-- ���� ���̺�
create table emp01 as select * from employee;
create table dept01 as select * from department;

-- ��� ���̺�
create table emp_backup as select * from employee where 0=1;
create table dept_backup as select * from department where 0=1;

-- < insert Ʈ���� >
-- ����1) dept01 ���̺� ���ο� ������ �߰��Ǿ��� ��, dept_backup ���̺�
-- �����Ͱ� ����ǵ����ϴ� Ʈ���Ÿ� �����Ͻÿ�
-- insert �̺�Ʈ, after Ʈ����, �෹�� Ʈ����
set serveroutput on;
--create or replace trigger t_dept01
--    after insert on dept01
--    for each row -- �෹�� Ʈ����, �����ϸ� ���巹�� Ʈ����
--begin
--    if inserting then
--        dbms_output.put_line('--- dept01 ���̺� ���� insert trigger �߻� ---');
--        insert into dept_backup values(:new.dno, :new.dname, :new.loc);
--    end if;
--end;

-- Ʈ���� Ȯ��
--select * from user_triggers;
--select * from user_source where name = 'T_DEPT01';

-- Ʈ���� �۵� Ȯ��, dept01 ���̺� �����͸� ����
--insert into dept01 values(50, 'IT', 'SEOUL');
--
--select * from dept01;
--select *from dept_backup;

-- < delete Ʈ���� >
-- ����2) emp01 ���̺��� �����Ͱ� �����Ǹ�, �׳����� emp_backup ���̺� ����ǵ��� �ϴ�
-- Ʈ���Ÿ� �����Ͻÿ�.
--create or replace trigger t_emp01
--    after delete on emp01
--    for each row
--begin
--    if deleting then
--        DBMS_OUTPUT.PUT_LINE('--- emp01 ���̺� delete Ʈ���� �߻� ---');
--        insert into emp_backup values (:old.eno, :old.ename, :old.job,
--        :old.manager, :old.hiredate, :old.salary, :old.commission, :old.dno);
--    end if;
--end;

-- Ʈ���� ���� Ȯ��
select * from user_triggers;
select * from user_source where name = 'T_EMP01';

-- Ʈ���� �۾� Ȯ��, emp01 ���̺��� �����͸� ����
delete from emp01 where ename = 'KING';

select * from emp01;
select * from emp_backup;

-- ���� �� �� ����
delete from emp01 where dno = 30;
select * from emp01;
select * from emp_backup;

-- < update Ʈ���� >
-- ����3) dept01 ���̺��� ������ �����Ǿ��� ��, ���� ���� ������ dept_backup ���̺�
-- ����ǵ��� �ϴ� Ʈ���Ÿ� �����Ͻÿ�. (Ʈ���Ÿ�: t_dept01_update)

-- Ʈ���� ����
--create or replace trigger t_dept01_update
--    after update on dept01
--    for each row
--begin
--    if updating then
--        dbms_output.put_line('--- dept01 ���̺� update Ʈ���� ����');
--        insert into dept_backup values (:old.dno, :old.dname, :old.loc);
--    end if;
--end;

-- Ʈ���� ���� Ȯ��
--select * from user_triggers;
--select * from user_source where name = 'T_DEPT01_UPDATE';

-- Ʈ���� �۾� Ȯ��
--update dept01 set loc = 'BUSAN' where dno = 50;
--select * from dept01;
--select * from dept_backup;

-- ����4) info_backup ���̺��� �ۼ��ϰ�, emp01 ���̺� insert, update, delete �̺�Ʈ �۾���
-- �߻��Ͽ��� ��, info_bakup ���̺� �Ʒ��� ������ �߰��ǵ��� Ʈ���Ÿ� �ۼ��Ͻÿ�. �̺�Ʈ�� �߻��� ����ϵ��� �Ͻÿ�.
-- Ʈ���Ÿ�: t_info_backup
-- after insert or update or delete
-- info_backup ���̺� (���, �����, �μ���ȣ, ���泯¥�� �ð�, �۾� ����)
-- �÷�: eno number(4), ename varchar2(20), dno number(2), t_datetime varchar2(20), t_job(6)
-- ���泯¥�� �ð�: to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
-- �۾� ����: insert, update, delete

-- info_backup ���̺� ����
create table info_backup (
eno number(4),
ename varchar2(20),
dno number(2),
t_datetime varchar2(20),
t_job varchar2(6)
);
-- Ʈ���� ����
--create or replace trigger t_info_backup
--after insert or update or delete on emp01
--for each row
--begin
--    if inserting then
--        dbms_output.put_line('--- emp01 ���̺��� insert trigger�� �߻� ---');
--        insert into info_backup values(:new.eno, :new.ename, 
--        :new.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'insert');
--    elsif updating then
--        dbms_output.put_line('--- emp01 ���̺��� update trigger�� �߻� ---');
--        insert into info_backup values(:old.eno, :old.ename, 
--        :old.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'update');
--    elsif deleting then
--        dbms_output.put_line('--- emp01 ���̺��� delete trigger�� �߻� ---');
--        insert into info_backup values(:old.eno, :old.ename, 
--        :old.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'delete');
--    end if;
--    commit;
--end;

-- Ʈ���� ���� Ȯ��
select * from user_triggers;
select * from user_source where name = 'T_INFO_BACKUP';

-- Ʈ���� �۾� Ȯ��
-- 1. insert �۾�
insert into emp01 values(9000, 'KIM', 'ACTOR', null, sysdate, 5000, null, 10);
select * from emp01;
select * from info_backup;

-- 2. update �۾�
-- 20�� �μ����� �ٹ��ϴ� ����� �޿��� 10% �λ��Ͻÿ�.
update emp01 set salary = salary + salary*0.1 where dno = 20;
select * from emp01;
select * from info_backup;

-- 3. delete �۾�
-- 10�� �μ����� �ٹ��ϴ� ����� ������ �����Ͻÿ�.
delete from emp01 where dno = 10;
select * from emp01;
select * from info_backup;
commit;

