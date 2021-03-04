SELECT -- 2���� ���̺� ����
	A.EMP_NO ,
	A.EMP_NM ,
	A.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A ,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
	AND B.DEPT_NM = '������' ;


SELECT -- 3���� ���̺� ����
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
	AND B.DEPT_NM = '������'
	AND A.EMP_NO = C.EMP_NO ;


SELECT -- 4���� ���̺� ����
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
  AND B.DEPT_NM = '������'
  AND A.EMP_NO = C.EMP_NO
  AND C.CERTI_CD = D.CERTI_CD
;