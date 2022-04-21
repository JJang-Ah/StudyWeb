-- 2022/04/21

/*
-- 프로시저의 생성
create or replace procedure p_emp01
is
v_salary employee.salary%type;
begin
    select salary into v_salary
    from employee
    where ename = 'SCOTT';
    
    DBMS_OUTPUT.PUT_line('SCOTT 사원의 급여는 ' || v_salary||'입니다.');
end;
*/

-- 프로시저 확인
select * from user_procedures; -- 이름 확인
select * from user_source; -- 내용 확인

-- 프로시저 사용
execute p_emp01;

-- 문제2) 사원의 이름을 매개변수로 받아서 해당 사원의 급여를 구하는 프로시저를 생성하시오.
-- in 매개변수를 사용
/*
create or replace procedure p_emp02
(v_ename in employee.ename%type) -- in 매개변수: 호출할 때 값을 전달하는 매개변수
is
v_salary employee.salary%type;
begin
    select salary into v_salary
    from employee
    where ename = v_ename;
    DBMS_OUTPUT.put_line(v_ename||'사원의 급여는 '||v_salary||'입니다~');
end;
*/
-- 프로시저 확인
select * from user_procedures;
select * from user_source;

-- 프로시저 사용
execute p_emp02('ALLEN');
execute p_emp02('JONES');
execute p_emp02('TURNER');

set serveroutput on;

-- 문제3) 사원 테이블에서 사원명을 매개변수로 받아서 해당 사원의 급여를 리턴하는 
-- 프로시저를 생성하시오. (in 매개변수, out 매개변수)

--create or replace procedure p_emp03 
--(v_ename in employee.ename%type, v_salary out employee.salary%type)
--is
--begin
--    select salary into v_salary
--    from employee
--    where ename = v_ename;
--end;

-- 프로시저 확인
select * from user_procedures;
select * from user_source where name = 'P_EMP03';

-- 프로시저 실행
-- 변수 선언: var(variable)
--variable v_salary number;
--execute p_emp03('SCOTT', :v_salary);
--print v_salary;

/*
< 함수 >
- 함수 안에서 처리한 결과값을 돌려주는 용도로만 사용 -> 프로시저와의 차이점(프로시저 안에서 값을 처리할 수도 있고, 값을 리턴할 수도 있음)
- 함수는  반드시 하나의 값을 리턴함. -> 프로시저와 차이점(프로시저는 out을 여러개 사용하여 값을 여러개 리턴할 수 있음)
- return 키워드를 사용함.
- ★ 함수는 외부의 SQL 안에서 사용할 수가 있음.

< 함수의 형식 >
create or replace function 함수명
() -- 매개변수
return 리턴값의 타입
is
   -- 지역변수
 begin
    실행문;
    ...
    
    return 변수명;
end;
*/

-- 문제4) 사원의 이름을 받아서, 해당사원의 급여를 리턴하는 함수를 생성하시오.
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

-- 함수 확인
--select * from user_source where name = 'F_EMP01';

-- 함수 사용
--var v_salary number;
--execute :v_salary := f_emp01('SCOTT');
--print v_salary;

-- 함수 사용2 : 함수 사용의 특징(프로시저와의 차이점), 장점
-- 'SCOTT' 사원의 이름과 급여를 출력하시오.
select ename, f_emp01('SCOTT')
from employee
where ename = 'SCOTT';

/*
< 트리거(trigger)>
-- 총의 방아쇠 부분, 
-- 연쇄적인 반응 또는 일련의 사건을 유발하는 자극이 되는 사건(일, 행위)
-- 어떤 이벤트가 발생했을 때 실행되도록 만들어서 저장해 놓은 프로시저 
-- 이벤트는 주로 DML(insert, update, delete)가 됨

< 트리거의 장점 >
- 테이블, 뷰에 댛나 처리 내용, 실행 조건, 실행 시간을 설정하고, 설정 조건에 자동으로 실행
- 데이터를 변경하는 중에 트리거를 설정하면, 문제가 발생되었을 때 데이터의 추적이 가능

< 트리거의 단점 >
- 트리거를 너무 사용하면 성능의 저하가 발생함.

< 트리거의 종류 >
1. 이벤트가 발생하는 시점에 따라
(1) after 트리거: 이벤트가 발생하고 난 후에 트리거 발생
- 테이블에 insert, update, delete의 작업이 발생한 후에 자동으로 작동
- 테이블에만 작동, 뷰에는 작동하지 않음

(2) before 트리거: 이벤트가 발생하기 전에 트리거 발생
- 테이블에 insert, update, delete의 작업이 발생하기 전에 자동으로 작동
- 테이블과 뷰에 모두 작동, 주로 뷰가 업데이트되도록 사용

2. 트리거의 몸체(begin)의 내용이 몇 번 실행되는지에 따라
(1) 문장 레벨 트리거 - 이벤트에 따라 단 한번만 트리거가 발생

(2) 행 레벨 트리거 - 이벤트에 따라 여러 개의 행이 변경된다면 여러 번의 트리거 발생

※ 트리거의 종류: 3(insert, update, delete) * 2(after, before) * 2(문장레벨, 행레벨) = 12가지

< 트리거의 형식 >
create or replace trigger 트리거명
    (after or before) (insert or update or delete) on 원본 테이블명(이벤트가 발생하는 테이블)
    for each row -- 행레벨
begin
    이벤트가 발생했을 때 실행하는 명령문;
    ...
end;

< 트리거의 작성 방법 >
:old - 변경 전의 값
:new - 변경 후의 값
ex) salary에 대한 변경 작업이 있을 때, salary의 변경 전의 값
*/

-- < 트리거 문제 >
-- 원본 테이블
create table emp01 as select * from employee;
create table dept01 as select * from department;

-- 백업 테이블
create table emp_backup as select * from employee where 0=1;
create table dept_backup as select * from department where 0=1;

-- < insert 트리거 >
-- 문제1) dept01 테이블에 새로운 데이터 추가되었을 때, dept_backup 테이블에
-- 데이터가 백업되도록하는 트리거를 생성하시오
-- insert 이벤트, after 트리거, 행레벨 트리거
set serveroutput on;
--create or replace trigger t_dept01
--    after insert on dept01
--    for each row -- 행레벨 트리거, 생략하면 문장레벨 트리거
--begin
--    if inserting then
--        dbms_output.put_line('--- dept01 테이블에 대한 insert trigger 발생 ---');
--        insert into dept_backup values(:new.dno, :new.dname, :new.loc);
--    end if;
--end;

-- 트리거 확인
--select * from user_triggers;
--select * from user_source where name = 'T_DEPT01';

-- 트리거 작동 확인, dept01 테이블 데이터를 삽입
--insert into dept01 values(50, 'IT', 'SEOUL');
--
--select * from dept01;
--select *from dept_backup;

-- < delete 트리거 >
-- 문제2) emp01 테이블에서 데이터가 삭제되면, 그내용을 emp_backup 테이블에 백업되도록 하는
-- 트리거를 생성하시오.
--create or replace trigger t_emp01
--    after delete on emp01
--    for each row
--begin
--    if deleting then
--        DBMS_OUTPUT.PUT_LINE('--- emp01 테이블에 delete 트리거 발생 ---');
--        insert into emp_backup values (:old.eno, :old.ename, :old.job,
--        :old.manager, :old.hiredate, :old.salary, :old.commission, :old.dno);
--    end if;
--end;

-- 트리거 생성 확인
select * from user_triggers;
select * from user_source where name = 'T_EMP01';

-- 트리거 작업 확인, emp01 테이블에서 데이터를 삭제
delete from emp01 where ename = 'KING';

select * from emp01;
select * from emp_backup;

-- 여러 개 행 삭제
delete from emp01 where dno = 30;
select * from emp01;
select * from emp_backup;

-- < update 트리거 >
-- 문제3) dept01 테이블의 내용이 수정되었을 때, 수정 전의 내용을 dept_backup 테이블에
-- 백업되도록 하는 트리거를 생성하시오. (트리거명: t_dept01_update)

-- 트리거 생성
--create or replace trigger t_dept01_update
--    after update on dept01
--    for each row
--begin
--    if updating then
--        dbms_output.put_line('--- dept01 테이블에 update 트리거 실행');
--        insert into dept_backup values (:old.dno, :old.dname, :old.loc);
--    end if;
--end;

-- 트리거 생성 확인
--select * from user_triggers;
--select * from user_source where name = 'T_DEPT01_UPDATE';

-- 트리거 작업 확인
--update dept01 set loc = 'BUSAN' where dno = 50;
--select * from dept01;
--select * from dept_backup;

-- 문제4) info_backup 테이블을 작성하고, emp01 테이블에 insert, update, delete 이벤트 작업이
-- 발생하였을 때, info_bakup 테이블에 아래의 내용이 추가되도록 트리거를 작성하시오. 이벤트의 발생을 출력하도록 하시오.
-- 트리거명: t_info_backup
-- after insert or update or delete
-- info_backup 테이블 (사번, 사원명, 부서번호, 변경날짜와 시간, 작업 종류)
-- 컬럼: eno number(4), ename varchar2(20), dno number(2), t_datetime varchar2(20), t_job(6)
-- 변경날짜와 시간: to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
-- 작업 종류: insert, update, delete

-- info_backup 테이블 생성
create table info_backup (
eno number(4),
ename varchar2(20),
dno number(2),
t_datetime varchar2(20),
t_job varchar2(6)
);
-- 트리거 생성
--create or replace trigger t_info_backup
--after insert or update or delete on emp01
--for each row
--begin
--    if inserting then
--        dbms_output.put_line('--- emp01 테이블에서 insert trigger가 발생 ---');
--        insert into info_backup values(:new.eno, :new.ename, 
--        :new.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'insert');
--    elsif updating then
--        dbms_output.put_line('--- emp01 테이블에서 update trigger가 발생 ---');
--        insert into info_backup values(:old.eno, :old.ename, 
--        :old.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'update');
--    elsif deleting then
--        dbms_output.put_line('--- emp01 테이블에서 delete trigger가 발생 ---');
--        insert into info_backup values(:old.eno, :old.ename, 
--        :old.dno, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 
--        'delete');
--    end if;
--    commit;
--end;

-- 트리거 생성 확인
select * from user_triggers;
select * from user_source where name = 'T_INFO_BACKUP';

-- 트리거 작업 확인
-- 1. insert 작업
insert into emp01 values(9000, 'KIM', 'ACTOR', null, sysdate, 5000, null, 10);
select * from emp01;
select * from info_backup;

-- 2. update 작업
-- 20번 부서에서 근무하는 사원의 급여를 10% 인상하시오.
update emp01 set salary = salary + salary*0.1 where dno = 20;
select * from emp01;
select * from info_backup;

-- 3. delete 작업
-- 10번 부서에서 근무하는 사원의 정보를 삭제하시오.
delete from emp01 where dno = 10;
select * from emp01;
select * from info_backup;
commit;

