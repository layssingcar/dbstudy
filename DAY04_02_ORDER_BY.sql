/*
    ORDER BY
    1. ��ȸ ����� ������ �� ���
    2. ���� ���
        1) �������� ����: ASC �Ǵ� ����
        2) �������� ����: DESC
    3. 2�� �̻��� ���� ���� �߰� ����
*/

-- 1. ������ ���� ������ ��� ���� ��ȸ
SELECT * 
FROM EMPLOYEE_T 
ORDER BY SALARY DESC;

-- 2. �Ի� ������ ��� ���� ��ȸ
SELECT * 
FROM EMPLOYEE_T 
ORDER BY HIRE_DATE;

-- 3. ������ ������������ ����, ������ ���� �������� �̸��� �������� ����
SELECT * 
FROM EMPLOYEE_T 
ORDER BY GENDER ASC, NAME DESC;