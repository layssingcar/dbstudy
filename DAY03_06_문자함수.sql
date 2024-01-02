-- 1. 대소문자 변환
SELECT UPPER('apple'),  -- APPLE
    LOWER('APPLE'),     -- apple
    INITCAP('APPLE')    -- Apple
FROM DUAL; 

-- 2. 글자 수/ 바이트 수 반환
SELECT NAME, 
    LENGTH(NAME) "글자 수", 
    lengthb(NAME) "바이트 수" 
FROM EMPLOYEE_T;

/*
    3. 문자 연결
        1) ||: 연결 연산자
        2) CONCAT(A B): 연결 함수
*/
SELECT 'A'|| 'B' || 'C', 
    CONCAT(CONCAT('A', 'B'), 'C') 
FROM DUAL;

SELECT * 
FROM EMPLOYEE_T 
WHERE NAME LIKE '한' || '%';

/*
    4. 특정 문자의 위치 반환
        1) 문자의 위치는 1부터 시작한다.
        2) 못 찾으면 0을 반환한다.
*/

SELECT NAME, INSTR(NAME, '이') 
FROM EMPLOYEE_T;

-- 5. 일부 문자열 반환
SELECT NAME, 
    SUBSTR(NAME, 1, 1) 성, -- 1번째 글자부터 1글자 반환
    SUBSTR(NAME, 2) 이름 -- 2번째 글자부터 마지막까지 반환
FROM EMPLOYEE_T;

-- 이름 가운데 글자 애스터리스크 처리
SELECT SUBSTR(NAME, 1, 1) || '*' || SUBSTR(NAME, 3) 이름 
FROM EMPLOYEE_T;

-- 찾아 바꾸기
SELECT REPLACE(DEPT_NAME, '부', '팀') 부서
FROM DEPARTMENT_T;

SELECT REPLACE(DEPT_NAME, '부', '') 부서 
FROM DEPARTMENT_T;

/*
    7. 채우기
        1) LPAD(EXPR1, N, EXPR2): N자리의 EXPR1을 반환, 왼쪽에 EXPR2를 채움
        2) RPAD(EXPR1, N, EXPR2): N자리의 EXPR1을 반환, 오른쪽에 EXPR2를 채움
*/

-- 주의: 영어는 10자리이지만 한글은 5자리이다.
SELECT LPAD(NAME, 10, '*'),
    RPAD(NAME, 10, '*')
FROM EMPLOYEE_T;

/*
    8. 공백 제거
        1) LTRIM(EXPR): 왼쪽 공백 제거
        2) RTRIM(EXPR): 오른쪽 공백 제거
        3) TRIM(EXPR): 왼쪽/오른쪽 공백 제거
*/

SELECT LTRIM('   HELLO   WORLD   '), 
    RTRIM('   HELLO   WORLD   '), 
    TRIM('   HELLO   WORLD   ')
FROM DUAL;