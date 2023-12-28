/*
    DDL(Data Definition Language)
    
    1. ������ ���Ǿ�
    2. �����ͺ��̽� ��ü�� �ٷ�� ���
    3. ����
        1) CREATE: ����
        2) ALTER: ����
        3) DROP: ����(���� ����)
        4) TRUNCATE: ����(���븸 ����)
*/

-- ���̺� ����
DROP TABLE CUSTOMER_T;
DROP TABLE BANK_T;

-- ���̺� ����
CREATE TABLE BANK_T (
    BANK_CODE VARCHAR2(20) NOT NULL, 
    BANK_NAME VARCHAR2(30), 
    CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

CREATE TABLE CUSTOMER_T (
    CUST_NO NUMBER NOT NULL, 
    CUST_NAME VARCHAR2(30) NOT NULL, 
    CUST_PHONE VARCHAR2(30) UNIQUE, 
    CUST_AGE NUMBER(3) CHECK(CUST_AGE BETWEEN 0 AND 120), 
    BANK_CODE VARCHAR2(20), 
    CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUST_NO), 
    CONSTRAINT FK_CUSTOMER_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_T(BANK_CODE)
);

SELECT * FROM USER_CONSTRAINTS;

/*
    ���̺� ����
    
    1. Į�� �߰�: ALTER TABLE ���̺�� ADD Į���� ������Ÿ�� ��������
    2. Į�� ����: ALTER TABLE ���̺�� MODIFY Į���� ������Ÿ�� ��������
    3. Į�� ����: ALTER TABLE ���̺�� DROP COLUMN Į����
    4. Į���� ����: ALTER TABLE ���̺�� RENAME COLUMN ���� Į���� TO �ű� Į����
    5. ���̺�� ����: ALTER TABLE ���̺�� RENAME TO �ű� ���̺��
*/

-- 1. BANK_T�� ����ó(BANK_TEL) Į�� �߰�
ALTER TABLE BANK_T ADD BANK_TEL VARCHAR2(15 BYTE);

-- 2. BANK_T�� �����(BANK_NAME) Į���� VARCHAR2(15 BYTE)�� �ٲٰ� �ʼ� �������� �߰�
ALTER TABLE BANK_T MODIFY BANK_NAME VARCHAR2(15 BYTE) NOT NULL;

-- 3. CUSTOMER_T�� ����(CUST_AGE) Į�� ����
ALTER TABLE CUSTOMER_T DROP COLUMN CUST_AGE;

-- 4. CUSTOMER_T�� ����ó(CUST_PHONE) Į������ CUST_TEL�� ����
ALTER TABLE CUSTOMER_T RENAME COLUMN CUST_PHONE TO CUST_TEL;

-- 5. CUSTOMER_T�� ���(GRADE) Į�� �߰�, 
--      'VIP', 'GOLD', 'SILVER', 'BRONZE' �� �ϳ��� ���� �������� ����
ALTER TABLE CUSTOMER_T ADD GRADE VARCHAR2(6) CHECK(GRADE IN ('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. CUSTOMER_T�� ����(CUST_NAME) Į���� �ʼ� �������� ����
ALTER TABLE CUSTOMER_T MODIFY CUST_NAME VARCHAR2(30) NULL;

-- 7. CUSTOMER_T�� ���̺���� CUST_T�� ����
ALTER TABLE CUSTOMER_T RENAME TO CUST_T;

/*
    ���̺� ���� - PK/FK ��������
    
    1. PK
        1) �߰�: ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� PRIMARY KEY(Į����)
        2) ����
            (1) ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
            (2) ALTER TABLE ���̺�� DROP PRIMARY KEY
    
    2. FK
        1) �߰�: ALTER TABLE �ڽ����̺�� ADD CONSTRAINT �������Ǹ� FOREIGN KEY(Į����) REFERENCES �θ����̺��(����Į����) [�ɼ�]
        2) ����: ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
        3) ��Ȱ��ȭ: ALTER TABLE ���̺�� DISABLE CONSTRAINT �������Ǹ�
        4) Ȱ��ȭ: ALTER TABLE ���̺�� ENABLE CONSTRAINT �������Ǹ�
*/

-- FK_CUSTOMER_BANK �������� ��Ȱ��ȭ
ALTER TABLE CUST_T DISABLE CONSTRAINT FK_CUSTOMER_BANK;

-- FK_CUSTOMER_BANK �������� Ȱ��ȭ
ALTER TABLE CUST_T ENABLE CONSTRAINT FK_CUSTOMER_BANK;