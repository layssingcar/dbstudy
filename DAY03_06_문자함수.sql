-- 1. ��ҹ��� ��ȯ
SELECT UPPER('apple'),  -- APPLE
    LOWER('APPLE'),     -- apple
    INITCAP('APPLE')    -- Apple
FROM DUAL; 

-- 2. ���� ��/ ����Ʈ �� ��ȯ
SELECT NAME, 
    LENGTH(NAME) "���� ��", 
    lengthb(NAME) "����Ʈ ��" 
FROM EMPLOYEE_T;

/*
    3. ���� ����
        1) ||: ���� ������
        2) CONCAT(A B): ���� �Լ�
*/
SELECT 'A'|| 'B' || 'C', 
    CONCAT(CONCAT('A', 'B'), 'C') 
FROM DUAL;

SELECT * 
FROM EMPLOYEE_T 
WHERE NAME LIKE '��' || '%';

/*
    4. Ư�� ������ ��ġ ��ȯ
        1) ������ ��ġ�� 1���� �����Ѵ�.
        2) �� ã���� 0�� ��ȯ�Ѵ�.
*/

SELECT NAME, INSTR(NAME, '��') 
FROM EMPLOYEE_T;

-- 5. �Ϻ� ���ڿ� ��ȯ
SELECT NAME, 
    SUBSTR(NAME, 1, 1) ��, -- 1��° ���ں��� 1���� ��ȯ
    SUBSTR(NAME, 2) �̸� -- 2��° ���ں��� ���������� ��ȯ
FROM EMPLOYEE_T;

-- �̸� ��� ���� �ֽ��͸���ũ ó��
SELECT SUBSTR(NAME, 1, 1) || '*' || SUBSTR(NAME, 3) �̸� 
FROM EMPLOYEE_T;

-- ã�� �ٲٱ�
SELECT REPLACE(DEPT_NAME, '��', '��') �μ�
FROM DEPARTMENT_T;

SELECT REPLACE(DEPT_NAME, '��', '') �μ� 
FROM DEPARTMENT_T;

/*
    7. ä���
        1) LPAD(EXPR1, N, EXPR2): N�ڸ��� EXPR1�� ��ȯ, ���ʿ� EXPR2�� ä��
        2) RPAD(EXPR1, N, EXPR2): N�ڸ��� EXPR1�� ��ȯ, �����ʿ� EXPR2�� ä��
*/

-- ����: ����� 10�ڸ������� �ѱ��� 5�ڸ��̴�.
SELECT LPAD(NAME, 10, '*'),
    RPAD(NAME, 10, '*')
FROM EMPLOYEE_T;

/*
    8. ���� ����
        1) LTRIM(EXPR): ���� ���� ����
        2) RTRIM(EXPR): ������ ���� ����
        3) TRIM(EXPR): ����/������ ���� ����
*/

SELECT LTRIM('   HELLO   WORLD   '), 
    RTRIM('   HELLO   WORLD   '), 
    TRIM('   HELLO   WORLD   ')
FROM DUAL;