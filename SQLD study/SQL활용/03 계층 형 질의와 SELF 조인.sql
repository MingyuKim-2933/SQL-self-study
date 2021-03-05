SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "조직인원" , -- 계층 구조를 데이터에서 시각화 해주기 위해 출력한다.
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF -- 리프 데이터면 1 그렇지 않으면 0
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD -- DEPT 테이블로 조인한다.
START WITH
	A.DIRECT_MANAGER_EMP_NO IS NULL -- 루트 데이터를 지정한다.(김회장부터 시작해서 그 밑의 모든 사람이 나온다.)
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ; -- 자식 -> 부모 (순방향 전개)

------------------------------------------------
SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "조직인원" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
START WITH
	A.EMP_NM = '이경오' -- '이경오'가 루트 데이터가 되고 '이경오' 밑의 사람들만 다 나온다.
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ;

------------------------------------------------
SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "조직인원" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF ,
	CONNECT_BY_ROOT A.EMP_NO AS "최상위관리자" -- 최상위 루트 데이터가 출력된다.
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
START WITH
	A.DIRECT_MANAGER_EMP_NO IS NULL
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO;

------------------------------------------------
SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "조직인원" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF ,
	CONNECT_BY_ROOT A.EMP_NO AS "최상위관리자" ,
	SYS_CONNECT_BY_PATH(EMP_NO || '(' || EMP_NM || ')', '/') AS "조직인원경로" -- 출력될 때 경로를 출력한다.
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
START WITH
	A.EMP_NM = '이경오'
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO;

------------------------------------------------
SELECT -- SELF 조인을 활용해서 계층 관계를 표현한다.
	A.EMP_NO "사원번호" ,
	A.EMP_NM "사원이름" ,
	A.DIRECT_MANAGER_EMP_NO "관리자사원번호" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = A.DIRECT_MANAGER_EMP_NO) AS "관리자사원명" ,
	B.DIRECT_MANAGER_EMP_NO AS "차상위관리자사원번호" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = B.DIRECT_MANAGER_EMP_NO) AS "차상위관리자사원명"
FROM
	TB_EMP A
INNER JOIN TB_EMP B ON -- 김회장은 상위 관리자가 NULL이기 때문에 SELF 조인에 실패하여 데이터로 출력되지 않는다.
	(A.DIRECT_MANAGER_EMP_NO = B.EMP_NO)
JOIN TB_DEPT C ON
	(A.DEPT_CD = C.DEPT_CD) ;

------------------------------------------------
SELECT -- LEFT OUTER 조인을 활용해 왼쪽의 모든 데이터를 출력한 후 그다음 조건에 맞는 데이터를 출력한다.(김회장도 출력된다.)
	A.EMP_NO "사원번호" ,
	A.EMP_NM "사원이름" ,
	A.DIRECT_MANAGER_EMP_NO "관리자사원번호" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = A.DIRECT_MANAGER_EMP_NO) AS "관리자사원명" ,
	B.DIRECT_MANAGER_EMP_NO AS "차상위관리자사원번호" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = B.DIRECT_MANAGER_EMP_NO) AS "차상위관리자사원명"
FROM
	TB_EMP A
LEFT OUTER JOIN TB_EMP B ON
	(A.DIRECT_MANAGER_EMP_NO = B.EMP_NO)
JOIN TB_DEPT C ON
	(A.DEPT_CD = C.DEPT_CD) ;