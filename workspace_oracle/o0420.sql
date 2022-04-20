-- 2022/04/20(수) 11일차 수업


-- 문제3) 사원 테이블을 사용하여 사번, 사원명, 부서번호, 부서명을 출력하시오.
-- 부서명은 10는 ACCOUNTING, 20: RESEARCH, 30: SALES, 40: OPERATIONS
/*
set serveroutput on;
declare
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    dname varchar2(20) := null; -- 스칼라, 초기값
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
    
    
    dbms_output.put_line('사번' || '  ' || '사원명' || '  ' ||'부서번호'||'  '|| '부서명' ||);
    dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_dno||'  '||dname||
    '  ');
end;
*/

/*
6. 반복문
- basic loop, for loop, while loop

(1) basic loop
1-1. 무한 루프
loop
    실행문;
    ...
    증감값;
end loop;

1-2. 조건이 있는 루프
loop
    실행문;
    ...
    증감값;
    exit when 조건;
end loop;

(2) for loop문 -> 1씩 증가 or 1씩 감소
for i in 1..9 loop
    실행문;
    ...
end loop;

(3) while loop문
while 조건 loop
    실행문;
    ...
    증감값;
end loop;

*/
-- 세 가지 반복문으로 구구단 출력
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

-- (2) for loop문
-- 2-1. 1씩 증가
set serveroutput on;
--declare
--    dan number := 2;
--begin
--    for i in 1..9 loop -- 1씩 증가한다.
--        dbms_output.put_line(dan||' * '||i||' = '||(dan*i));
--    end loop;
--end;

-- 2-2. 1씩 감소
--declare
--    dan number := 2;
--begin
--    for i in reverse 1..9 loop -- 1씩 증가한다.
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
-- ★★
-- PL/SQL에서 테이블의 여러 개의 행을 질의한 결과를 출력하려면 커서(cursor)를 사용
-- 커서(cursor): 반복문에서 테이블의 여러 개의 행을 인출하는 역할을 함.

<커서의 사용 방법>
- 커서 선언, 커서 열기, 커서 사용하여 데이터를 인출, 커서 닫기

declare
    cursor 커서면 is 쿼리문; -- 커서 선언
begin
    open 커서명;
    loop
        fetch 커서명 into 변수명; -- 커서로 데이터를 인출
    end loop;
    close 커서명; -- 커서 닫기
end;
*/

-- 문제) department 테이블의 정보를 출력하시오.
--set serveroutput on;
--declare
--    v_dept department%rowtype;
--    cursor c1 is select * from department; -- 커서 선언
--begin
--    open c1; -- 커서 열기
--    loop
--        fetch c1 into v_dept.dno, v_dept.dname, v_dept.loc; -- 커서를 통해 데이터 인출
--        exit when c1%notfound;
--        dbms_output.put_line(v_dept.dno||'  '||v_dept.dname||
--        '  '||v_dept.loc);
--    end loop;
--    close c1;
--end;

-- 문제2) employee 테이블에서 eno, ename, job, salary의 정보를 출력하시오.
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
-- for loop 사용 -> 커서 열기와 커서 닫기를 생략할 수 있다.
-- fetch도 생략 가능
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

--for loop 사용
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

-- 문제3) 사원 테이블에서 커미션이 null이 아닌 상태의 사번, 사원명, 급여를 사원명 기준으로
-- 오름차순으로 정렬한 결과를 출력하시오.
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
< 프로시저 >
-- PL/SQL을 사용하여 자주 사용하는 쿼리문을 모듈화하여 필요할때마다 
 호출하여 사용한다, 재사용이 높아짐
 
< 프로시저의 장점 >
- 복잡한 SQL문을 단순화시켜 줌
- 반복해서 사용이 가능.

< 프로시저의 생성 >
create or replace procedure 프로시저명
    (변수 선언) -- 프로시저를 호출할 때 사용하는 매개변수, 프로시저를 호출하고 난 후의 결과값을 닫는 변수
is
    변수 선언; -- 프로시저 안에서 사용되는 지역변수
begin
    실행문;
    ...
end;
*/

-- 문제4) 사원 테이블에서 'SCOTT' 사원의 급여를 구하는 p_emp_salary를 작성하시오.
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

-- 문제2) 사원의 이름을 받아서 해당 사원의 급여를 구하는 프로시저를 생성하시오.
/*
create or replace procedure p_emp02
(v_ename in employee.ename%type) -- in 매개변수
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
