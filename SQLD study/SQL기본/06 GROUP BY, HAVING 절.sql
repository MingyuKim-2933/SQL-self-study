SELECT MAX(BIRTH_DE) -- EMP 전체에서 연산
     , MIN(BIRTH_DE)
     , COUNT(*)
 FROM TB_EMP;

-----------------------------------------------------
-- GROUP BY 절
SELECT A.DEPT_CD -- 부서별로 연산
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM -- 부서 이름 출력
     , MAX(A.BIRTH_DE) AS "가장 늦은 생년월일" 
     , MIN(A.BIRTH_DE) AS "가장 빠른 생년월일" 
     , COUNT(*) AS "직원수"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
ORDER BY A.DEPT_CD ;

-----------------------------------------------------
SELECT A.DEPT_CD -- GROUP BY절이 없어 오류가 발생한다.
     , (SELECT L.DEPT_NM 
          FROM TB_DEPT L 
         WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "가장 늦은 생년월일" 
     , MIN(A.BIRTH_DE) AS "가장 빠른 생년월일" 
     , COUNT(*) AS "직원수"
 FROM TB_EMP A
ORDER BY A.DEPT_CD ;

-----------------------------------------------------
-- HAVING 절
SELECT A.DEPT_CD
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "가장 늦은 생년월일" 
     , MIN(A.BIRTH_DE) AS "가장 빠른 생년월일" 
     , COUNT(*) AS "직원수"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.DEPT_CD ;

SELECT 
       A.EMP_NO
     , (SELECT L.EMP_NM FROM TB_EMP L WHERE L.EMP_NO = A.EMP_NO) AS EMP_NM
     , MAX(A.PAY_AMT) AS MAX_PAY_AMT
     , MIN(A.PAY_AMT) AS MIN_PAY_AMT
     , ROUND(AVG(A.PAY_AMT), 2) AS AVG_PAY_AMT          
FROM TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO
HAVING(ROUND(AVG(A.PAY_AMT), 2)) >= 4700000 -- 2019년 평균 월급 (2째 자리 반올림)
ORDER BY A.EMP_NO
;

SELECT 
       A.EMP_NO
     , (SELECT L.EMP_NM FROM TB_EMP L WHERE L.EMP_NO = A.EMP_NO) AS EMP_NM
     , SUM(A.PAY_AMT) AS SUM_PAY_AMT          
FROM TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
HAVING SUM(A.PAY_AMT) > 55000000 -- 2019년 연봉
GROUP BY A.EMP_NO
ORDER BY SUM_PAY_AMT DESC
;

-----------------------------------------------------
-- CASE WHEN문
SELECT -- 한 사람당 1씩 더한다
      SUM(CASE WHEN BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950년대생"
    , SUM(CASE WHEN BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960년대생"
    , SUM(CASE WHEN BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970년대생"
    , SUM(CASE WHEN BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980년대생"
    , SUM(CASE WHEN BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990년대생"
    , COUNT(*) CNT 
 FROM TB_EMP; 
 
 SELECT 
      DEPT_CD
    , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
    , SUM(CASE WHEN A.BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950년대생"
    , SUM(CASE WHEN A.BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960년대생"
    , SUM(CASE WHEN A.BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970년대생"
    , SUM(CASE WHEN A.BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980년대생"
    , SUM(CASE WHEN A.BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990년대생"
    , COUNT(*) CNT 
 FROM TB_EMP A
GROUP BY A.DEPT_CD
ORDER BY A.DEPT_CD; 

-----------------------------------------------------
-- 집계 함수와 널
SELECT SUM(NUM), AVG(NUM), MAX(NUM), MIN(NUM) AS SUM_NUM
FROM 
(
SELECT NULL AS NUM FROM DUAL --NULL은 연산에 포함되지 않는다. AVG를 구할 때 NULL이 포함된 절을 빼고 4를 나눈다.
UNION ALL 
SELECT 10 AS NUM FROM DUAL
UNION ALL 
SELECT 20 AS NUM FROM DUAL
UNION ALL 
SELECT 30 AS NUM FROM DUAL
UNION ALL 
SELECT 40 AS NUM FROM DUAL
)
;
 
