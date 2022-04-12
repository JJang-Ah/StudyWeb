-- 2022/04/12(ȭ) - 5���� ����

-- �ּ� ǥ�� 
select table_name from user_tables;
desc employee;
select * from employee;

/*
2. ������ ���� (non-equi join)
- ���� ������ = (equal)�� �ƴ� �����ڸ� ����ϴ� ����
- ���� ������ Ư�� ���� ���� �ִ����� �����ϱ� ���� ���
*/

--����21) ����� ������ �ش��ϴ� ��������� ����Ͻÿ�.
-- ���, �����, ����, ����, ��������� 5�� �ʵ� -> employee, salgrade
select eno, ename, job, salary, grade
from employee, salgrade
where salary between losal and hisal;
-- join on
select eno, ename, salary, grade
from employee join salgrade
on salary between losal and hisal;

--����22) �����, �μ���, ����, �������
-- employee, department, salgrade ���̺� ���
select ename, dname, salary, grade
from employee, department, salgrade
where employee.dno = department.dno
and salary between losal and hisal;

-- join on
select ename, dname, salary, grade
from employee e
join department d
on e.dno = d.dno
join salgrade s
on salary between losal and hisal;

/*
3. self join
- �ϳ��� ���̺� �ִ� �ʵ�(column 2�� �̻�)���� �����ϴ� ��
- �ϳ��� ���̺��� �ΰ� �̻��� ���̺�� Ȱ���Ͽ� �����ϴ� ���
*/

-- ����23) ���, �����, ����� ���ӻ����ȣ, ����� ���ӻ���̸��� ����Ͻÿ�.
select eno, ename, manager from employee;
-- self join 
select e.eno ���, e.ename ����, m.eno �����ڹ�ȣ, m.ename ������ �̸�
from employee e, employee m
where e.manager = m.eno; --��������

-- join on
select e.eno ���, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e join employee m
on e.manager = m.eno;

select e.ename ||'�� �����ڴ� ' || m.ename || '�Դϴ�.'
from employee e join employee m
on e.manager = m.eno;

/*
4. outer join
- �⺻���� join�� ����� �� ���̺� �߿��� ��� �Ѱ��� �ʵ尪��
null�̸� ����� ������� �ʴ´�.
- outer join�� ��� �Ѱ��� �ʵ尪�� null�̶� ����� ����ϵ�����
*/
-- oracle���� ��� ������ ���, null���� �����ϴ� �ʿ� (+)�� ���
select e.eno ���, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e, employee m
where e.manager = m.eno(+);

-- ǥ�� ���, ������ �Ǵ� ���� ���� ����Ѵ�. (left, right)
select e.eno ���, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e left outer join employee m
on e.manager = m.eno;

/*
���� ����(Sub Query)
- �������� �������� ���ؼ� Ȯ���ؾ� �ϴ� ���� �ϳ��� ���������� �����
Ȯ���ϵ��� �ϴ� ���
- ���� ���� �ȿ� ���� ������ �����ϴ� ���¸� ������ ������
- ���� �������� where���� ���
*/

-- Q1) 'SCOTT'������� �޿��� ���� �޴� ����� �˻��Ͻÿ�.
-- 1�ܰ� : 'SCOTT'����� ������ �˾Ƴ�����
select ename, salary from employee where ename = 'SCOTT';
-- 2�ܰ� : �˾Ƴ� �������� ���� ������ �޴� ����� ������ �˾Ƴ�
select ename, salary 
from employee
where salary > 2000;

-- ���� ������ �ϳ��� �������������� �ذ��ϰ�����.
-- �Ʒ� ������ ���� ������ �ذ��Ҽ��� ����, ���������� �ξ� ���� ���ϴ�.
select ename, salary
from employee
where salary > (select salary from employee where ename = 'SCOTT');

-- ����2) 'MARTIN'�� ���� �μ����� ���ϴ� ��� ����� ���, �����, �μ���ȣ�� �˻�
select eno, ename, dno 
from employee
where dno = (select dno from employee where ename ='MARTIN');

/*
����10) ��� ���̺��� �ְ� ������ �޴� ����� ������ ������ ���Ͻÿ�.
-> ������) not a single-group group function
-> �ذ�å) ���������� �ذ�
*/
select ename, salary 
from employee
where salary = (select max(salary) from employee);

-- ����4) �μ��� �ּұ޿��� 30���μ��� �ּұ޿����� ū �μ��� �ּұ޿��� ���Ͻÿ�
select dno, min(salary)
from employee join department
using(dno)
group by dno
having min(salary) >
(select min(salary) from employee 
group by dno having dno=30);

/*
���� ������ ����
1. ������ ��������
- ���������� ����� 1���� ���� ��
- =, <>, >, >=, <, <=

2. ������ ��������
- ���������� ����� 2�� �̻��� ��
- in, any(some), all

*/
-- ����5) �μ��� �ּұ޿��� �޴� ����� ����� �����, �μ���ȣ, �ּұ޿��� ���Ͻÿ�.
-- �ذ�ð�: 3��
-- single-row subquery returns more than one row
-- ������ ���������� ������ ���������� Ǯ� �߻��ϴ� ����
select eno, ename, dno, salary from employee
where salary in (select min(salary) from employee group by dno);

-- ����6) ������ 'SALESMAN'�� �ƴϸ鼭 , 'SALESMAN'���� ���� �޿��� �޴� �����
-- ���, �����, ����, �޿��� ����Ͻÿ�.
select eno, ename, job, salary
from employee
where job <> 'SALESMAN'
and salary < any (select salary from employee where job = 'SALESMAN');

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




