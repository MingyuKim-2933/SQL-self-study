SELECT -- UNION 연산 후 중복된 행을 제거하고 보여준다. 추가로 정렬한 후 보여준다.
	A.EMP_NO,
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- EMP_NO가 달라 이관심 사원이 두명 출력된다.

--------------------------------------------------------
SELECT -- UNION ALL 연산 후 중복된 행을 제거하지 않고 보여준다. 정렬도 하지 않는다.
	A.EMP_NO,
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ;

--------------------------------------------------------
SELECT -- UNION ALL 연산 후 중복된 행을 제거하지 않고 보여준다. 정렬도 하지 않는다.
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- 중복된 이관심 사원의 데이터가 두 번 출력된다.

--------------------------------------------------------
SELECT -- UNION 연산 후 중복된 행을 제거하고 보여준다. 추가로 정렬한 후 보여준다.
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
	A.EMP_NM,
	A.BIRTH_DE
FROM
	TB_EMP A
WHERE
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- 중복된 이관심 사원의 데이터 하나가 제거된 후 출력된다.

--------------------------------------------------------
SELECT -- INTERSECT는 잘 쓰이지 않는다. 
	A.EMP_NO,
	A.EMP_NM,
	A.ADDR,
	B.CERTI_CD,
	C.CERTI_NM
FROM
	TB_EMP A ,
	TB_EMP_CERTI B,
	TB_CERTI C
WHERE
	A.EMP_NO = B.EMP_NO
	AND B.CERTI_CD = C.CERTI_CD
	AND C.CERTI_NM = 'SQLD'
INTERSECT -- CERTI_NM이 'SQLD'인 레코드 중 ADDR에 '용인'이 들어가는 레코드
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.ADDR,
	B.CERTI_CD,
	C.CERTI_NM
FROM
	TB_EMP A ,
	TB_EMP_CERTI B,
	TB_CERTI C
WHERE
	A.EMP_NO = B.EMP_NO
	AND B.CERTI_CD = C.CERTI_CD
	AND A.ADDR LIKE '%용인%';

--------------------------------------------------------
SELECT -- 위의 결과와 같다.
	A.EMP_NO,
	A.EMP_NM,
	A.ADDR,
	B.CERTI_CD,
	C.CERTI_NM
FROM
	TB_EMP A ,
	TB_EMP_CERTI B,
	TB_CERTI C
WHERE
	A.EMP_NO = B.EMP_NO
	AND B.CERTI_CD = C.CERTI_CD
	AND C.CERTI_NM = 'SQLD'
	AND EXISTS (
	SELECT
		1
	FROM
		TB_EMP K
	WHERE
		K.EMP_NO = A.EMP_NO
		AND K.ADDR LIKE '%용인%') ;

--------------------------------------------------------	
SELECT -- 위의 결과와 같다. 간단해서 INTERSECT 대신 가장 많이 쓰인다.
	A.EMP_NO,
	A.EMP_NM,
	A.ADDR,
	B.CERTI_CD,
	C.CERTI_NM
FROM
	TB_EMP A ,
	TB_EMP_CERTI B,
	TB_CERTI C
WHERE
	A.EMP_NO = B.EMP_NO
	AND B.CERTI_CD = C.CERTI_CD
	AND C.CERTI_NM = 'SQLD'
	AND A.ADDR LIKE '%용인%';

--------------------------------------------------------
SELECT -- MINUS의 데이터들을 빼고 난 후 남은 데이터가 출력된다. 
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.DEPT_CD
FROM
	TB_EMP A MINUS
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.DEPT_CD
FROM
	TB_EMP A
WHERE
	A.DEPT_CD = '100001' MINUS
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.DEPT_CD
FROM
	TB_EMP A
WHERE
	A.DEPT_CD = '100002' MINUS
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.DEPT_CD
FROM
	TB_EMP A
WHERE
	A.DEPT_CD = '100003' MINUS
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.DEPT_CD
FROM
	TB_EMP A
WHERE
	A.SEX_CD = '1' ;