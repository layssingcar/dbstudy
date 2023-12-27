/*
    �ٴ�� ����
    
    1. 2���� ���̺��� ���� ���� ���� ���� �Ұ����ϴ�.
    2. �ٴ�� ���踦 ���� 2���� ���̺�� ����� �߰� ���̺��� �ʿ��ϴ�.
    3. �ϴ�� ���踦 2�� ����� �ٴ�� ���谡 �ȴ�.
*/

-- �л� ���̺�
CREATE TABLE STUDENT (
    STD_NO NUMBER NOT NULL PRIMARY KEY, 
    STD_NAME VARCHAR2(10) NOT NULL, 
    STD_GRADE NUMBER NOT NULL, 
    STD_CLASS NUMBER NOT NULL, 
    STD_PHONE NUMBER NOT NULL
);

-- ���� ���̺�
CREATE TABLE SUBJECT (
    SUBJ_NO NUMBER NOT NULL PRIMARY KEY, 
    SUBJ_NAME VARCHAR2(20) NOT NULL
);

-- ������û ���̺�
CREATE TABLE APPLICATE (
    APP_NO NUMBER NOT NULL PRIMARY KEY, 
    STD_NO NUMBER REFERENCES STUDENT(STD_NO) ON DELETE CASCADE,     -- �л��� �������� ������û�� ������ 
    SUBJ_NO NUMBER REFERENCES SUBJECT(SUBJ_NO) ON DELETE SET NULL   -- ������ �������� ������û���� ���� ��ȣ�� ������
);

-- ������û ���̺� ����
DROP TABLE APPLICATE;

-- ���� ���̺� ����
DROP TABLE SUBJECT;

-- �л� ���̺� ����
DROP TABLE STUDENT;