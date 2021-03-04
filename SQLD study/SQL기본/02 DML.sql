-- DML(DATA MANIPULATION LANGUAGE)
INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100021', 'SQLD', 'SI LAB') -- ���ڵ带 �߰��Ѵ�.

COMMIT;

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100021'
	
UPDATE
	SQLD.TB_CERTI A
SET
	A.ISSUE_INSTI_NM = 'SI' -- SI LAB�� SI�� �����Ѵ�.
WHERE
	A.CERTI_CD = '100021' ;
	
COMMIT;

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100021'
	
DELETE -- ���ڵ带 �����Ѵ�.
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100021' ;

--------------------------------------
SELECT --����ϰ� ���� Į�� ���� �����Ѵ�.
	A.CERTI_CD,
	A.CERTI_NM,
	A.ISSUE_INSTI_NM
FROM
	SQLD.TB_CERTI A;

SELECT 
	DISTINCT A.ISSUE_INSTI_NM -- ISSUE_INSTI_NM Į�� �� ���� �ߺ��� ������ ������ ���� ���
FROM
	SQLD.TB_CERTI A;

SELECT 
	* -- "*"�� ��ȸ�ϸ� ��� Į���� ��ȸ�ȴ�.
FROM SQLD.TB_CERTI A;
	
--------------------------------------
SELECT -- ALIAS ����
	A.CERTI_CD AS �ڰ����ڵ�, -- AS�� �̿��Ͽ� Į���� �̸��� ������ �� �ִ�.
	A.CERTI_NM AS �ڰ�����,
	A.ISSUE_INSTI_NM AS �߱ޱ����
FROM 
	SQLD.TB_CERTI A;

--------------------------------------
SELECT -- �ռ� �����ڸ� �̿��� ���ڿ� ����
	A.CERTI_NM || '(' || A.CERTI_CD || ')' || '-' || A.ISSUE_INSTI_NM  AS CERTI_INFO -- "||"�����ڸ� �̿��Ͽ� ���ڿ��� ������ �� �ִ�.
FROM 
	SQLD.TB_CERTI A;

--------------------------------------
SELECT -- DUAL ���̺��� �̿��� ���� ����
	( (1+1)*3 ) / 6 AS CALC_RESULT
FROM 
	DUAL; -- DUAL ���̺��� 1�Ǹ� �ִ� ���̺�� Oracle���� �⺻������ ������� �ִ� ���� ���̺��̴�.