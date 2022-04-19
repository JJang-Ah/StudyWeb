-- 2022/04/19(ȭ) 10���� ����

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

-- �ο����� ���̺� ���� select�ϴ� ������ Ȯ���ϴ� ���
-- (it01 �������� �۾�)
select * from user_tab_privs;

-- ���� ���Ǿ� ����
-- (it01 �������� �۾�)
create synonym e_sam for ezen01.sample01;

-- ���� ���Ǿ� Ȯ��
-- (it01 �������� �۾�)
select * from user_synonym;

-- ���� ���Ǿ� ����
-- (it01 �������� �۾�)
drop synonym e_sam;

------------------------
-- system ���� ���� ���Ǿ� ����
create public synonym t01 from test01;

-- it01 ������ ���� �ο�
grant select on system.test01 to it01;

-- it01 �������� ���� ���Ǿ�� �˻� ����
select * from t01;

-- ���� ���Ǿ��� ���� (system ��������)
drop public synonym t01;

-- ���� ���Ǿ �����ϸ� it01 �������� ���Ұ�
selec * from t01; --> ���̺��� �������� ����

-- ���� ���Ǿ� Ȯ��
select synonym_name from user_synonyms;

-- ���� ���Ǿ� Ȯ��
select synonym_name from all_synonyms where synonym_name = 'T01';


-----------------------------

/*
< PL/ SQL > -> Procdure -> Function -> Trigger
- Procedural Language SQL (������ ��� SQL)

1. PL/SQL�� Ư¡
- ����, ��� ���� �����Ͽ� SQL���� ���
- if���� ���ǿ� ���� ������ �� ����.
- loop���� ����Ͽ� �ݺ� ������ �� ����.
- Ŀ���� ����Ͽ� ���� ���� ���� �˻�����

2. PL/SQL�� ���� ���
declare    -- ����� (����)
begin      -- ����� (�ʼ�)
excption   -- ���ܺ� (����)
end        

3. PL/SQL�� ���� ��� ����
declare - ���� �Ǵ� ����� �����ϴ� �κ� (����)
begin - ���ǹ�, �ݺ���, �Լ� ���� �����ؼ� ����ϴ� �κ� (�ʼ�)
exception - PL/SQL ���� ���߿� ������ �߻����� �� ó���ϴ� �κ� (����)

4. ������ ���
(1) ��Į�� (Scalar)���� - ���� ������ �Ϲ����� ����
- ����, ����, ��¥, boolean 
- ���� �Ҵ��ϴ� ������ ( := )

(2) ���۷���(Reference) ���� - ���̺��� �÷��� �����ϴ� ����
- ���̺��.�÷���%type -> �÷� �Ѱ��� ����
- ���̺��%rowtype -> ���̺��� �÷� ��ü�� ����

5. if��
(1) if���� ����
if ����1 then
���๮;
elsif ����2 then
���๮;
elsif ����3 then
���๮;
...
else
���๮;
end if;
*/

/*
set serveroutput on; -- put_line() �Լ��� ����ϱ� ����
begin
    dbms_output.put_line('Welcome to Oracle!');
end;
*/

/*
-- ��� ���̺��� ����� 7788�� ����� ���, �����, ����, �޿��� ����Ͻÿ�.
set serveroutput on;
declare
    v_eno number(4); -- ��Į��Ÿ��
    v_ename employee.ename%type; -- ���۷��� Ÿ��
    v_job employee.job%type;
    v_salary employee.salary%type;
begin
    select eno, ename, job, salary into v_eno, v_ename, v_job, v_salary
    from employee
    where eno = 7788;
    dbms_output.put_line('���' || '  ' || ' �����' || '  ' || '  ����' || '  ' || '  ����');
    dbms_output.put_line('---------------------------');
    dbms_output.put_line(v_eno || '  ' || v_ename || '  ' || v_job || '  ' || v_salary);
end;
*/

-- ����2) ��� ���̺��� ���, �����, �޿�, Ŀ�̼�, �ѿ����� ����Ͻÿ�.
/*
set serveroutput on;
declare
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_commission employee.commission%type;
    v_annual_sal number(7, 2);
begin
    select eno, ename, salary, nvl(commission, 0), salary*12+nvl(commission, 0)
    into v_eno, v_ename, v_salary, v_commission, v_annual_sal
    from employee
    where ename = 'JAMES';
    
    dbms_output.put_line('���' || '  ' || '�����' || '  ' ||'�޿�'||'  '|| 'Ŀ�̼�' || '  ' || '�ѿ���');
    dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_salary||'  '||v_commission||
    '  '|| v_annual_sal);
end;
*/
-- Ǯ�� 2��
/*
set serveroutput on;
declare
    v_emp employee%rowtype;
    annual_sal number(7, 2);
begin
    select * into v_emp
    from employee
    where ename = 'JAMES';
    
    if (v_emp.commission is null) then
        v_emp.commission := 0;
    end if;
    
    annual_sal := v_emp.salary*12 + v_emp.commission;
    
    dbms_output.put_line('���' || '  ' || '�����' || '  ' ||'�޿�'||'  '|| 'Ŀ�̼�' || '  ' || '�ѿ���');
    dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.salary||'  '||v_emp.commission||
    '  '|| annual_sal);
    
end;
*/

-- ����3) ��� ���̺��� ����Ͽ� ���, �����, �μ���ȣ, �μ����� ����Ͻÿ�.
-- �μ����� 10�� ACCOUNTING, 20: RESEARCH, 30: SALES, 40: OPERATIONS
set serveroutput on;
declare
    v_emp employee%rowtype;
    v_dept department%rowtype;
begin
    select * into v_emp
    from employee
    where ename = 'JAMES';
    
    if(v_emp.dno = 10) then
    

end;





