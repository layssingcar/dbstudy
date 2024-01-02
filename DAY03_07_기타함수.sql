-- 1. ��ȣȭ (�ؽ� �˰���)
SELECT STANDARD_HASH('1111', 'SHA256') SHA256, 
    STANDARD_HASH('1111', 'SHA384') SHA384, 
    STANDARD_HASH('1111', 'SHA512') SHA512, 
    STANDARD_HASH('1111', 'MD5') MD5
FROM DUAL;

-- 2. ���� ���ϱ� (�������� ��� ���� ������ ����)
SELECT EMP_NO, NAME, SALARY, 
    RANK() OVER(ORDER BY SALARY DESC) 
FROM EMPLOYEE_T;

-- 3. �� ��ȣ ���ϱ� (������ ó�� ������ ����)
SELECT EMP_NO, NAME, SALARY, 
    ROW_NUMBER() OVER(ORDER BY SALARY DESC) 
FROM EMPLOYEE_T;

/*
    4. �б� ó��
        1) DECODE �Լ�
        2) CASE WHEN ǥ����
*/

-- �����ȣ, �����, �μ� ��ȸ
-- 1) DOCODE �Լ�
SELECT EMP_NO, NAME, 
    DECODE(DEPART, 1, '������', 2, '�λ��', 3, '�ѹ���', 4, '��ȹ��') �μ��� 
FROM EMPLOYEE_T;

-- 2) CASE WHEN ǥ����
SELECT EMP_NO, NAME, 
    CASE 
        WHEN DEPART = 1 THEN '������'
        WHEN DEPART = 2 THEN '�λ��'
        WHEN DEPART = 3 THEN '�ѹ���'
        WHEN DEPART = 4 THEN '��ȹ��'
        ELSE 'Unknown'
    END �μ���
FROM EMPLOYEE_T;

COMMIT;