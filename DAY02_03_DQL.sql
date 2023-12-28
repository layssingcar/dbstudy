/*
    DQL(Data Query Language)
    1. ������ ��ȸ��
    2. ������(��, ROW)�� ��ȸ�� �� ���
    3. DQL�� �����ص� �����ͺ��̽����� ��ȭ�� �߻����� ����
    4. ����
        SELECT ��ȸ�� Į�� 
        FROM ���̺��
        WHERE ���ǽ�
        GROUP BY �׷�ȭ�� �÷�
        HAVING �׷����ǽ�
        ORDER BY ������ �÷� ASC|DESC
*/

-- 1. �μ� ���̺��� ��� �÷� ��ȸ
SELECT DEPT_NO, DEPT_NAME, LOCATION 
FROM DEPARTMENT_T;

-- ��� Į���� �ǹ��ϴ� *
SELECT * FROM DEPARTMENT_T;

SELECT DEPARTMENT_T.DEPT_NO, DEPARTMENT_T.DEPT_NAME, DEPARTMENT_T.LOCATION
FROM DEPARTMENT_T;

SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
FROM DEPARTMENT_T D; -- ���̺��� ����(ALIAS)�� D�� ����

-- 2. �μ� ���̺��� ��� Į�� ��ȸ
-- ��ȸ�� Į������ '�μ���ȣ', '�μ���', '��ġ'�� ����
SELECT DEPT_NO AS �μ���ȣ, DEPT_NAME AS �μ���, LOCATION AS ��ġ
FROM DEPARTMENT_T;

-- 3. �μ� ���̺��� ��ġ Į���� �ߺ��� �����Ͽ� ��ȸ
SELECT DISTINCT LOCATION 
FROM DEPARTMENT_T;

SELECT LOCATION
FROM DEPARTMENT_T
GROUP BY LOCATION;

/* 
    �ֿ� ���ǽ� �ۼ� ���
    1. Į�� = ��
    2. Į�� BETWEEN ��1 AND ��2
    3. Į�� IN (��1, ��2)
    4. Į�� IS NULL
    5. Į�� IS NOT NULL
    6. Į�� LIKE ��
*/

-- 4. �μ� ���̺��� �μ���ȣ�� 1�� �μ� ���� ��ȸ
SELECT * 
FROM DEPARTMENT_T
WHERE DEPT_NO = 1;

-- 5. �μ� ���̺��� ������ '����'�� �μ� ���� ��ȸ
SELECT * 
FROM DEPARTMENT_T
WHERE LOCATION = '����';
-- LOCATION Į���� UNIQUE���� �ʱ� ������ ��ȸ ����� 2�� �̻��� �����ϴ�.

-- 6. ��� ���̺��� �⺻���� 3000000 �̻��� ��� ��ȸ
SELECT * 
FROM EMPLOYEE_T 
WHERE SALARY >= 3000000;

-- 7. ��� ���̺��� �⺻���� 2000000 ~ 3000000�� ��� ��ȸ
SELECT * 
FROM EMPLOYEE_T
WHERE SALARY BETWEEN 2000000 AND 3000000;

-- 8. ��� ���̺��� ������ '���', '����'�� ��� ��ȸ
SELECT * 
FROM EMPLOYEE_T 
WHERE POSITION IN ('���', '����');

/*
    LIKE �����ڿ� ���ϵ� ī��(WILD CARD)
    
    1. ���� ����
    2. ����
        1) %: ���� ���� ������� ���� ����
        2) _: 1���ڸ� �ǹ��ϴ� ���� ����
    3. ����
        1) ù ��° ���ڰ� A�� ��� ������: A%
        2) �� ��° ���ڰ� A�� ��� ������: _A%
        3) ������ ���ڰ� A�� ��� ������: A%
        4) A�� �����ϴ� ��� ������: %A%
    
    LIKE ������: ���ϵ� ī�带 �̿��� ��ȸ�� �� ����ϴ� ������
*/

-- 9. ��� ���̺��� '��'�� ��ȸ
SELECT * 
FROM EMPLOYEE_T 
WHERE NAME LIKE '��%';

-- 10. ��� ���̺��� 9���� �Ի��� ��� ��ȸ
SELECT * 
FROM EMPLOYEE_T
WHERE HIRE_DATE LIKE '%/09/%';

SELECT * 
FROM EMPLOYEE_T
WHERE TO_CHAR(HIRE_DATE, 'MM') = 9;