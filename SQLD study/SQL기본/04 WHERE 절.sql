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
	AND A.DEPT_CD IN ('100004', '100006') -- 디자인팀, 데이터팀 (IN은 데이터 중 하나만 있어도 출력된다.)
	AND A.ADDR LIKE '%수원시%' -- "수원시"에 사는 사람
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
	A.EMP_NM LIKE '박__'
;

------------------------------------------------------
SELECT 
	A.EMP_NO,
	A.EMP_NM,
	A.SEX_CD,
	A.BIRTH_DE,
	A.DEPT_CD,
	A.ADDR,
	NVL(A.DIRECT_MANAGER_EMP_NO, '상사없음') DIRECT_MANAGER_EMP_NO -- NVL 함수는 값이 NULL일 경우 지정값을 출력한다.
FROM 
	TB_EMP A
WHERE
	A.DIRECT_MANAGER_EMP_NO IS NULL -- NULL은 '='로 비교할 수 없음
;

------------------------------------------------------
SELECT -- 수원시 혹은 성남시에 사는 사람을 포함한다.
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
	AND A.DEPT_CD IN ('100004', '100006') -- 디자인팀, 데이터팀 (IN은 데이터 중 하나만 있어도 출력된다.)
	AND( A.ADDR LIKE '%수원시%' -- "수원시"에 사는 사람
	OR A.ADDR LIKE '%성남시%' -- "성남시"에 사는 사람
	)
;

------------------------------------------------------
SELECT -- 수원시 혹은 성남시에 사는 사람을 제거한다.
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
	AND A.DEPT_CD IN ('100004', '100006') -- 디자인팀, 데이터팀 (IN은 데이터 중 하나만 있어도 출력된다.)
	AND NOT ( A.ADDR LIKE '%수원시%' -- "수원시"에 사는 사람
	OR A.ADDR LIKE '%성남시%' -- "성남시"에 사는 사람
	)
;

------------------------------------------------------
SELECT -- 비교 연산자
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	SQLD.TB_SAL_HIS A
WHERE
	A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND A.PAY_AMT >= 5500000 -- 550만원 이상
;

SELECT -- 부정 비교 연산자
	A.SAL_HIS_NO,
	A.PAY_DE,
	A.PAY_AMT,
	A.EMP_NO
FROM
	SQLD.TB_SAL_HIS A
WHERE
	A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND NOT A.PAY_AMT >= 5500000 -- 550만원 미만
;

------------------------------------------------------
SELECT -- <> 연산자의 사용
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
	AND A.DEPT_CD IN ('100004', '100006') -- 디자인팀, 데이터팀 (IN은 데이터 중 하나만 있어도 출력된다.)
	AND A.SEX_CD <> '1' -- 성별코드가 1이 아닌 데이터 (<>: 같지 않다.)

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
	A.BIRTH_DE NOT BETWEEN '19900101' AND '19991231' -- 90년대 생이 아니다.
	AND A.DEPT_CD NOT IN ('100004', '100006') -- 디자인팀, 데이터팀이 아니다. (NOT IN은 리스트의 값과 전부 맞지 않아야 출력된다.)
	AND A.SEX_CD <> '1' -- 성별코드가 1이 아닌 데이터 (<>: 같지 않다.)
	AND DIRECT_MANAGER_EMP_NO IS NOT NULL -- 직속 관리자 사원번호가 존재하는 직원
	
------------------------------------------------------	
DROP TABLE SQLD.CHAR_COMPARE;
CREATE TABLE SQLD.CHAR_COMPARE -- 양쪽이 모두 CHAR 타입인 경우 문자유형 비교 방법
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
	AND CHAR_COMPARE_4 = CHAR_COMPARE_6 -- 양쪽이 모두 CHAR 타입인 경우 공백의 수만 다르다면 같은 값으로 결정된다.
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS CHAR_COMPARE_4,
	REPLACE(CHAR_COMPARE_6, ' ', '_') AS CHAR_COMPARE_6
FROM
	SQLD.CHAR_COMPARE
WHERE 
	SN = '1000000002'
	AND CHAR_COMPARE_4 > CHAR_COMPARE_6 -- 달라진 첫번째 값에 따라 크기를 결정 -> A와 D를 비교 -> 알파벳 D가 더 큼
;

------------------------------------------------------
DROP TABLE SQLD.VARCHAR_COMPARE;
CREATE TABLE SQLD.VARCHAR_COMPARE -- 비교연산자중 한쪽이 VARCHAR인 경우
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
	AND CHAR_COMPARE_4 = VARCHAR_COMPARE_6 -- VARCHAR는 공백도 문자로 판단한다.
;

SELECT
	REPLACE(CHAR_COMPARE_4, ' ', '_') AS VARCHAR_COMPARE_4,
	REPLACE(VARCHAR_COMPARE_6, ' ', '_') AS VARCHAR_COMPARE_6
FROM
	SQLD.VARCHAR_COMPARE
WHERE 
	SN = '1000000001'
	AND CHAR_COMPARE_4 = TRIM(VARCHAR_COMPARE_6) -- TRIM 함수는 공백을 지워버린다.
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
	AND VARCHAR_COMPARE_6 = 'SQLD  ' -- VARCHAR은 공백도 문자로 판단한다.
;

------------------------------------------------------
SELECT -- 집합의 일부분만을 출력한다. 이 때 랜덤으로 10개의 데이터를 가져온 상태에서 내림차순 정렬한다.
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

SELECT -- 집합의 일부분만을 출력한다. 이 때 내림차순 정렬한 집합 중 상위 10건을 내림차순으로 출력한다.
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
	