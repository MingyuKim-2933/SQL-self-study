SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "�����ο�" , -- ���� ������ �����Ϳ��� �ð�ȭ ���ֱ� ���� ����Ѵ�.
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF -- ���� �����͸� 1 �׷��� ������ 0
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD -- DEPT ���̺�� �����Ѵ�.
START WITH
	A.DIRECT_MANAGER_EMP_NO IS NULL -- ��Ʈ �����͸� �����Ѵ�.(��ȸ����� �����ؼ� �� ���� ��� ����� ���´�.)
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ; -- �ڽ� -> �θ� (������ ����)

------------------------------------------------
SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "�����ο�" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
START WITH
	A.EMP_NM = '�̰��' -- '�̰��'�� ��Ʈ �����Ͱ� �ǰ� '�̰��' ���� ����鸸 �� ���´�.
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ;

------------------------------------------------
SELECT
	LEVEL LVL ,
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "�����ο�" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF ,
	CONNECT_BY_ROOT A.EMP_NO AS "�ֻ���������" -- �ֻ��� ��Ʈ �����Ͱ� ��µȴ�.
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
	LPAD(' ', 4 *(LEVEL-1))|| EMP_NO || '(' || EMP_NM || ')' AS "�����ο�" ,
	A.DEPT_CD ,
	B.DEPT_NM ,
	CONNECT_BY_ISLEAF ,
	CONNECT_BY_ROOT A.EMP_NO AS "�ֻ���������" ,
	SYS_CONNECT_BY_PATH(EMP_NO || '(' || EMP_NM || ')', '/') AS "�����ο����" -- ��µ� �� ��θ� ����Ѵ�.
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD = B.DEPT_CD
START WITH
	A.EMP_NM = '�̰��'
CONNECT BY
	PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO;

------------------------------------------------
SELECT -- SELF ������ Ȱ���ؼ� ���� ���踦 ǥ���Ѵ�.
	A.EMP_NO "�����ȣ" ,
	A.EMP_NM "����̸�" ,
	A.DIRECT_MANAGER_EMP_NO "�����ڻ����ȣ" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = A.DIRECT_MANAGER_EMP_NO) AS "�����ڻ����" ,
	B.DIRECT_MANAGER_EMP_NO AS "�����������ڻ����ȣ" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = B.DIRECT_MANAGER_EMP_NO) AS "�����������ڻ����"
FROM
	TB_EMP A
INNER JOIN TB_EMP B ON -- ��ȸ���� ���� �����ڰ� NULL�̱� ������ SELF ���ο� �����Ͽ� �����ͷ� ��µ��� �ʴ´�.
	(A.DIRECT_MANAGER_EMP_NO = B.EMP_NO)
JOIN TB_DEPT C ON
	(A.DEPT_CD = C.DEPT_CD) ;

------------------------------------------------
SELECT -- LEFT OUTER ������ Ȱ���� ������ ��� �����͸� ����� �� �״��� ���ǿ� �´� �����͸� ����Ѵ�.(��ȸ�嵵 ��µȴ�.)
	A.EMP_NO "�����ȣ" ,
	A.EMP_NM "����̸�" ,
	A.DIRECT_MANAGER_EMP_NO "�����ڻ����ȣ" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = A.DIRECT_MANAGER_EMP_NO) AS "�����ڻ����" ,
	B.DIRECT_MANAGER_EMP_NO AS "�����������ڻ����ȣ" ,
	(
	SELECT
		L.EMP_NM
	FROM
		TB_EMP L
	WHERE
		L.EMP_NO = B.DIRECT_MANAGER_EMP_NO) AS "�����������ڻ����"
FROM
	TB_EMP A
LEFT OUTER JOIN TB_EMP B ON
	(A.DIRECT_MANAGER_EMP_NO = B.EMP_NO)
JOIN TB_DEPT C ON
	(A.DEPT_CD = C.DEPT_CD) ;