/*
    다대다 관계
    
    1. 2개의 테이블을 직접 관계 짓는 것은 불가능하다.
    2. 다대다 관계를 갖는 2개의 테이블과 연결될 중간 테이블이 필요하다.
    3. 일대다 관계를 2개 만들면 다대다 관계가 된다.
*/

-- 학생 테이블
CREATE TABLE STUDENT (
    STD_NO NUMBER NOT NULL PRIMARY KEY, 
    STD_NAME VARCHAR2(10) NOT NULL, 
    STD_GRADE NUMBER NOT NULL, 
    STD_CLASS NUMBER NOT NULL, 
    STD_PHONE NUMBER NOT NULL
);

-- 과목 테이블
CREATE TABLE SUBJECT (
    SUBJ_NO NUMBER NOT NULL PRIMARY KEY, 
    SUBJ_NAME VARCHAR2(20) NOT NULL
);

-- 수강신청 테이블
CREATE TABLE APPLICATE (
    APP_NO NUMBER NOT NULL PRIMARY KEY, 
    STD_NO NUMBER REFERENCES STUDENT(STD_NO) ON DELETE CASCADE,     -- 학생이 지워지면 수강신청도 지워짐 
    SUBJ_NO NUMBER REFERENCES SUBJECT(SUBJ_NO) ON DELETE SET NULL   -- 과목이 지워지면 수강신청에서 과목 번호만 지워짐
);

-- 수강신청 테이블 삭제
DROP TABLE APPLICATE;

-- 과목 테이블 삭제
DROP TABLE SUBJECT;

-- 학생 테이블 삭제
DROP TABLE STUDENT;