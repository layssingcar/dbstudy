/*
    조인
    1. 조회할 때 필요한 칼럼이 2개 이상의 테이블에 존재할 때 사용
    2. 조인 조건을 이용해 각 테이블을 조인
    3. 조인 종류
        1) 내부 조인: 조회할 테이블에 모두 존재하는 데이터를 대상으로 조인
        2) 외부 조인: 어느 한 테이블에만 존재하는 데이터를 조회 대상에 포함
*/

/*
    내부 조인(INNER JOIN)
    1. 조인하는 두 테이블에 모두 존재하는 데이터만 조회
    2. 어느 한 테이블에만 존재하는 데이터는 조회되지 않음
    3. ANSI 문법
        SELECT 조회할 칼럼
        FROM 테이블1 INNER JOIN 테이블2
            ON 조인조건
*/

-- 1. 사원번호, 사원명, 부서번호, 부서명 조회
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME 
FROM DEPARTMENT_T D
    INNER JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART);

-- 2. 부서별 평균 연봉 조회
SELECT D.DEPT_NAME, AVG(E.SALARY) "평균 연봉" 
FROM DEPARTMENT_T D 
    INNER JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART) 
GROUP BY D.DEPT_NAME;

/*
    외부 조인(OUTER JOIN)
    1. 어느 한 테이블에만 존재하는 데이터도 조회됨
    2. 해당 테이블이 왼쪽에 있으면 왼쪽 외부 조인, 오른쪽에 있으면 오른쪽 외부 조인
    3. ANSI 문법
        1) 왼쪽 외부 조인
            SELECT 조회할 칼럼
            FROM 테이블1 LEFT OUTER JOIN 테이블2
                ON 조인조건
        2) 오른쪽 외부 조인
            SELECT 조회할 칼럼
            FROM 테이블1 RIGHT OUTER JOIN 테이블2
                ON 조인조건
*/

-- 외부 조인 확인을 위한 데이터 입력
INSERT INTO EMPLOYEE_T VALUES(
    EMP_SEQ.NEXTVAL, '홍길동', NULL, '회장', 'F', '00/01/01', 10000000
);
COMMIT;

-- 1. 모든 사원들의 사원번호, 사원명, 부서명 조회
SELECT E.EMP_NO, E.NAME, D.DEPT_NAME 
FROM DEPARTMENT_T D 
    RIGHT JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART);
    
-- 2. 부서별 사원수 조회, 사원이 없으면 0으로 조회
/*
    1 영업부: 구창민 김민서
    2 인사부: 이은영
    3 총무부: 한성일
    4 기획부: -
    NULL: 홍길동
*/
SELECT D.DEPT_NAME "부서명", COUNT(E.EMP_NO) "사원 수" 
FROM DEPARTMENT_T D 
    LEFT JOIN EMPLOYEE_T E ON (D.DEPT_NO = E.DEPART) 
GROUP BY D.DEPT_NAME;

-- HR 계정으로 접속

-- 1. 사원번호, 사원명, 부서명 조회
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM DEPARTMENTS D 
    JOIN EMPLOYEES E USING (DEPARTMENT_ID);
    
-- 2. 부서번호, 부서명, 지역명 조회
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.STREET_ADDRESS 
FROM LOCATIONS L 
    JOIN DEPARTMENTS D USING (LOCATION_ID);

-- 3. 사원번호, 사원명, 직업, 직업별 최대연봉, 연봉 조회
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, J.MAX_SALARY, E.SALARY 
FROM JOBS J 
    JOIN EMPLOYEES E USING (JOB_ID);

-- 4. 사원번호, 사원명, 부서명 조회 / 부서가 없으면 '부서없음'으로 조회
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, NVL(D.DEPARTMENT_NAME, '부서없음')  
FROM DEPARTMENTS D 
    RIGHT JOIN EMPLOYEES E USING (DEPARTMENT_ID);

-- 5. 부서별 평균 급여 조회 / 근무 중인 사원이 없으면 평균 급여를 0으로 조회
SELECT D.DEPARTMENT_NAME, NVL(AVG(E.SALARY), 0) 
FROM DEPARTMENTS D 
    LEFT JOIN EMPLOYEES E USING (DEPARTMENT_ID)
    -- ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;

SELECT *
FROM DEPARTMENTS D 
    LEFT JOIN EMPLOYEES E ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);
    
-- 6. 사원번호, 사원명, 부서번호, 부서명, 지역번호, 지역명 조회
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, 
    D.DEPARTMENT_ID, D.DEPARTMENT_NAME, 
    L.LOCATION_ID, L.STREET_ADDRESS 
FROM LOCATIONS L 
    JOIN DEPARTMENTS D ON (L.LOCATION_ID = D.LOCATION_ID) 
    JOIN EMPLOYEES E ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- 7. 국가명, 도시명, 부서명 조회
SELECT C.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME 
FROM COUNTRIES C
    JOIN LOCATIONS L ON (C.COUNTRY_ID = L.COUNTRY_ID) 
    JOIN DEPARTMENTS D ON (L.LOCATION_ID = D.LOCATION_ID);

-- 셀프 조인 (하나의 테이블에 일대다 관계를 가지는 칼럼들이 존재하는 경우)

/*
    8. 사원번호, 사원명, 매니저번호, 매니저명 조회
    
    관계: 1명의 매니저가 N명의 사원을 관리
        1                                  N
        매니저테이블: EMPLOYEES E2         사원테이블: EMPLOYEES E1
        PK: EMPLOYEE_ID                    FK: MANAGER_ID
*/
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, 
    E1.MANAGER_ID, E2.FIRST_NAME, E2.LAST_NAME 
FROM EMPLOYEES E1
    INNER JOIN EMPLOYEES E2 ON (E1.MANAGER_ID = E2.EMPLOYEE_ID);
--> 강사님 코드 참고해서 비교해보기

SELECT E.EMPLOYEE_ID AS 사원번호
     , E.LAST_NAME   AS 사원명
     , E.MANAGER_ID  AS 매니저번호
     , M.LAST_NAME   AS 매니저명
  FROM EMPLOYEES M INNER JOIN EMPLOYEES E
    ON M.EMPLOYEE_ID = E.MANAGER_ID;

SELECT * FROM EMPLOYEES;

/*
    9. 같은 부서 내에서 나보다 급여를 더 많이 받는 사원 조회
*/
SELECT ME.EMPLOYEE_ID 사원번호, ME.LAST_NAME 사원명, ME.SALARY 급여, 
    YOU.EMPLOYEE_ID 너사원번호, YOU.LAST_NAME 너사원명, YOU.SALARY 너급여 
FROM EMPLOYEES ME 
    INNER JOIN EMPLOYEES YOU ON (ME.DEPARTMENT_ID = YOU.DEPARTMENT_ID)
WHERE ME.SALARY < YOU.SALARY;

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;
SELECT * FROM COUNTRIES;