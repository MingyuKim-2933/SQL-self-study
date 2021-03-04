-- DML(DATA MANIPULATION LANGUAGE)
INSERT INTO SQLD.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM) VALUES ('100021', 'SQLD', 'SI LAB') -- 레코드를 추가한다.

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
	A.ISSUE_INSTI_NM = 'SI' -- SI LAB을 SI로 변경한다.
WHERE
	A.CERTI_CD = '100021' ;
	
COMMIT;

SELECT
	*
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100021'
	
DELETE -- 레코드를 삭제한다.
FROM
	SQLD.TB_CERTI A
WHERE
	A.CERTI_CD = '100021' ;

--------------------------------------
SELECT --출력하고 싶은 칼럼 명을 기재한다.
	A.CERTI_CD,
	A.CERTI_NM,
	A.ISSUE_INSTI_NM
FROM
	SQLD.TB_CERTI A;

SELECT 
	DISTINCT A.ISSUE_INSTI_NM -- ISSUE_INSTI_NM 칼럼 값 기준 중복을 제거한 유일한 값만 출력
FROM
	SQLD.TB_CERTI A;

SELECT 
	* -- "*"로 조회하면 모든 칼럼이 조회된다.
FROM SQLD.TB_CERTI A;
	
--------------------------------------
SELECT -- ALIAS 지정
	A.CERTI_CD AS 자격증코드, -- AS를 이용하여 칼럼의 이름을 지정할 수 있다.
	A.CERTI_NM AS 자격증명,
	A.ISSUE_INSTI_NM AS 발급기관명
FROM 
	SQLD.TB_CERTI A;

--------------------------------------
SELECT -- 합성 연산자를 이용한 문자열 연결
	A.CERTI_NM || '(' || A.CERTI_CD || ')' || '-' || A.ISSUE_INSTI_NM  AS CERTI_INFO -- "||"연산자를 이용하여 문자열을 연결할 수 있다.
FROM 
	SQLD.TB_CERTI A;

--------------------------------------
SELECT -- DUAL 테이블을 이용한 연산 수행
	( (1+1)*3 ) / 6 AS CALC_RESULT
FROM 
	DUAL; -- DUAL 테이블은 1건만 있는 테이블로 Oracle에서 기본적으로 만들어져 있는 더미 테이블이다.
