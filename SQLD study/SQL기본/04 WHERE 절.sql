SELECT 
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR
FROM 
	TB_EMP A
WHERE 
	A.BIRTH_DE BETWEEN '19900101' AND '19991231'
	AND A.DEPT_CD IN ('100004', '100006') -- ��������, �������� (IN�� ������ �� �ϳ��� �־ ��µȴ�.)
	AND A.ADDR LIKE '%������%' -- "������"�� ��� ���
;	

------------------------------------------------------
SELECT 
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR
FROM 
	TB_EMP A
WHERE
	A.EMP_NM LIKE '��__'
;

------------------------------------------------------
SELECT 
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR,
	NVL(A.DIRECT_MANAGER_EMP_NO, '������') DIRECT_MANAGER_EMP_NO -- NVL �Լ��� ���� NULL�� ��� �������� ����Ѵ�.
FROM 
	TB_EMP A
WHERE
	A.DIRECT_MANAGER_EMP_NO IS NULL -- NULL�� '='�� ���� �� ����
;

------------------------------------------------------
SELECT -- ������ Ȥ�� �����ÿ� ��� ����� �����Ѵ�.
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR
FROM 
	TB_EMP A
WHERE 
	A.BIRTH_DE BETWEEN '19900101' AND '19991231'
	AND A.DEPT_CD IN ('100004', '100006') -- ��������, �������� (IN�� ������ �� �ϳ��� �־ ��µȴ�.)
	AND( A.ADDR LIKE '%������%' -- "������"�� ��� ���
	OR A.ADDR LIKE '%������%' -- "������"�� ��� ���
	)
;

------------------------------------------------------
SELECT -- ������ Ȥ�� �����ÿ� ��� ����� �����Ѵ�.
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR
FROM 
	TB_EMP A
WHERE 
	A.BIRTH_DE BETWEEN '19900101' AND '19991231'
	AND A.DEPT_CD IN ('100004', '100006') -- ��������, �������� (IN�� ������ �� �ϳ��� �־ ��µȴ�.)
	AND NOT ( A.ADDR LIKE '%������%' -- "������"�� ��� ���
	OR A.ADDR LIKE '%������%' -- "������"�� ��� ���
	)
;

------------------------------------------------------
SELECT -- �� ������
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	SQLD.TB_SAL_HIS A
WHERE
	A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND A.PAY_AMT >= 5500000 -- 550���� �̻�
;

SELECT -- ���� �� ������
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	SQLD.TB_SAL_HIS A
WHERE
	A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND NOT A.PAY_AMT >= 5500000 -- 550���� �̸�
;

------------------------------------------------------
SELECT -- <> �������� ���
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR
FROM 
	TB_EMP A
WHERE 
	A.BIRTH_DE BETWEEN '19900101' AND '19991231'
	AND A.DEPT_CD IN ('100004', '100006') -- ��������, �������� (IN�� ������ �� �ϳ��� �־ ��µȴ�.)
	AND A.SEX_CD <> '1' -- �����ڵ尡 1�� �ƴ� ������ (<>: ���� �ʴ�.)

------------------------------------------------------	
SELECT
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR,
	A.DIRECT_MANAGER_EMP_NO 
FROM 
	TB_EMP A
WHERE 
	A.BIRTH_DE NOT BETWEEN '19900101' AND '19991231' -- 90��� ���� �ƴϴ�.
	AND A.DEPT_CD NOT IN ('100004', '100006') -- ��������, ���������� �ƴϴ�. (NOT IN�� ����Ʈ�� ���� ���� ���� �ʾƾ� ��µȴ�.)
	AND A.SEX_CD <> '1' -- �����ڵ尡 1�� �ƴ� ������ (<>: ���� �ʴ�.)
	AND DIRECT_MANAGER_EMP_NO IS NOT NULL -- ���� ������ �����ȣ�� �����ϴ� ����
	
------------------------------------------------------	
DROP TABLE SQLD.CHAR_COMPARE;
CREATE TABLE SQLD.CHAR_COMPARE -- ������ ��� CHAR Ÿ���� ��� �������� �� ���
(
	SN CHAR(10),
	CHAR_COMPARE_4 CHAR(4),
	CHAR_COMPARE_6 CHAR(6)
)
;

INSERT INTO SQLD.CHAR_COMPARE VALUES ('1000000001', 'SQLD', 'SQLD');
INSERT INTO SQLD.CHAR_COMPARE VALUES ('1000000002', 'SQLD', 'SQLA');
COMMIT;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS CHAR_COMPARE_4,
	REPLACE(CHAR_COMPARE_6, ' ', '_') AS CHAR_COMPARE_6
FROM
	SQLD.CHAR_COMPARE
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS CHAR_COMPARE_4,
	REPLACE(CHAR_COMPARE_6, ' ', '_') AS CHAR_COMPARE_6
FROM
	SQLD.CHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND CHAR_COMPARE_4 = CHAR_COMPARE_6 -- ������ ��� CHAR Ÿ���� ��� ������ ���� �ٸ��ٸ� ���� ������ �����ȴ�.
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS CHAR_COMPARE_4,
	REPLACE(CHAR_COMPARE_6, ' ', '_') AS CHAR_COMPARE_6
FROM
	SQLD.CHAR_COMPARE
WHERE 
	SN = '1000000002'
	AND CHAR_COMPARE_4 > CHAR_COMPARE_6 -- �޶��� ù��° ���� ���� ũ�⸦ ���� -> A�� D�� �� -> ���ĺ� D�� �� ŭ
;

------------------------------------------------------
DROP TABLE SQLD.VARCHAR_COMPARE;
CREATE TABLE SQLD.VARCHAR_COMPARE -- �񱳿������� ������ VARCHAR�� ���
(
	SN CHAR(10),
	CHAR_COMPARE_4 CHAR(4),
	VARCHAR_COMPARE_6 VARCHAR2(6)
)
;

INSERT INTO SQLD.VARCHAR_COMPARE VALUES ('1000000001', 'SQLD', 'SQLD  ');
INSERT INTO SQLD.VARCHAR_COMPARE VALUES ('1000000002', 'SQLD', 'SQLA  ');
COMMIT;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND CHAR_COMPARE_4 = VARCHAR_COMPARE_6 -- VARCHAR�� ���鵵 ���ڷ� �Ǵ��Ѵ�.
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND CHAR_COMPARE_4 = TRIM(VARCHAR_COMPARE_6) -- TRIM �Լ��� ������ ����������.
;

------------------------------------------------------
SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND CHAR_COMPARE_4 = 'SQLD'
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND VARCHAR_COMPARE_6 = 'SQLD  ' -- VARCHAR�� ���鵵 ���ڷ� �Ǵ��Ѵ�.
;

------------------------------------------------------
SELECT -- ������ �Ϻκи��� ����Ѵ�. �� �� �������� 10���� �����͸� ������ ���¿��� �������� �����Ѵ�.
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	SQLD.TB_SAL_HIS A
WHERE 
	A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND ROWNUM <= 10
ORDER BY A.PAY_AMT DESC
;

SELECT -- ������ �Ϻκи��� ����Ѵ�. �� �� �������� ������ ���� �� ���� 10���� ������������ ����Ѵ�.
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	(
	SELECT
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
	FROM
		SQLD.TB_SAL_HIS A
	WHERE 
		A.PAY_DE >= '20200501'
		AND A.PAY_DE <= '20200531'
		ORDER BY A.PAY_AMT DESC
	) A
WHERE 
	ROWNUM <= 10
;
	