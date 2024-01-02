/*
    ��� �Լ� (���� �Լ�)
    1. �հ�: SUM(EXPR)
    2. ���: AVG(EXPR)
    3. �ִ�: MAX(EXPR)
    4. �ּ�: MIN(EXPR)
    5. ����: COUNT(EXPR)
*/

-- EMPLOYEE_T ���̺�

-- 1. ��ü ����� �⺻�� �հ� ��ȸ�ϱ�
SELECT SUM(SALARY) "�⺻�� �հ�" 
FROM EMPLOYEE_T;

-- 2. ��ü ����� �⺻�� ��� ��ȸ�ϱ�
SELECT AVG(SALARY) "�⺻�� ���" 
FROM EMPLOYEE_T;

-- 3. ��ü ����� �⺻�� �ִ� ��ȸ�ϱ�
SELECT MAX(SALARY) "�⺻�� �ִ�" 
FROM EMPLOYEE_T;

-- 4. ��ü ����� �⺻�� �ּ� ��ȸ�ϱ�
SELECT MIN(SALARY) "�⺻�� �ּ�" 
FROM EMPLOYEE_T;

-- 5. ��ü ��� �� ��ȸ�ϱ�
SELECT COUNT(*) 
FROM EMPLOYEE_T;

-- 1. ���� ���� �հ�
SELECT SUM(KOR) "�հ�" 
FROM SAMPLE_T;

-- 2. ���� ���� ���
SELECT AVG(KOR) "���" 
FROM SAMPLE_T;

-- 3. ���� ���� �ִ�
SELECT MAX(KOR) "�ִ�" 
FROM SAMPLE_T;

-- 4. ���� ���� �ּ�
SELECT MIN(KOR) "�ּ�" 
FROM SAMPLE_T;

-- 5. ��ü �л� ��
SELECT COUNT(*) 
FROM SAMPLE_T;

-- HR �������� ���� (EMPLOYEES ���̺�)

-- 1. ��ü ���� �հ�
SELECT SUM(SALARY) 
FROM EMPLOYEES;

-- 2. Ŀ�̼� ��� (Ŀ�̼� = COMMISSION_PCT * SALARY)
SELECT AVG(NVL(COMMISSION_PCT, 0) * SALARY) 
FROM EMPLOYEES;

-- 3. ���� ���� �Ի��� ����� �Ի��� ��¥
SELECT MIN(HIRE_DATE) 
FROM EMPLOYEES;

-- 4. ���� �ʰ� �Ի��� ����� �Ի��� ��¥
SELECT MAX(HIRE_DATE) 
FROM EMPLOYEES;

-- 5. ������� �ٹ��ϰ� �ִ� �μ��� ����
SELECT COUNT(DISTINCT DEPARTMENT_ID) 
FROM EMPLOYEES;