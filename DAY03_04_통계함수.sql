/*
    통계 함수 (집계 함수)
    1. 합계: SUM(EXPR)
    2. 평균: AVG(EXPR)
    3. 최대: MAX(EXPR)
    4. 최소: MIN(EXPR)
    5. 개수: COUNT(EXPR)
*/

-- EMPLOYEE_T 테이블

-- 1. 전체 사원의 기본급 합계 조회하기
SELECT SUM(SALARY) "기본급 합계" 
FROM EMPLOYEE_T;

-- 2. 전체 사원의 기본급 평균 조회하기
SELECT AVG(SALARY) "기본급 평균" 
FROM EMPLOYEE_T;

-- 3. 전체 사원의 기본급 최대 조회하기
SELECT MAX(SALARY) "기본급 최대" 
FROM EMPLOYEE_T;

-- 4. 전체 사원의 기본급 최소 조회하기
SELECT MIN(SALARY) "기본급 최소" 
FROM EMPLOYEE_T;

-- 5. 전체 사원 수 조회하기
SELECT COUNT(*) 
FROM EMPLOYEE_T;

-- 1. 국어 점수 합계
SELECT SUM(KOR) "합계" 
FROM SAMPLE_T;

-- 2. 국어 점수 평균
SELECT AVG(KOR) "평균" 
FROM SAMPLE_T;

-- 3. 국어 점수 최대
SELECT MAX(KOR) "최대" 
FROM SAMPLE_T;

-- 4. 국어 점수 최소
SELECT MIN(KOR) "최소" 
FROM SAMPLE_T;

-- 5. 전체 학생 수
SELECT COUNT(*) 
FROM SAMPLE_T;

-- HR 계정으로 접속 (EMPLOYEES 테이블)

-- 1. 전체 연봉 합계
SELECT SUM(SALARY) 
FROM EMPLOYEES;

-- 2. 커미션 평균 (커미션 = COMMISSION_PCT * SALARY)
SELECT AVG(NVL(COMMISSION_PCT, 0) * SALARY) 
FROM EMPLOYEES;

-- 3. 가장 먼저 입사한 사원이 입사한 날짜
SELECT MIN(HIRE_DATE) 
FROM EMPLOYEES;

-- 4. 가장 늦게 입사한 사원이 입사한 날짜
SELECT MAX(HIRE_DATE) 
FROM EMPLOYEES;

-- 5. 사원들이 근무하고 있는 부서의 개수
SELECT COUNT(DISTINCT DEPARTMENT_ID) 
FROM EMPLOYEES;