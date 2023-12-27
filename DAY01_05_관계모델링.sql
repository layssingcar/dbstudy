-- 부서 테이블
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO VARCHAR2(15) NOT NULL PRIMARY KEY, 
    DEPT_NAME VARCHAR2(30), 
    DEPT_LOCATION VARCHAR2(50)
);

-- 프로젝트 테이블
CREATE TABLE PROJECT_TBL (
    PJT_NO NUMBER NOT NULL PRIMARY KEY, 
    PJT_NAME VARCHAR2(30), 
    BEGIN_DATE DATE, 
    END_DATE DATE
);

-- 사원 테이블
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO NUMBER NOT NULL PRIMARY KEY, 
    DEPT_NO VARCHAR2(15) REFERENCES DEPARTMENT_TBL(DEPT_NO) ON DELETE SET NULL,
    POSITION CHAR(10), 
    NAME VARCHAR2(15), 
    HIRE_DATE DATE, 
    SALARY NUMBER
);

-- 프로젝트 진행 테이블
CREATE TABLE PROCEEDING_TBL (
    PCD_NO NUMBER NOT NULL PRIMARY KEY, 
    EMP_NO NUMBER REFERENCES EMPLOYEE_TBL(EMP_NO) ON DELETE CASCADE,
    PJT_NO NUMBER REFERENCES PROJECT_TBL(PJT_NO) ON DELETE SET NULL,
    PJT_STATE NUMBER NOT NULL
);

-- 프로젝트 진행 테이블 삭제
DROP TABLE PROCEEDING_TBL;

-- 사원 테이블 삭제
DROP TABLE EMPLOYEE_TBL;

-- 프로젝트 테이블 삭제
DROP TABLE PROJECT_TBL;

-- 부서 테이블 삭제
DROP TABLE DEPARTMENT_TBL;