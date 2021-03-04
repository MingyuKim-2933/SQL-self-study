-- TCL(TRANSACTION CONTROL LANGUAGE)
INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

COMMIT; -- COMMIT이 실행되는 순간 데이터가 테이블에 들어간다.

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

ROLLBACK; -- COMMIT 이전에 변경 사항을 취소할 수 있다. 데이터 변경 사항이 취소되어 데이터의 이전 상태로 복구되고, 관련된 행에 대한 잠금이 풀리고 다른 사용자들이 데이터 변경을 할 수 있게 된다.

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';
	
-------------------------------------
SAVEPOINT SVPT1; -- 세이브 포인트 지점 설정

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
	
ROLLBACK TO SVPT1; -- 세이브 포인트 지점으로 롤백, INSERT 및 UPDATE는 모두 롤백 됨.

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';
	
-------------------------------------
SAVEPOINT SVPT1; -- 세이브 포인트 지점1 설정

INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100022', 'SQL', 'SI LAB');

SAVEPOINT SVPT2; -- 세이브 포인트 지점2 설정

UPDATE
	SQLD.TB_CERTI
SET
	CERTI_NM = 'SQLD'
WHERE
	CERTI_CD = '100022' ;

SAVEPOINT SVPT3; -- 세이브 포인트 지점3 설정

DELETE FROM
	SQLD.TB_CERTI
WHERE 
	CERTI_CD = '100022'
	
SELECT -- DELETE로 데이터를 지웠기 때문에 데이터가 출력되지 않는다.
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100022';

ROLLBACK TO SVPT3;
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; --CERTI_NM: SQLD

ROLLBACK TO SVPT2;
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; -- CERTI_NM: SQL

ROLLBACK TO SVPT1; -- 데이터 없음
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022' ; -- 아무것도 출력되지 않는다

