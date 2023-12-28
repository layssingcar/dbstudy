/*
    DML(Data Manipulation Language)
    
    1. ������ ���۾�
    2. ������(��, ROW)�� �ٷ�� ���
    3. Ʈ����� ó�� �ʿ�
    4. ����
        1) �� ����: INSERT INTO VALUES
        2) �� ����: UPDATE SET WHERE
        3) �� ����: DELETE FROM WHERE
    
    Ʈ�����
    
    1. �� ���� �����ؾ� �ϴ� �۾��� �ǹ��Ѵ�.(���ڼ�, ALL OR NOTHING)
    2. 2���� �̻��� �۾��� �ϳ��� Ʈ��������� �����ȴ�.
    3. �۾��� ������ �ǹ��ϴ� COMMIT�� �۾��� ��Ҹ� �ǹ��ϴ� ROLLBACK�� �ʿ��ϴ�.
    4. ����: ���� ��ü
        1) �� ���忡�� �� ����
        2) �� �������� �� �ֱ�
    
    ������
    
    1. �Ϸù�ȣ�� �����ϴ� �����ͺ��̽� ��ü
    2. �ַ� �⺻Ű�� ���� ������ �� ���
    3. �Լ�
        1) �� ��ȣ ����: NEXTVAL
        2) ���� ��ȣ Ȯ��: CURRVAL
*/

-- ������ ����
DROP SEQUENCE DEPT_SEQ;
DROP SEQUENCE EMP_SEQ;

-- �μ� ���̺��� �μ� ��ȣ�� �����ϴ� ������ ���� (����Ʈ�� ����)
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1�� �����ϴ� ��ȣ ����
    START WITH 1    -- 1���� ��ȣ ����
    NOMAXVALUE      -- ���Ѽ� ����
    NOMINVALUE      -- ���Ѽ� ����
    NOCYCLE         -- ��ȣ ��ȯ ����
    CACHE 20        -- 20���� ��ȣ �̸� ���� (��ȣ�� �̸� �������� �ʴ� NOCACHE �ɼ� ���)
    NOORDER         -- ��ȣ�� ���� ���� ���
;

CREATE TABLE DEPARTMENT_T (
    DEPT_NO NUMBER NOT NULL, 
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL, 
    LOCATION VARCHAR2(15 BYTE) NOT NULL, 
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE EMPLOYEE_T (
    EMP_NO NUMBER NOT NULL, 
    NAME VARCHAR2(20 BYTE) NOT NULL, 
    DEPART NUMBER, 
    POSITION VARCHAR2(20 BYTE), 
    GENDER CHAR(2 BYTE), 
    HIRE_DATE DATE, 
    SALARY NUMBER, 
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO), 
    CONSTRAINT FK_EMPLOYEE_DEPARTMENT FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

-- ��� ���̺��� �����ȣ�� �����ϴ� ������ �����
CREATE SEQUENCE EMP_SEQ START WITH 1001 NOCACHE;

-- �μ� ���̺� �� ����
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES (DEPT_SEQ.NEXTVAL, '������', '�뱸');
INSERT INTO DEPARTMENT_T VALUES (DEPT_SEQ.NEXTVAL, '�λ��', '����');
INSERT INTO DEPARTMENT_T VALUES (DEPT_SEQ.NEXTVAL, '�ѹ���', '�뱸');
INSERT INTO DEPARTMENT_T VALUES (DEPT_SEQ.NEXTVAL, '��ȹ��', '����');

SELECT * FROM DEPARTMENT_T;

-- ��� ���̺� �� ����
INSERT INTO EMPLOYEE_T VALUES (EMP_SEQ.NEXTVAL, '��â��', 1, '����', 'M', '95/05/01', 5000000);
INSERT INTO EMPLOYEE_T VALUES (EMP_SEQ.NEXTVAL, '��μ�', 1, '���', 'M', '17/09/01', 2500000);
INSERT INTO EMPLOYEE_T VALUES (EMP_SEQ.NEXTVAL, '������', 2, '����', 'F', '90/09/01', 5500000);
INSERT INTO EMPLOYEE_T VALUES (EMP_SEQ.NEXTVAL, '�Ѽ���', 3, '����', 'M', '93/04/01', 5000000); -- ���� 2�ε� 3���� �߸� ��

SELECT * FROM EMPLOYEE_T;

-- Ŀ��
COMMIT;

/*
    ����: UPDATE ���̺�� SET ������Ʈ�� ���� WHERE ���ǽ�
*/

-- 1. DEPARTMENT_T���� �μ���ȣ(DEPT_NO)�� 3�� �μ��� ����(LOCATION)�� '��õ'���� ����
UPDATE DEPARTMENT_T 
SET LOCATION = '��õ' --  SET���� ��ȣ(=)�� ���� ������
WHERE DEPT_NO = 3; -- WHERE���� ��ȣ(=)�� ����� ������

-- 2. EMPLOYEE_T���� �μ���ȣ(DEPART)�� 2�� �μ��� ������� �⺻��(SALARY)�� 10% �λ�
UPDATE EMPLOYEE_T SET SALARY = SALARY * 1.1 WHERE DEPART = 2;

/*
    ����: DELETE FROM ���̺�� WHERE ���ǽ�
*/

-- 1. DEPARTMENT_T���� �μ���ȣ(DEPT_NO)�� 3�� �μ� ����
-- (�μ���ȣ�� 3�� ����� �����Ƿ� ���� ���Ἲ�� ������ ��ġ�� �ʴ´�.)
DELETE FROM DEPARTMENT_T WHERE DEPT_NO = 3;

-- 2. EMPLOYEE_T���� �μ���ȣ(DEPART)�� 1�� 4�� ��� ����
DELETE 
  FROM EMPLOYEE_T 
 WHERE DEPART IN(1, 4);

-- 3. DEPARTMENT_T���� �μ���ȣ(DEPT_NO)�� 2�� �μ� ����
-- (�μ���ȣ�� 2�� ����� �����Ƿ� �μ��� �������� ��� ������ ���� ���Ἲ�� ����ȴ�.)
DELETE FROM DEPARTMENT_T WHERE DEPT_NO = 2;

-- �ѹ�
ROLLBACK;