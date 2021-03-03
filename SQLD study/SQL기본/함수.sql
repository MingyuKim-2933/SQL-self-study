SELECT -- 문자 형 함수
      LOWER('SQL Developoer') AS "LOWER('SQL Developoer')" --소문자로 변환
    , UPPER('SQL Developoer') AS "UPPER('SQL Developoer')" --대문자로 변환  
    , ASCII('A') AS "ASCII('A')" --아스키코드값 출력
    , CHR('65') AS "CHR('65')" --아스키코드값의 문자 출력
    , CONCAT('SQL', 'Developoer') AS "CONCAT('SQL', 'Developoer')" --문자열 결함
    , SUBSTR('SQL Developoer', 1, 3) AS "SUBSTR('SQL Developoer', 1, 3)" --문자열 잘라내기
    , LENGTH('SQL') AS "LENGTH('SQL')" --문자열의 길이 출력
    , LTRIM(' SQL') AS "LTRIM(' SQL')" --왼쪽 공백 제거
    , RTRIM('SQL ') AS "RTRIM('SQL ')" --오른쪽 공백 제거 
 FROM DUAL
 ;

-----------------------------------------------------
SELECT -- 숫자 형 함수
      ABS(-15) AS "ABS(-15)"  --절대값을 반환
    , SIGN(1) AS "SIGN(1)"  --사인값을 반환
    , MOD(8,3) AS "MOD(8,3)" --나머지를 반환
    , CEIL(38.678) AS "CEIL(38.678)" --무조건 올림
    , FLOOR(38.678) AS "FLOOR(38.678)" --무조건 버림
    , ROUND(38.678, 2) AS "ROUND(38.678, 2)" --소수점 2번째 자리에서 반올림
    , TRUNC(38.678) AS "TRUNC(38.678)" --0의 자리에서 무조건 자름
    , TRUNC(38.678, 1) AS "TRUNC(38.678, 1)" --1의 자리에서 무조건 자름
    , TRUNC(38.678, 2) AS "TRUNC(38.678, 2)" --2의 자리에서 무조건 자름 
    , TRUNC(38.678, 3) AS "TRUNC(38.678, 3)" --3의 자리에서 무조건 자름 
 FROM DUAL
 ;

-----------------------------------------------------
-- 날짜 형 데이터 변환 함수
  SELECT SYSDATE AS "SYSDATE" --현재 년월일시분초 출력
     , EXTRACT(YEAR FROM SYSDATE) AS "EXTRACT(YEAR FROM SYSDATE)" --년 출력
     , EXTRACT(MONTH FROM SYSDATE) AS "EXTRACT(MONTH FROM SYSDATE)" --월 출력
     , EXTRACT(DAY FROM SYSDATE) AS "EXTRACT(DAY FROM SYSDATE)" --일 출력 
     , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))" --년 출력
     , TO_NUMBER(TO_CHAR(SYSDATE, 'MM')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))" --월  출력
     , TO_NUMBER(TO_CHAR(SYSDATE, 'DD')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'DD'))" --일 출력 
     , TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))" --시 출력
     , TO_NUMBER(TO_CHAR(SYSDATE, 'MI')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MI'))" --분 출력
     , TO_NUMBER(TO_CHAR(SYSDATE, 'SS')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))" --초 출력
     , TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')" --년 출력(문자열)
     , TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')" --월 출력(문자열)
     , TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD')" --일 출력(문자열)
     , TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')" --시 출력(문자열)
     , TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')" --분 출력(문자열)
     , TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'SS')" --초 출력(문자열)    
  FROM DUAL; 


-----------------------------------------------------
SELECT -- 날짜형 데이터 연산
       SYSDATE AS "SYSDATE" --현재 년월일 시분초
     , SYSDATE - 1 AS "SYSDATE - 1" --1일을 뺀 년월일 시분초 
     , SYSDATE - (1/24) AS "SYSDATE - (1/24)" --1시간을뺀 년월일 시분초
     , SYSDATE - (1/24/60) AS "SYSDATE - (1/24/60)" --1분을뺀 년월일 시분초
     , SYSDATE - (1/24/60/60) AS "SYSDATE - (1/24/60/60)" --1초을뺀 년월일 시분초
     , SYSDATE - (1/24/60/60) * 10 AS "SYSDATE - (1/24/60/60) * 10" --10초을뺀 년월일 시분초
     , SYSDATE - (1/24/60/60) * 30 AS "SYSDATE - (1/24/60/60) * 30" --30초을뺀 년월일 시분초
  FROM DUAL 
;

-----------------------------------------------------
SELECT -- 데이터 변환의 종류
       TO_CHAR(SYSDATE, 'YYYY/MM/DD') "TO_CHAR(SYSDATE, 'YYYY/MM/DD')" 
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') "TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')"
     , TO_CHAR(10.25, '$999,999,999.99') AS "TO_CHAR(10.25, '$999,999,999.99')"
     , TO_CHAR(12500, 'L999,999,999') AS "TO_CHAR(10.25, '$999,999,999.99')"
     , TO_NUMBER('100') + TO_NUMBER('100') AS "TO_CHAR(10.25, '$999,999,999.99')"
  FROM DUAL
; 

-----------------------------------------------------
-- 단일 행 CASE, DECODE
SELECT CASE WHEN SAL_CD = '100001' THEN '기본급'
            WHEN SAL_CD = '100002' THEN '상여급'
            WHEN SAL_CD = '100003' THEN '특별상여급'
            WHEN SAL_CD = '100004' THEN '야근수당'
            WHEN SAL_CD = '100005' THEN '주말수당'
            WHEN SAL_CD = '100006' THEN '점심식대'
            WHEN SAL_CD = '100007' THEN '복지포인트'
            ELSE '유효하지않음'
            END SAL_NM
  FROM TB_SAL
; 

SELECT DECODE(SAL_CD, '100001', '기본급', '100002', '상여급', '기타')  AS SAL_NM
  FROM TB_SAL 
;  

-----------------------------------------------------
SELECT NVL(DIRECT_MANAGER_EMP_NO, '최상위자') AS 관리자 --관리자사원번호가 NULL이면 "최상위자"로 출력
  FROM TB_EMP
 WHERE DIRECT_MANAGER_EMP_NO IS NULL; 

SELECT NVL(UPPER_DEPT_CD , '최상위부서') AS 상위부서
  FROM TB_DEPT
 WHERE UPPER_DEPT_CD  IS NULL;


SELECT NVL(MAX(EMP_NM), '존재안함') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '김회장';

SELECT NVL(MAX(EMP_NM), '존재안함') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '박찬호'; 

SELECT NULLIF('박찬호', '박지성') --같지않으면 박찬호 리턴
FROM DUAL
;

SELECT NVL(NULLIF('박찬호', '박찬호'), '같으면널')
FROM DUAL
;


SELECT COALESCE(NULL, NULL, 0) AS SAL
FROM DUAL;

SELECT COALESCE(5000, NULL, 0) AS SAL
FROM DUAL;

SELECT COALESCE(NULL, 6000, 0) AS SAL
FROM DUAL;