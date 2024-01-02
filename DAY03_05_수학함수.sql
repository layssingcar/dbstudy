-- 1. ����
SELECT ABS(-5) 
FROM DUAL;

-- 2. ������(��Ʈ)
SELECT SQRT(25) 
FROM DUAL;

-- 3. ����
SELECT POWER(2, 3) 
FROM DUAL;

-- 4. ������
SELECT MOD(5, 2) 
FROM DUAL;

-- 5. ���� �ø�
SELECT CEIL(1.1) 
FROM DUAL;

-- 6. ���� ����
SELECT FLOOR(1.9) 
FROM DUAL;

-- 7. ���ϴ� �ڸ����� �ݿø�
SELECT ROUND(123.456),  -- 123 (���� �ݿø�)
    ROUND(123.456, 1),  -- 123.5 (�Ҽ� 1�ڸ����� �ݿø�)
    ROUND(123.456, 2),  -- 123.46 (�Ҽ� 2�ڸ����� �ݿø�)
    ROUND(123.456, -1), -- 120 (���� �ڸ� �ݿø�)
    ROUND(123.456, -2)  -- 100 (���� �ڸ� �ݿø�)
FROM DUAL;

-- 8. ���ϴ� �ڸ����� ����
SELECT TRUNC(123.456),  -- 123 (������ ����)
    TRUNC(123.456, 2),  -- 123.45 (�Ҽ� 2�ڸ��� ����)
    TRUNC(123.456, 1),  -- 123.4 (�Ҽ� 1�ڸ��� ����)
    TRUNC(123.456, -1), -- 120 (���� �ڸ� ����)
    TRUNC(123.456, -2)  -- 100 (���� �ڸ� ����)
FROM DUAL;

-- * FLOOR�� TRUNC�� ���� (����)
SELECT FLOOR(-1.9) 
FROM DUAL; -- -2

SELECT TRUNC(-1.9) 
FROM DUAL; -- -1

-- �ø�(CEIL), ����(FLOOR) �ڸ��� ó�� (POWER ����� �ڵ� ����)
SELECT CEIL(123.456 * 10) / 10, -- 123.5 
    CEIL(123.456 * 100) / 100   -- 123.46
FROM DUAL;