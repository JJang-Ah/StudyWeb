-- 2022/04/19(화) 10일차 수업

/*
< 동의어 > synonym
1. 동의어
- 데이터베이스 객체에 대한 별칭

2. 동의어의 종류
- 전용 동의어: 개별 사용자를 대상으로 하는 동의어, 객체의 접근 권한을 부여받은 사용자가 
정의하고, 해당 사용자만 사용할 수 있음.
- 공용 동의어: 전체 사용자를 대상으로 하는 동의어, dba 권한을 가진 사용자만 
생성할 수 있음. 권한을 주는 사용자가 정의한 동의어를 누구나 사용할 수있음.
*/

-- 부여받은 테이블에 대한 select하는 권한을 확인하는 방법
-- (it01 계정에서 작업)
select * from user_tab_privs;

-- 전용 동의어 생성
-- (it01 계정에서 작업)
create synonym e_sam for ezen01.sample01;

-- 전용 동의어 확인
-- (it01 계정에서 작업)
select * from user_synonym;

-- 전용 동의어 삭제
-- (it01 계정에서 작업)
drop synonym e_sam;

------------------------
-- system 에서 공용 동의어 생성
create public synonym t01 from test01;

-- it01 계정에 권한 부여
grant select on system.test01 to it01;

-- it01 계정에서 공용 동의어로 검색 성공
select * from t01;

-- 공용 동의어의 삭제 (system 계정에서)
drop public synonym t01;

-- 공용 동의어를 삭제하면 it01 계정에서 사용불가
selec * from t01; --> 테이블이 존재하지 않음

-- 전용 동의어 확인
select synonym_name from user_synonyms;

-- 공용 동의어 확인
select synonym_name from all_synonyms where synonym_name = 'T01';


-----------------------------

/*
< PL/ SQL > -> Procdure -> Function -> Trigger
- Procedural Language SQL (절차적 언어 SQL)

1. PL/SQL의 특징
- 변수, 상수 등을 선언하여 SQL에서 사용
- if문을 조건에 따라 선택할 수 있음.
- loop문을 사용하여 반복 실행할 수 있음.
- 커서를 사용하여 여러 개의 행을 검색가능

2. PL/SQL의 구성 요소
declare    -- 선언부 (선택)
begin      -- 실행부 (필수)
excption   -- 예외부 (선택)
end        

3. PL/SQL의 구성 요소 설명
declare - 변수 또는 상수를 선언하는 부분 (선택)
begin - 조건문, 반복문, 함수 등을 선언해서 사요하는 부분 (필수)
exception - PL/SQL 실행 도중에 에러가 발생했을 때 처리하는 부분 (선택)

4. 변수와 상수
(1) 스칼라 (Scalar)변수 - 값을 가지는 일반적인 변수
- 숫자, 문자, 날짜, boolean 
- 값을 할당하는 연산자 ( := )

(2) 레퍼런스(Reference) 변수 - 테이블의 컬럼을 참조하는 변수
- 테이블명.컬럼명%type -> 컬럼 한개를 참조
- 테이블명%rowtype -> 테이블의 컬럼 전체를 참조

5. if문
(1) if문의 형식
if 조건1 then
실행문;
elsif 조건2 then
실행문;
elsif 조건3 then
실행문;
...
else
실행문;
end if;
*/

/*
set serveroutput on; -- put_line() 함수를 사용하기 위함
begin
    dbms_output.put_line('Welcome to Oracle!');
end;
*/

/*
-- 사원 테이블에터 사번이 7788인 사원의 사번, 사원명, 업무, 급여를 출력하시오.
set serveroutput on;
declare
    v_eno number(4); -- 스칼라타입
    v_ename employee.ename%type; -- 레퍼런스 타입
    v_job employee.job%type;
    v_salary employee.salary%type;
begin
    select eno, ename, job, salary into v_eno, v_ename, v_job, v_salary
    from employee
    where eno = 7788;
    dbms_output.put_line('사번' || '  ' || ' 사원명' || '  ' || '  업무' || '  ' || '  연봉');
    dbms_output.put_line('---------------------------');
    dbms_output.put_line(v_eno || '  ' || v_ename || '  ' || v_job || '  ' || v_salary);
end;
*/

-- 문제2) 사원 테이블에서 사번, 사원명, 급여, 커미션, 총연봉을 출력하시오.
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
    
    dbms_output.put_line('사번' || '  ' || '사원명' || '  ' ||'급여'||'  '|| '커미션' || '  ' || '총연봉');
    dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_salary||'  '||v_commission||
    '  '|| v_annual_sal);
end;
*/
-- 풀이 2번
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
    
    dbms_output.put_line('사번' || '  ' || '사원명' || '  ' ||'급여'||'  '|| '커미션' || '  ' || '총연봉');
    dbms_output.put_line(v_emp.eno||'  '||v_emp.ename||'  '||v_emp.salary||'  '||v_emp.commission||
    '  '|| annual_sal);
    
end;
*/

-- 문제3) 사원 테이블을 사용하여 사번, 사원명, 부서번호, 부서명을 출력하시오.
-- 부서명은 10는 ACCOUNTING, 20: RESEARCH, 30: SALES, 40: OPERATIONS
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





