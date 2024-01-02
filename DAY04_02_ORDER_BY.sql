/*
    ORDER BY
    1. 조회 결과를 정렬할 때 사용
    2. 정렬 방식
        1) 오름차순 정렬: ASC 또는 생략
        2) 내림차순 정렬: DESC
    3. 2개 이상의 정렬 기준 추가 가능
*/

-- 1. 연봉이 높은 순으로 사원 정보 조회
SELECT * 
FROM EMPLOYEE_T 
ORDER BY SALARY DESC;

-- 2. 입사 순으로 사원 정보 조회
SELECT * 
FROM EMPLOYEE_T 
ORDER BY HIRE_DATE;

-- 3. 성별의 오름차순으로 정렬, 동일한 성별 내에서는 이름의 내림차순 정렬
SELECT * 
FROM EMPLOYEE_T 
ORDER BY GENDER ASC, NAME DESC;