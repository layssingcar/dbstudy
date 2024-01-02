/*
    SELECT 문의 실행 순서
    
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
    6. ORDER BY
*/

-- 1. 부서번호를 기준으로 오름차순 정렬
SELECT DEPART 부서번호  -- 2
FROM EMPLOYEE_T         -- 1
ORDER BY 부서번호;      -- 3

-- 2. 부서별 연봉 평균 조회
SELECT DEPART "부서번호", AVG(SALARY) "연봉 평균"   -- 3
FROM EMPLOYEE_T                                     -- 1
GROUP BY DEPART;                                    -- 2

-- 3. 부서별 연봉 평균과 사원 수 조회, 사원 수가 2명 이상인 부서만 조회, 평균 연봉 내림차순 정렬
SELECT DEPART "부서번호", AVG(SALARY) "연봉 평균", COUNT(*) "사원 수"  -- 4
FROM EMPLOYEE_T                                                        -- 1
GROUP BY DEPART                                                        -- 2
HAVING COUNT(*) >= 2                                                   -- 3
ORDER BY "연봉 평균" DESC;                                             -- 5