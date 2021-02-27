-- TCL(TRANSACTION CONTROL LANGUAGE)
INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

COMMIT; -- COMMIT�� ����Ǵ� ���� �����Ͱ� ���̺� ����.

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022' ;
	
-------------------------------------
UPDATE
	SQLD.TB_CERTI
SET
	CERTI_NM = 'SQLD'
WHERE
	CERTI_CD = '100022' ;

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';

-------------------------------------
DELETE FROM
	SQLD.TB_CERTI
WHERE 
	CERTI_CD = '100022'
;

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';

-------------------------------------
INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

ROLLBACK; -- COMMIT ������ ���� ������ ����� �� �ִ�. ������ ���� ������ ��ҵǾ� �������� ���� ���·� �����ǰ�, ���õ� �࿡ ���� ����� Ǯ���� �ٸ� ����ڵ��� ������ ������ �� �� �ְ� �ȴ�.

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';
	
-------------------------------------
SAVEPOINT SVPT1; -- ���̺� ����Ʈ ���� ����

INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

UPDATE
	SQLD.TB_CERTI
SET
	CERTI_NM = 'SQLD'
WHERE
	CERTI_CD = '100022' ;
	
SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';
	
ROLLBACK TO SVPT1; -- ���̺� ����Ʈ �������� �ѹ�, INSERT �� UPDATE�� ��� �ѹ� ��.

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';
	
-------------------------------------
SAVEPOINT SVPT1; -- ���̺� ����Ʈ ����1 ����

INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

SAVEPOINT SVPT2; -- ���̺� ����Ʈ ����2 ����

UPDATE
	SQLD.TB_CERTI
SET
	CERTI_NM = 'SQLD'
WHERE
	CERTI_CD = '100022' ;

SAVEPOINT SVPT3; -- ���̺� ����Ʈ ����3 ����

DELETE FROM
	SQLD.TB_CERTI
WHERE 
	CERTI_CD = '100022'
	
SELECT -- DELETE�� �����͸� ������ ������ �����Ͱ� ��µ��� �ʴ´�.
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';

ROLLBACK TO SVPT3;
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; --CERTI_NM: SQLD

ROLLBACK TO SVPT2;
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; -- CERTI_NM: SQL

ROLLBACK TO SVPT1; -- ������ ����
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; -- �ƹ��͵� ��µ��� �ʴ´�

