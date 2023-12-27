/*
    �ܷ� Ű(FOREIGN KEY)
    
    1. �ٸ� ���̺��� ������ �� ����ϴ� Ű(KEY)�̴�.
    2. �ܷ� Ű�� �ߺ� ���� ���� �� �ְ� NULL ���� ���� �� �ִ�.
    3. ���� ���Ἲ�� ������ �Ѵ�.
        1) �����ϴ� ���̺� �����ϴ� �����͸� ������ �� �ִ�.
        2) ���� ���Ἲ�� ����Ǵ� ��츦 ����� �߰� �ɼ��� ����� �� �ִ�.
            (1) ON DELETE SET NULL: �θ� Ű�� �����Ǵ� ��� �ڽ� Ű�� �����Ѵ�.
            (2) ON DELETE CASCASE: �θ� Ű�� �����Ǵ� ��� �ڽ� Ű�� ���� ��(ROW) ��ü�� �����Ѵ�.
    4. ����
        �θ� ���̺�  -   �ڽ� ���̺�
        �θ� Ű    -   �ڽ� Ű
        �⺻ Ű / UNIQUE   -   �ܷ� Ű
*/

/*
    �ϴ�� ����
    
    1. 2���� ���̺��� ���� ���� ���� ���� ����
    2.  1 : M
        PK : FK
        UQ
        �θ� : �ڽ�
    3. �ݵ�� �θ� ���̺��� ���� ������ �Ѵ�.
    4. �ݵ�� �ڽ� ���̺��� ���� �����ؾ� �Ѵ�.
    5. ���̺� ����/���� ��Ģ
        - ������ ���� ������ �ݴ��̴�.
*/

-- ��ǰ ���̺�
CREATE TABLE PRODUCT_T (
    PRODUCT_NO NUMBER NOT NULL PRIMARY KEY, 
    PRODUCT_NAME VARCHAR2(100 BYTE) NOT NULL, 
    PRICE NUMBER NOT NULL, 
    STOCK NUMBER
);

-- �ֹ� ���̺�
CREATE TABLE ORDER_T (
    ORDER_NO NUMBER NOT NULL PRIMARY KEY, 
    MEMBER_ID VARCHAR2(100 BYTE) NOT NULL, 
    PRODUCT_NO NUMBER REFERENCES PRODUCT_T(PRODUCT_NO), 
    ORDERED_AT DATE NOT NULL
);

-- �ֹ� ���̺� ����
DROP TABLE ORDER_T;

-- ��ǰ ���̺� ����
DROP TABLE PRODUCT_T;