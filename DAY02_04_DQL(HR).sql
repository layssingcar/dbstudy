-- 1. ��� ���̺��� �μ���ȣ�� �ߺ��� �����ϰ� ��ȸ�ϱ�
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES;


-- 2. ��� ���̺��� �����ȣ�� 150�� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 150;


-- 3. ��� ���̺��� ������ 10000 �̻��� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE SALARY >= 10000;


-- 4. ��� ���̺��� ������ 10000 �̻� 20000 ������ ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE SALARY BETWEEN 10000 AND 20000;


-- 5. ��� ���̺��� �μ���ȣ�� 30, 40, 50�� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (30, 40, 50);


-- 6. ��� ���̺��� �Ҽӵ� �μ��� ���� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IS NULL;


-- 7. ��� ���̺��� Ŀ�̼��� �޴� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NOT NULL;


-- 8. ��� ���̺��� ��簡 ���� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;


-- 9. ��� ���̺��� ��ȭ��ȣ�� '515'�� �����ϴ� ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE PHONE_NUMBER LIKE '515%';


-- 10. ��� ���̺��� ������ 'MAN'���� ������ ����� ���� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEES 
WHERE JOB_ID LIKE '%MAN';

SELECT * FROM EMPLOYEES;