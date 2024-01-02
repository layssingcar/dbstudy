/*
    SELECT ���� ���� ����
    
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
    6. ORDER BY
*/

-- 1. �μ���ȣ�� �������� �������� ����
SELECT DEPART �μ���ȣ  -- 2
FROM EMPLOYEE_T         -- 1
ORDER BY �μ���ȣ;      -- 3

-- 2. �μ��� ���� ��� ��ȸ
SELECT DEPART "�μ���ȣ", AVG(SALARY) "���� ���"   -- 3
FROM EMPLOYEE_T                                     -- 1
GROUP BY DEPART;                                    -- 2

-- 3. �μ��� ���� ��հ� ��� �� ��ȸ, ��� ���� 2�� �̻��� �μ��� ��ȸ, ��� ���� �������� ����
SELECT DEPART "�μ���ȣ", AVG(SALARY) "���� ���", COUNT(*) "��� ��"  -- 4
FROM EMPLOYEE_T                                                        -- 1
GROUP BY DEPART                                                        -- 2
HAVING COUNT(*) >= 2                                                   -- 3
ORDER BY "���� ���" DESC;                                             -- 5