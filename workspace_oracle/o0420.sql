-- 2022/04/20(��) 11���� ����


-- ����3) ��� ���̺��� ����Ͽ� ���, �����, �μ���ȣ, �μ����� ����Ͻÿ�.
-- �μ����� 10�� ACCOUNTING, 20: RESEARCH, 30: SALES, 40: OPERATIONS
/*
set serveroutput on;
declare
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    dname varchar2(20) := null; -- ��Į��, �ʱⰪ
begin
    select eno, ename, dno
    into v_eno, v_ename, v_dno
    from employee;
    
    if v_dno = 10 then
        dname := 'ACCOUNTING
    elsif v_dno = 20 then
        dname := 'RESEARCH';
    elsif v_dno = 30 then
        dname := 'SALES';
    elsif v_dno = 40 then
        dname := 'OPERATIONS';
    end if;
    
    
    dbms_output.put_line('���' || '  ' || '�����' || '  ' ||'�μ���ȣ'||'  '|| '�μ���' ||);
    dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_dno||'  '||dname||
    '  ');
end;
*/

/*
6. �ݺ���
- basic loop, for loop, while loop

(1) basic loop
1-1. ���� ����
loop
    ���๮;
    ...
    ������;
end loop;

1-2. ������ �ִ� ����
loop
    ���๮;
    ...
    ������;
    exit when ����;
end loop;

(2) for loop�� -> 1�� ���� or 1�� ����
for i in 1..9 loop
    ���๮;
    ...
end loop;

(3) while loop��
while ���� loop
    ���๮;
    ...
    ������;
end loop;

*/
-- �� ���� �ݺ������� ������ ���
-- (1) basic loop
/*
set serveroutput on;
declare
    dan number := 2;
    i number := 1;
begin
    loop
        dbms_output.put_line(dan||' * '||i||' = '||(dan*i));
        i := i+1;
        exit when i > 9;
--        if i > 9 then exit;
--        end if;
    end loop;
end;
*/

-- (2) for loop��
-- 2-1. 1�� ����
set serveroutput on;
--declare
--    dan number := 2;
--begin
--    for i in 1..9 loop -- 1�� �����Ѵ�.
--        dbms_output.put_line(dan||' * '||i||' = '||(dan*i));
--    end loop;
--end;

-- 2-2. 1�� ����
--declare
--    dan number := 2;
--begin
--    for i in reverse 1..9 loop -- 1�� �����Ѵ�.
--        dbms_output.put_line(dan||' * '||i||' = '||(dan*i));
--    end loop;
--end;

-- (3) while loop
--declare
--    dan number := 2;
--    i number := 1;
--begin
--    while i<12 loop
--    dbms_output.put_line(dan||' * '||i||' = '||(dan*i));
--    i := i+1;
--    end loop;
--end;

----------------------
/*
-- �ڡ�
-- PL/SQL���� ���̺��� ���� ���� ���� ������ ����� ����Ϸ��� Ŀ��(cursor)�� ���
-- Ŀ��(cursor): �ݺ������� ���̺��� ���� ���� ���� �����ϴ� ������ ��.

<Ŀ���� ��� ���>
- Ŀ�� ����, Ŀ�� ����, Ŀ�� ����Ͽ� �����͸� ����, Ŀ�� �ݱ�

declare
    cursor Ŀ���� is ������; -- Ŀ�� ����
begin
    open Ŀ����;
    loop
        fetch Ŀ���� into ������; -- Ŀ���� �����͸� ����
    end loop;
    close Ŀ����; -- Ŀ�� �ݱ�
end;
*/

-- ����) department ���̺��� ������ ����Ͻÿ�.
--set serveroutput on;
--declare
--    v_dept department%rowtype;
--    cursor c1 is select * from department; -- Ŀ�� ����
--begin
--    open c1; -- Ŀ�� ����
--    loop
--        fetch c1 into v_dept.dno, v_dept.dname, v_dept.loc; -- Ŀ���� ���� ������ ����
--        exit when c1%notfound;
--        dbms_output.put_line(v_dept.dno||'  '||v_dept.dname||
--        '  '||v_dept.loc);
--    end loop;
--    close c1;
--end;

-- ����2) employee ���̺��� eno, ename, job, salary�� ������ ����Ͻÿ�.
/*
declare
    v_emp employee%rowtype;
    cursor c1 is select eno, ename, job, salary from employee;
begin
    open c1;
    loop
        fetch c1 into v_emp.eno, v_emp.ename, v_emp.job, v_emp.salary;
        exit when c1%notfound;
        dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.salary);
    end loop;
    close c1;
end;
*/
-- for loop ��� -> Ŀ�� ����� Ŀ�� �ݱ⸦ ������ �� �ִ�.
-- fetch�� ���� ����
/*
declare
    v_dept department%rowtype;
    cursor c1 is select * from department;
begin
    for v_dept in c1 loop
        exit when c1%notfound;
       dbms_output.put_line(v_dept.dno||'  '||v_dept.dname||
        '  '||v_dept.loc);
    end loop;
end;
*/

--for loop ���
/*
declare
    v_emp employee%rowtype;
    cursor c1 is select eno, ename, job, salary from employee;
begin
    for v_emp in c1 loop
    exit when c1%notfound;
    
    dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.salary);
    end loop;
end;
*/

-- ����3) ��� ���̺��� Ŀ�̼��� null�� �ƴ� ������ ���, �����, �޿��� ����� ��������
-- ������������ ������ ����� ����Ͻÿ�.
-- 3-1. basic loop
/*
declare
    v_emp employee%rowtype;
    cursor c1 is select eno, ename, salary from employee 
    where commission is not null
    order by ename;
begin
    open c1;
    loop
        fetch c1 into v_emp.eno, v_emp.ename, v_emp.salary;
        exit when c1%notfound;
        
        dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.salary);
    end loop;
    close c1;
end;
*/

-- 3-2. for loop
/*
declare
    v_emp employee%rowtype;
    cursor c1 is select eno, ename, salary from employee
    where commission is not null
    order by ename;
begin
    for v_emp in c1 loop
        exit when c1%notfound;
        dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.salary);
    end loop;
end;
*/
/*
< ���ν��� >
-- PL/SQL�� ����Ͽ� ���� ����ϴ� �������� ���ȭ�Ͽ� �ʿ��Ҷ����� 
 ȣ���Ͽ� ����Ѵ�, ������ ������
 
< ���ν����� ���� >
- ������ SQL���� �ܼ�ȭ���� ��
- �ݺ��ؼ� ����� ����.

< ���ν����� ���� >
create or replace procedure ���ν�����
    (���� ����) -- ���ν����� ȣ���� �� ����ϴ� �Ű�����, ���ν����� ȣ���ϰ� �� ���� ������� �ݴ� ����
is
    ���� ����; -- ���ν��� �ȿ��� ���Ǵ� ��������
begin
    ���๮;
    ...
end;
*/

-- ����4) ��� ���̺��� 'SCOTT' ����� �޿��� ���ϴ� p_emp_salary�� �ۼ��Ͻÿ�.
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

-- ����2) ����� �̸��� �޾Ƽ� �ش� ����� �޿��� ���ϴ� ���ν����� �����Ͻÿ�.
/*
create or replace procedure p_emp02
(v_ename in employee.ename%type) -- in �Ű�����
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
