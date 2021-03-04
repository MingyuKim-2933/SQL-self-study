SELECT
      A.CERTI_CD
    , A.CERTI_NM
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM; -- DEFAULT은 오름차순으로 정렬(ASC)

SELECT -- 역순 정렬
      A.CERTI_CD
    , A.CERTI_NM
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC; -- DESC: 내림차순으로 정렬

-----------------------------------------------------
-- NULL 포함 정렬
SELECT
      A.EMP_NO
    , A.EMP_NM
    , A.BIRTH_DE
    , A.ADDR
    , A.TEL_NO
    , A.DIRECT_MANAGER_EMP_NO
 FROM TB_EMP A 
WHERE BIRTH_DE LIKE '196%'
ORDER BY A.DIRECT_MANAGER_EMP_NO DESC; -- 오라클에서는 내림차순으로 정렬할 때 NULL값이 가장 크다고 인식하여 위에 위치한다.

SELECT -- SELECT절에 기재하지 않은 칼럼을 기준으로 ORDER BY해도 정상적으로 실행됨.
      A.CERTI_CD
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC;


----------------------------------------------------- 
-- HAVING 절의 결과를 정렬
SELECT A.DEPT_CD
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "가장 늦은 생년월일" 
     , MIN(A.BIRTH_DE) AS "가장 빠른 생년월일" 
     , COUNT(*) AS "직원수"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.DEPT_CD ;


SELECT A.DEPT_CD
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "가장 늦은 생년월일" 
     , MIN(A.BIRTH_DE) AS "가장 빠른 생년월일" 
     , COUNT(*) AS "직원수"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.EMP_NM ; -- GROUP BY 절과 같이 쓰이는 ORDER BY는 일반 칼럼을 사용 할 수 없고 GROUP BY 절의 칼럼 기준으로만 정렬가능

-----------------------------------------------------
-- ORDER BY와 부분 범위 처리
SELECT A.SAL_HIS_NO -- 랜덤으로 10건이 나오는데 나온 결과 집합 10건을 내림차순으로 정렬한다.
     , A.PAY_DE
     , A.PAY_AMT
     , A.EMP_NO
  FROM SQLD.TB_SAL_HIS A
 WHERE A.PAY_DE >= '20200501'
   AND A.PAY_DE <= '20200531'
   AND ROWNUM <= 10
 ORDER BY A.PAY_AMT DESC 
 ;
 
  SELECT A.SAL_HIS_NO -- 급여가 높은 순으로 정렬 후 10건을 뽑아 리턴한다.
      , A.PAY_DE
      , A.PAY_AMT
      , A.EMP_NO 
   FROM 
      (
       SELECT
              A.SAL_HIS_NO
            , A.PAY_DE
            , A.PAY_AMT
            , A.EMP_NO
         FROM SQLD.TB_SAL_HIS A
        WHERE A.PAY_DE >= '20200501'
          AND A.PAY_DE <= '20200531'   
        ORDER BY A.PAY_AMT DESC 
     ) A 
 WHERE ROWNUM <= 10
 ; 