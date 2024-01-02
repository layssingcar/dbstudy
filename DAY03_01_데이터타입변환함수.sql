-- ������Ÿ�� ��ȯ �Լ�

/*
    DUAL ���̺�
    1. ���̺��� �ʿ� ���� ��쿡 ����ϴ� ���̺��̴�.
    2. ���̺��� �ʿ� ���� ��ȸ(DDL)�� ��쿡�� FROM������ �ۼ��ؾ� �ϴµ� �� �� ����Ѵ�.
    3. 1���� ��(COLUMN)�� 1���� ��(ROW)���� �����Ǿ� �ִ�.
*/

/*
    1. ���� -> ���� ��ȯ
        TO_NUMBER(����)
*/

SELECT '100', TO_NUMBER('100')
FROM DUAL;

-- �Ʒ� ������
SELECT * 
FROM DEPARTMENT_T 
WHERE DEPT_NO = 1;

-- �̷��� �ٲ� �ڿ� ����ȴ�.
SELECT * 
FROM DEPARTMENT_T 
WHERE DEPT_NO = TO_NUMBER('1');

/*
    2. ���� -> ���� ��ȯ
        TO_CHAR(����, [����])
*/

SELECT TO_CHAR(SALARY), 
    TO_CHAR(SALARY, '99999999'),    -- 8�ڸ� ���ڿ��� ��ȯ, �� �ڸ��� �������� ä��
    TO_CHAR(SALARY, '00000000'),    -- 8�ڸ� ���ڿ��� ��ȯ, �� �ڸ��� 0���� ä��
    TO_CHAR(SALARY, '9,999,999'),   -- 7�ڸ� ���ڿ��� ��ȯ, õ ���� ���� ��ȣ ���
    TO_CHAR(SALARY, '999,999')      -- 6�ڸ� ���ڿ��� ��ȯ, õ ���� ���� ��ȣ ��� / ������ 7�ڸ��̹Ƿ� ���� ��ȯ �Ұ�
FROM EMPLOYEE_T;

/*
    3. ���� -> ��¥ ��ȯ
        TO_DATE(����, [����])
        * ��¥/�ð� ����
        1) YY: �⵵ 2�ڸ�
        2) YYYY: �⵵ 4�ڸ�
        3) MM: �� 2�ڸ�
        4) DD: �� 2�ڸ�
        5) AM: ����/����
        6) HH: 12�ð�(01~12)
        7) HH24: 24�ð�(01~24)
        8) MI: �� 2�ڸ�
        9) SS: �� 2�ڸ�
        10) FF3: �и��� 3�ڸ�
*/

SELECT TO_DATE(HIRE_DATE), 
     TO_DATE(HIRE_DATE, 'YY/MM/DD'),    -- �Էµ� ���� ��/��/�� �� �ؼ�
     TO_DATE(HIRE_DATE, 'YY/DD/MM'),    -- �Էµ� ���� ��/��/�� �� �ؼ�
     TO_DATE(HIRE_DATE, 'HH/MI/SS')     -- �Էµ� ���� ��/��/�� �� �ؼ� (���� �߻�)
FROM EMPLOYEE_T;

/*    
    4. ��¥ -> ���� ��ȯ
        TO_CHAR(��¥, [����])
        * ���� ��¥/�ð� �Լ�
            1) SYSDATE: ��, ��, ��, ��, ��, ��
            2) SYSTIMESTAMP: ��, ��, ��, ��, ��, ��, �и���
*/

SELECT SYSDATE, 
    TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS'), 
    TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD AM HH:MI:SS.FF3') 
FROM DUAL;