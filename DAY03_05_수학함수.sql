-- 1. 절댓값
SELECT ABS(-5) 
FROM DUAL;

-- 2. 제곱근(루트)
SELECT SQRT(25) 
FROM DUAL;

-- 3. 제곱
SELECT POWER(2, 3) 
FROM DUAL;

-- 4. 나머지
SELECT MOD(5, 2) 
FROM DUAL;

-- 5. 정수 올림
SELECT CEIL(1.1) 
FROM DUAL;

-- 6. 정수 내림
SELECT FLOOR(1.9) 
FROM DUAL;

-- 7. 원하는 자리수로 반올림
SELECT ROUND(123.456),  -- 123 (정수 반올림)
    ROUND(123.456, 1),  -- 123.5 (소수 1자리까지 반올림)
    ROUND(123.456, 2),  -- 123.46 (소수 2자리까지 반올림)
    ROUND(123.456, -1), -- 120 (일의 자리 반올림)
    ROUND(123.456, -2)  -- 100 (십의 자리 반올림)
FROM DUAL;

-- 8. 원하는 자리수로 절사
SELECT TRUNC(123.456),  -- 123 (정수로 절사)
    TRUNC(123.456, 2),  -- 123.45 (소수 2자리로 절사)
    TRUNC(123.456, 1),  -- 123.4 (소수 1자리로 절사)
    TRUNC(123.456, -1), -- 120 (일의 자리 절사)
    TRUNC(123.456, -2)  -- 100 (십의 자리 절사)
FROM DUAL;

-- * FLOOR과 TRUNC의 차이 (음수)
SELECT FLOOR(-1.9) 
FROM DUAL; -- -2

SELECT TRUNC(-1.9) 
FROM DUAL; -- -1

-- 올림(CEIL), 내림(FLOOR) 자리수 처리 (POWER 강사님 코드 참고)
SELECT CEIL(123.456 * 10) / 10, -- 123.5 
    CEIL(123.456 * 100) / 100   -- 123.46
FROM DUAL;