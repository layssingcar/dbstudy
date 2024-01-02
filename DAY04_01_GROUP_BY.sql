/*
    GROUP BY
    
    1. ���� ���� ���� �����͵��� �ϳ��� �׷����� ��� ó��
    2. ��κ� ��� �Լ��� �Բ� ���
    3. ���Ѿ� �� ����
        GROUP BY ���� ����� Į���� SELECT ������ ��ȸ�� �� �ִ�.
*/

-- 1. ��� ���̺��� �μ���ȣ�� �������� �׷�ȭ�Ͽ� ��ȸ
SELECT DEPART 
FROM EMPLOYEE_T 
GROUP BY DEPART;

-- 2. ��� ���̺��� �μ���ȣ�� ������ ��� ��ȸ
SELECT DEPART "�μ� ��ȣ", AVG(SALARY) "���� ���" 
FROM EMPLOYEE_T 
GROUP BY DEPART;

-- 3. �μ� ���̺��� ������ �μ� �� ��
SELECT LOCATION "����", COUNT(DEPT_NO) "�μ� ��"
FROM DEPARTMENT_T 
GROUP BY LOCATION;

-- 4. ��� ���̺��� ���ް� ������ �������� �׷�ȭ�Ͽ� ��� �޿� ��ȸ
SELECT POSITION, GENDER, AVG(SALARY) "��� �޿�" 
FROM EMPLOYEE_T 
GROUP BY POSITION, GENDER;

-- 5. ��� ���̺��� �Ի���� �Ի��� �� ��ȸ
SELECT TO_CHAR(HIRE_DATE, 'MM') "�Ի��", 
    COUNT(*) "�Ի��� ��" 
FROM EMPLOYEE_T 
GROUP BY TO_CHAR(HIRE_DATE, 'MM');

SELECT EXTRACT(MONTH FROM HIRE_DATE) "�Ի��", 
    COUNT(*) "�Ի��� ��" 
FROM EMPLOYEE_T 
GROUP BY EXTRACT(MONTH FROM HIRE_DATE);

/*
    HAVING
    1. �ַ� GROUP BY ���� �Բ� ���
    2. ��� �Լ��� ������ �����ϴ� ��� ���
    3. �Ϲ� ������ WHERE ���� �ۼ�
*/

-- 1. ������ ���� ���� ��� ��ȸ, ������ 'M'�� ����� ��ȸ
SELECT GENDER, FLOOR(AVG(SALARY)) "���� ���"  
FROM EMPLOYEE_T 
WHERE GENDER = 'M' 
GROUP BY GENDER;

SELECT GENDER, FLOOR(AVG(SALARY)) "���� ���"  
FROM EMPLOYEE_T 
GROUP BY GENDER 
HAVING GENDER = 'M';

-- 2. ������ ���� ���� ��� ��ȸ, �� ������ ��� ���� 2�� �̻��� ����� ��ȸ
SELECT GENDER, FLOOR(AVG(SALARY)) "���� ���"  
FROM EMPLOYEE_T 
GROUP BY GENDER 
HAVING COUNT(*) >= 2;

-- HR �������� ����

-- 1. ��� ���̺��� ������ �μ���ȣ�� ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� �� ���� ����� �ִ��� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID "�μ� ��ȣ" , COUNT(*) "��� ��" 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 2. ��� ���̺��� ���� ������ ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� ������ ����� ������ ��ȸ�Ͻÿ�.
SELECT JOB_ID " ����", FLOOR(AVG(SALARY)) "���� ���" 
FROM EMPLOYEES 
GROUP BY JOB_ID;

-- 3. ��� ���̺��� ��ȭ��ȣ �� 3�ڸ��� ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� ������ �հ谡 ������ ��ȸ�Ͻÿ�.
SELECT SUBSTR(PHONE_NUMBER, 1, 3) "��ȭ��ȣ �� 3�ڸ�", SUM(SALARY) "���� �հ�" 
FROM EMPLOYEES 
GROUP BY SUBSTR(PHONE_NUMBER, 1, 3);

-- 4. ��� ���̺��� �� �μ��� ������� 20�� �̻��� �μ��� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID "�μ���ȣ", COUNT(*) "��� ��" 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 20;

-- 5. ��� ���̺��� �� �μ��� ������� ��ȸ�Ͻÿ�. ��, �μ���ȣ�� ���� ����� �����Ͻÿ�.
SELECT DEPARTMENT_ID "�μ���ȣ", COUNT(*) "��� ��" 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING DEPARTMENT_ID IS NOT NULL;