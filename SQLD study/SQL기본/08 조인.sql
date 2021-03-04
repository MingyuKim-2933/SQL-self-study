SELECT -- 2개의 테이블 조인
	A.EMP_NO ,
	A.EMP_NM ,
	A.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A ,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
	AND B.DEPT_NM = '지원팀' ;


SELECT -- 3개의 테이블 조인
	A.EMP_NO ,
	A.EMP_NM ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	C.CERTI_CD
FROM
	TB_EMP A ,
	TB_DEPT B ,
	TB_EMP_CERTI C
WHERE
	A.DEPT_CD = B.DEPT_CD
	AND B.DEPT_NM = '지원팀'
	AND A.EMP_NO = C.EMP_NO ;


SELECT -- 4개의 테이블 조인
      A.EMP_NO
    , A.EMP_NM
    , A.DEPT_CD
    , B.DEPT_NM
    , C.CERTI_CD
    , D.CERTI_NM
 FROM TB_EMP A
    , TB_DEPT B
    , TB_EMP_CERTI C
    , TB_CERTI D
WHERE A.DEPT_CD = B.DEPT_CD
  AND B.DEPT_NM = '지원팀'
  AND A.EMP_NO = C.EMP_NO
  AND C.CERTI_CD = D.CERTI_CD
;