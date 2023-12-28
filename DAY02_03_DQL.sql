/*
    DQL(Data Query Language)
    1. 데이터 조회어
    2. 데이터(행, ROW)를 조회할 때 사용
    3. DQL을 실행해도 데이터베이스에는 변화가 발생하지 않음
    4. 형식
        SELECT 조회할 칼럼 
        FROM 테이블명
        WHERE 조건식
        GROUP BY 그룹화할 컬럼
        HAVING 그룹조건식
        ORDER BY 정렬할 컬럼 ASC|DESC
*/

-- 1. 부서 테이블의 모든 컬럼 조회
SELECT DEPT_NO, DEPT_NAME, LOCATION 
FROM DEPARTMENT_T;

-- 모든 칼럼을 의미하는 *
SELECT * FROM DEPARTMENT_T;

SELECT DEPARTMENT_T.DEPT_NO, DEPARTMENT_T.DEPT_NAME, DEPARTMENT_T.LOCATION
FROM DEPARTMENT_T;

SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
FROM DEPARTMENT_T D; -- 테이블의 별명(ALIAS)을 D로 지정

-- 2. 부서 테이블의 모든 칼럼 조회
-- 조회할 칼럼명을 '부서번호', '부서명', '위치'로 지정
SELECT DEPT_NO AS 부서번호, DEPT_NAME AS 부서명, LOCATION AS 위치
FROM DEPARTMENT_T;

-- 3. 부서 테이블의 위치 칼럼을 중복을 제거하여 조회
SELECT DISTINCT LOCATION 
FROM DEPARTMENT_T;

SELECT LOCATION
FROM DEPARTMENT_T
GROUP BY LOCATION;

/* 
    주요 조건식 작성 방법
    1. 칼럼 = 값
    2. 칼럼 BETWEEN 값1 AND 값2
    3. 칼럼 IN (값1, 값2)
    4. 칼럼 IS NULL
    5. 칼럼 IS NOT NULL
    6. 칼럼 LIKE 값
*/

-- 4. 부서 테이블에서 부서번호가 1인 부서 정보 조회
SELECT * 
FROM DEPARTMENT_T
WHERE DEPT_NO = 1;

-- 5. 부서 테이블에서 지역이 '서울'인 부서 정보 조회
SELECT * 
FROM DEPARTMENT_T
WHERE LOCATION = '서울';
-- LOCATION 칼럼은 UNIQUE하지 않기 때문에 조회 결과는 2개 이상이 가능하다.

-- 6. 사원 테이블에서 기본급이 3000000 이상인 사원 조회
SELECT * 
FROM EMPLOYEE_T 
WHERE SALARY >= 3000000;

-- 7. 사원 테이블에서 기본급이 2000000 ~ 3000000인 사원 조회
SELECT * 
FROM EMPLOYEE_T
WHERE SALARY BETWEEN 2000000 AND 3000000;

-- 8. 사원 테이블에서 직급이 '사원', '과장'인 사원 조회
SELECT * 
FROM EMPLOYEE_T 
WHERE POSITION IN ('사원', '과장');

/*
    LIKE 연산자와 와일드 카드(WILD CARD)
    
    1. 만능 문자
    2. 종류
        1) %: 글자 수에 상관없는 만능 문자
        2) _: 1글자를 의미하는 만능 문자
    3. 예시
        1) 첫 번째 글자가 A인 모든 데이터: A%
        2) 두 번째 글자가 A인 모든 데이터: _A%
        3) 마지막 글자가 A인 모든 데이터: A%
        4) A를 포함하는 모든 데이터: %A%
    
    LIKE 연산자: 와일드 카드를 이용해 조회할 때 사용하는 연산자
*/

-- 9. 사원 테이블에서 '한'씨 조회
SELECT * 
FROM EMPLOYEE_T 
WHERE NAME LIKE '한%';

-- 10. 사원 테이블에서 9월에 입사한 사원 보회
SELECT * 
FROM EMPLOYEE_T
WHERE HIRE_DATE LIKE '%/09/%';

SELECT * 
FROM EMPLOYEE_T
WHERE TO_CHAR(HIRE_DATE, 'MM') = 9;