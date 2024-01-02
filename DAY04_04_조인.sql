/*
    ����
    1. ��ȸ�� �� �ʿ��� Į���� 2�� �̻��� ���̺� ������ �� ���
    2. ���� ������ �̿��� �� ���̺��� ����
    3. ���� ����
        1) ���� ����: ��ȸ�� ���̺� ��� �����ϴ� �����͸� ������� ����
        2) �ܺ� ����: ��� �� ���̺��� �����ϴ� �����͸� ��ȸ ��� ����
*/

/*
    ���� ����(INNER JOIN)
    1. �����ϴ� �� ���̺� ��� �����ϴ� �����͸� ��ȸ
    2. ��� �� ���̺��� �����ϴ� �����ʹ� ��ȸ���� ����
    3. ANSI ����
        SELECT ��ȸ�� Į��
        FROM ���̺�1 INNER JOIN ���̺�2
            ON ��������
*/

-- 1. �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME 
FROM DEPARTMENT_T D
    INNER JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART);

-- 2. �μ��� ��� ���� ��ȸ
SELECT D.DEPT_NAME, AVG(E.SALARY) "��� ����" 
FROM DEPARTMENT_T D 
    INNER JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART) 
GROUP BY D.DEPT_NAME;

/*
    �ܺ� ����(OUTER JOIN)
    1. ��� �� ���̺��� �����ϴ� �����͵� ��ȸ��
    2. �ش� ���̺��� ���ʿ� ������ ���� �ܺ� ����, �����ʿ� ������ ������ �ܺ� ����
    3. ANSI ����
        1) ���� �ܺ� ����
            SELECT ��ȸ�� Į��
            FROM ���̺�1 LEFT OUTER JOIN ���̺�2
                ON ��������
        2) ������ �ܺ� ����
            SELECT ��ȸ�� Į��
            FROM ���̺�1 RIGHT OUTER JOIN ���̺�2
                ON ��������
*/

-- �ܺ� ���� Ȯ���� ���� ������ �Է�
INSERT INTO EMPLOYEE_T VALUES(
    EMP_SEQ.NEXTVAL, 'ȫ�浿', NULL, 'ȸ��', 'F', '00/01/01', 10000000
);
COMMIT;

-- 1. ��� ������� �����ȣ, �����, �μ��� ��ȸ
SELECT E.EMP_NO, E.NAME, D.DEPT_NAME 
FROM DEPARTMENT_T D 
    RIGHT JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART);
    
-- 2. �μ��� ����� ��ȸ, ����� ������ 0���� ��ȸ
/*
    1 ������: ��â�� ��μ�
    2 �λ��: ������
    3 �ѹ���: �Ѽ���
    4 ��ȹ��: -
    NULL: ȫ�浿
*/
SELECT D.DEPT_NAME "�μ���", COUNT(E.EMP_NO) "��� ��" 
FROM DEPARTMENT_T D 
    LEFT JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART) 
GROUP BY D.DEPT_NAME;

-- HR �������� ����

-- 1. �����ȣ, �����, �μ��� ��ȸ
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM DEPARTMENTS D 
    JOIN EMPLOYEES E USING (DEPARTMENT_ID);
    
-- 2. �μ���ȣ, �μ���, ������ ��ȸ
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.STREET_ADDRESS 
FROM LOCATIONS L 
    JOIN DEPARTMENTS D USING (LOCATION_ID);

-- 3. �����ȣ, �����, ����, ������ �ִ뿬��, ���� ��ȸ
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, J.MAX_SALARY, E.SALARY 
FROM JOBS J 
    JOIN EMPLOYEES E USING (JOB_ID);

-- 4. �����ȣ, �����, �μ��� ��ȸ / �μ��� ������ '�μ�����'���� ��ȸ
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, NVL(D.DEPARTMENT_NAME, '�μ�����')  
FROM DEPARTMENTS D 
    RIGHT JOIN EMPLOYEES E USING (DEPARTMENT_ID);

-- 5. �μ��� ��� �޿� ��ȸ / �ٹ� ���� ����� ������ ��� �޿��� 0���� ��ȸ
SELECT D.DEPARTMENT_NAME, NVL(AVG(E.SALARY), 0) 
FROM DEPARTMENTS D 
    LEFT JOIN EMPLOYEES E USING (DEPARTMENT_ID)
    -- ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;

SELECT *
FROM DEPARTMENTS D 
    LEFT JOIN EMPLOYEES E ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);
    
-- 6. �����ȣ, �����, �μ���ȣ, �μ���, ������ȣ, ������ ��ȸ
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, 
    D.DEPARTMENT_ID, D.DEPARTMENT_NAME, 
    L.LOCATION_ID, L.STREET_ADDRESS 
FROM LOCATIONS L 
    JOIN DEPARTMENTS D ON (L.LOCATION_ID = D.LOCATION_ID) 
    JOIN EMPLOYEES E ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- 7. ������, ���ø�, �μ��� ��ȸ
SELECT C.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME 
FROM COUNTRIES C
    JOIN LOCATIONS L ON (C.COUNTRY_ID = L.COUNTRY_ID) 
    JOIN DEPARTMENTS D ON (L.LOCATION_ID = D.LOCATION_ID);

-- ���� ���� (�ϳ��� ���̺� �ϴ�� ���踦 ������ Į������ �����ϴ� ���)

/*
    8. �����ȣ, �����, �Ŵ�����ȣ, �Ŵ����� ��ȸ
    
    ����: 1���� �Ŵ����� N���� ����� ����
        1                                  N
        �Ŵ������̺�: EMPLOYEES E2         ������̺�: EMPLOYEES E1
        PK: EMPLOYEE_ID                    FK: MANAGER_ID
*/
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, 
    E1.MANAGER_ID, E2.FIRST_NAME, E2.LAST_NAME 
FROM EMPLOYEES E1
    INNER JOIN EMPLOYEES E2 ON (E1.MANAGER_ID = E2.EMPLOYEE_ID);
--> ����� �ڵ� �����ؼ� ���غ���

SELECT E.EMPLOYEE_ID AS �����ȣ
     , E.LAST_NAME   AS �����
     , E.MANAGER_ID  AS �Ŵ�����ȣ
     , M.LAST_NAME   AS �Ŵ�����
  FROM EMPLOYEES M INNER JOIN EMPLOYEES E
    ON M.EMPLOYEE_ID = E.MANAGER_ID;

SELECT * FROM EMPLOYEES;

/*
    9. ���� �μ� ������ ������ �޿��� �� ���� �޴� ��� ��ȸ
*/
SELECT ME.EMPLOYEE_ID �����ȣ, ME.LAST_NAME �����, ME.SALARY �޿�, 
    YOU.EMPLOYEE_ID �ʻ����ȣ, YOU.LAST_NAME �ʻ����, YOU.SALARY �ʱ޿� 
FROM EMPLOYEES ME 
    INNER JOIN EMPLOYEES YOU ON (ME.DEPARTMENT_ID = YOU.DEPARTMENT_ID)
WHERE ME.SALARY < YOU.SALARY;

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;
SELECT * FROM COUNTRIES;