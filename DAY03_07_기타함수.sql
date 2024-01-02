-- 1. 암호화 (해시 알고리즘)
SELECT STANDARD_HASH('1111', 'SHA256') SHA256, 
    STANDARD_HASH('1111', 'SHA384') SHA384, 
    STANDARD_HASH('1111', 'SHA512') SHA512, 
    STANDARD_HASH('1111', 'MD5') MD5
FROM DUAL;

-- 2. 순위 구하기 (동점자의 경우 같은 순위를 가짐)
SELECT EMP_NO, NAME, SALARY, 
    RANK() OVER(ORDER BY SALARY DESC) 
FROM EMPLOYEE_T;

-- 3. 행 번호 구하기 (동점자 처리 기준이 없음)
SELECT EMP_NO, NAME, SALARY, 
    ROW_NUMBER() OVER(ORDER BY SALARY DESC) 
FROM EMPLOYEE_T;

/*
    4. 분기 처리
        1) DECODE 함수
        2) CASE WHEN 표현식
*/

-- 사원번호, 사원명, 부서 조회
-- 1) DOCODE 함수
SELECT EMP_NO, NAME, 
    DECODE(DEPART, 1, '영업부', 2, '인사부', 3, '총무부', 4, '기획부') 부서명 
FROM EMPLOYEE_T;

-- 2) CASE WHEN 표현식
SELECT EMP_NO, NAME, 
    CASE 
        WHEN DEPART = 1 THEN '영업부'
        WHEN DEPART = 2 THEN '인사부'
        WHEN DEPART = 3 THEN '총무부'
        WHEN DEPART = 4 THEN '기획부'
        ELSE 'Unknown'
    END 부서명
FROM EMPLOYEE_T;

COMMIT;