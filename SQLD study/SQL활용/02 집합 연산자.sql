SELECT -- UNION ���� �� �ߺ��� ���� �����ϰ� �����ش�. �߰��� ������ �� �����ش�.
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
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- EMP_NO�� �޶� �̰��� ����� �θ� ��µȴ�.

--------------------------------------------------------
SELECT -- UNION ALL ���� �� �ߺ��� ���� �������� �ʰ� �����ش�. ���ĵ� ���� �ʴ´�.
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
SELECT -- UNION ALL ���� �� �ߺ��� ���� �������� �ʰ� �����ش�. ���ĵ� ���� �ʴ´�.
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
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- �ߺ��� �̰��� ����� �����Ͱ� �� �� ��µȴ�.

--------------------------------------------------------
SELECT -- UNION ���� �� �ߺ��� ���� �����ϰ� �����ش�. �߰��� ������ �� �����ش�.
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
	A.BIRTH_DE BETWEEN '19700101' AND '197901231' ; -- �ߺ��� �̰��� ����� ������ �ϳ��� ���ŵ� �� ��µȴ�.

--------------------------------------------------------
SELECT -- INTERSECT�� �� ������ �ʴ´�. 
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
INTERSECT -- CERTI_NM�� 'SQLD'�� ���ڵ� �� ADDR�� '����'�� ���� ���ڵ�
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
	AND A.ADDR LIKE '%����%';

--------------------------------------------------------
SELECT -- ���� ����� ����.
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
		AND K.ADDR LIKE '%����%') ;

--------------------------------------------------------	
SELECT -- ���� ����� ����. �����ؼ� INTERSECT ��� ���� ���� ���δ�.
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
	AND A.ADDR LIKE '%����%';

--------------------------------------------------------
SELECT -- MINUS�� �����͵��� ���� �� �� ���� �����Ͱ� ��µȴ�. 
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