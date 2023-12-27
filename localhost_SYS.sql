-- single-line comment
/*
    multi-line comment
*/

/*
    SYS ����
    1. ����Ŭ ������ �����̴�.
    2. �Ϲ� ����ڸ� ����� ���ҷ� �����ؼ� ����Ѵ�.
    3. SYS �������� �Ϲ� ���� �۾��� �������� �ʵ��� �����Ѵ�.
    
    ���ο� ����� ���� ���
    1. ����ڸ� ����� �������� �����Ѵ�.
        CREATE USER �����̸� IDENTIFIED BY ��й�ȣ;
    2. ����ڿ��� ������ �ο��Ѵ�.
        1) ���� ���� �ο�
            GRANT CONNECT TO �����̸�;
        2) ����/��� ���� �ο�
            GRANT CONNECT, RESOURCE TO �����̸�;
        3) ������ ���� �ο�
            GRANT DBA TO �����̸�;
    
    ������ ���� ���
    1. Ŀ���� �ΰ� CTRL + ENTER: Ŀ���� �ִ� �������� ����
    2. ����� ��� CTRL + ENTER: ��� ���� �κ��� �������� ����
    3. F5: ��ü ��ũ��Ʈ ����
*/

--CREATE USER C##GD IDENTIFIED BY 1111;
--GRANT DBA TO C##GD;

/*
    ���� ����
    1. �����ͺ��̽� ��ü�� ���� ���
        DROP USER �����̸� CASCADE;
    2. �����ͺ��̽� ��ü�� ������ ���� ���
        DROP USER �����̸�;
*/

--DROP USER C##GD;

-- GD ������ ����� ��ü ��ũ��Ʈ
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; -- C## ����
DROP USER GD CASCADE;
CREATE USER GD IDENTIFIED BY 1111;
GRANT DBA TO GD;