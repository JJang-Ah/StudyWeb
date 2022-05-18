
-- 문제 1
--create user user01 identified by 1234;
--grant create session to user01;
--exit;
--show user;

-- 문제 2
-- system 계정에서
create role role_test01;
grant create session, create table, create view to role_test01;
grant role_test01 to user01;
-- user01계정에서
select * from user_role_privs;

-- 문제3
-- ezen01 계정에서
grant select on ezen01.department to public;
-- user01 계정에서
select * from ezen01.department;

grant create synonym to user01;
-- 문제4
-- system 계정에서
grant DBA to user01;
-- user01 계정에서
create synonym snn_dept for ezen01.department;
select * from snn_dept;


 set serveroutput on;
-- 문제5 
--declare
--    v_emp employee%rowtype;
--    cursor c1 is select eno, ename, job, salary from employee where salary >= 2000;
--begin
--    open c1;
--    loop
--    fetch c1 into v_emp.eno, v_emp.ename, v_emp.job, v_emp.salary;
--    exit when c1%notfound;
--    dbms_output.put_line(v_emp.eno||' '|| v_emp.ename||' '||
--    v_emp.job||' '||v_emp.salary);
--    end loop;
--    close c1;
--end;
--

-- 문제 6
select * from employee;
--create or replace procedure p_ename_salary
--is 
--v_salary employee.salary%type;
--begin
--    select salary into v_salary
--    from employee
--    where ename = 'JAMES';
--    DBMS_OUTPUT.put_line('JAMES사원의 급여는 ' ||v_salary||'입니다.');
--end;
select * from user_procedures;
select * from user_source;
execute p_ename_salary;
drop procedure p_ename_salary;
-- 문제7
        
-- 문제8
--create or replace function fn_dno_dname
--(v_dno in department.dno%type)
--return number
--is
--v_dname department.dname%type;
--begin
--    select dname into v_dname
--    from department
--    where dno = v_dno;
--    return v_dname;
--end;
var v_dname varchar2;
execute :v_dname := fn_dno_dname(10);
print v_dname;

-- 문제9
create table emp_src as select * from employee;
create table emp_backup as select * from employee where 1=0;
--create or replace trigger trg_emp_src
--    before delete on emp_src
--    for each row
--begin
--    if deleting then
--        DBMS_OUTPUT.put_line('trg_emp_src 트리거 발생');
--        insert into emp_backup values (:old.eno, :old.ename,
--        :old.job, :old.manager, :old.hiredate, :old.salary, :old.commission,
--        :old.dno);
--    end if;
--end;
select * from user_triggers where trigger_name='TRG_EMP_SRC';


-- 문제 10
select * from emp_src;
delete from emp_src where eno=7788;
select * from emp_backup;