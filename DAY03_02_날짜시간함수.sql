/*
    1. DATE ������ ��¥/�ð� ����
        1) 1���� ���� 1�� ó���Ѵ�.
        2) ���� ó��
            (1) 1: 1��
            (2) 1/24: 1�ð�
            (3) 1/24/60: 1��
            (4) 1/24/60/60: 1��      
*/

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') "���� ��¥�� �ð�", 
    TO_CHAR(SYSDATE + 1, 'YY/MM/DD HH24:MI:SS') "1�� ��", 
    TO_CHAR(SYSDATE - 1, 'YY/MM/DD HH24:MI:SS') "1�� ��", 
    TO_CHAR(SYSDATE + 1/24, 'YY/MM/DD HH24:MI:SS') "1�ð� ��", 
    TO_CHAR(SYSDATE + 1/24/60, 'YY/MM/DD HH24:MI:SS') "1�� ��", 
    TO_CHAR(SYSDATE + 1/24/60/60, 'YY/MM/DD HH24:MI:SS') "1�� ��"
FROM DUAL;

-- �Ի����� ��ĥ �������� ����ؼ� ��ȸ�ϱ�
SELECT NAME, SYSDATE - TO_DATE(HIRE_DATE) �ٹ��ϼ� 
FROM EMPLOYEE_T;

/*
    2. TIMESTAMP ������ ��¥/�ð� ����
        1) INTERVAL Ű���� �̿�
        2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND ���� �̿�
*/

SELECT SYSTIMESTAMP + INTERVAL '1' YEAR, 
    SYSTIMESTAMP + INTERVAL '1' MONTH, 
    SYSTIMESTAMP + INTERVAL '1' DAY, 
    SYSTIMESTAMP + INTERVAL '1' HOUR, 
    SYSTIMESTAMP + INTERVAL '1' MINUTE, 
    SYSTIMESTAMP + INTERVAL '1' SECOND 
FROM DUAL;

/*
    3. ��¥/�ð� ���� ����
        EXTRACT(���� FROM ��¥/�ð�)
*/

SELECT EXTRACT(YEAR FROM SYSDATE) ��, 
    EXTRACT(MONTH FROM SYSDATE) ��, 
    EXTRACT(DAY FROM SYSDATE) ��, 
    EXTRACT(HOUR FROM SYSTIMESTAMP) ǥ�ؽ�, 
    EXTRACT(HOUR FROM SYSTIMESTAMP) + 9 "Asia/Seoul", 
    EXTRACT(MINUTE FROM SYSTIMESTAMP) ��, 
    EXTRACT(SECOND FROM SYSTIMESTAMP) ��
FROM DUAL;

/*
    4. N���� ���� ��¥ ���ϱ�
        ADD_MONTHS(��¥, N)
*/

SELECT ADD_MONTHS(SYSDATE, 1) "1���� ��", 
    ADD_MONTHS(SYSDATE, -1) "1���� ��", 
    ADD_MONTHS(SYSDATE, 12) "1�� ��" 
FROM DUAL;

/*
    5. ���� ���� ���ϱ�
        MONTHS_BETWEEN(�ֱٳ�¥, ������¥)
*/

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2023/03/23', 'YYYY-MM-DD')) 
FROM DUAL;