 SELECT A.EMP_NO -- INNER JOIN
     , A.EMP_NM
     , A.ADDR
     , B.DEPT_CD
     , B.DEPT_NM
  FROM TB_EMP A, TB_DEPT B 
  WHERE A.DEPT_CD = B.DEPT_CD 
    AND A.ADDR LIKE '%����%'
ORDER BY A.EMP_NO
; 

-------------------------------------------
SELECT A.EMP_NO -- NATURAL JOIN
     , A.EMP_NM
     , A.ADDR     
     , DEPT_CD
     , B.DEPT_NM
FROM TB_EMP A NATURAL JOIN TB_DEPT B 
  WHERE A.ADDR LIKE '%����%'
;

 SELECT A.EMP_NO -- NATURAL JOIN�� ALIAS�� ����Ͽ� ���� �߻�
      , A.EMP_NM
      , A.ADDR     
      , B.DEPT_NM
      , B.DEPT_CD
  FROM TB_EMP A NATURAL JOIN TB_DEPT B 
 WHERE A.ADDR LIKE '%����%'
;

-------------------------------------------
SELECT -- USING ��
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	B.DEPT_NM ,
	DEPT_CD
FROM
	TB_EMP A
JOIN TB_DEPT B
		USING (DEPT_CD)
WHERE
	A.ADDR LIKE '%����%' ;

SELECT -- USING �� �ȿ� ALIAS�� ����Ͽ� ���� �߻�
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	B.DEPT_NM ,
	DEPT_CD
FROM
	TB_EMP A
JOIN TB_DEPT B
		USING (B.DEPT_CD)
WHERE
	A.ADDR LIKE '%����%'
;

-------------------------------------------
SELECT -- ON ��
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	B.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A
JOIN TB_DEPT B ON
	(A.DEPT_CD = B.DEPT_CD)
WHERE
	A.ADDR LIKE '%����%'
;

SELECT -- �ٸ���� ���� �ʾ� ���� �߻�
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A
JOIN TB_DEPT B ON
	(A.DEPT_CD = B.DEPT_CD)
WHERE
	A.ADDR LIKE '%����%' ;

-------------------------------------------
SELECT -- 3�� ���̺� WHERE ���� ����
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	B.DEPT_CD ,
	B.DEPT_NM ,
	C.CERTI_CD
FROM
	TB_EMP A ,
	TB_DEPT B ,
	TB_EMP_CERTI C
WHERE
	A.DEPT_CD = B.DEPT_CD
	AND A.ADDR LIKE '%����%'
	AND A.EMP_NO = C.EMP_NO
ORDER BY
	A.EMP_NO;

SELECT -- 3�� ���̺� JOIN, ON ����Ͽ� ����
	A.EMP_NO ,
	A.EMP_NM ,
	A.ADDR ,
	B.DEPT_NM ,
	B.DEPT_CD ,
	C.CERTI_CD
FROM
	TB_EMP A
JOIN TB_DEPT B ON
	(A.DEPT_CD = B.DEPT_CD)
JOIN TB_EMP_CERTI C ON
	(A.EMP_NO = C.EMP_NO)
WHERE
	A.ADDR LIKE '%����%';

-------------------------------------------
-- OUTER ���� �ǽ� ȯ�� ����
INSERT INTO TB_DEPT VALUES ('100014', '4�����������', '999999'); -- �μ� ���̺� �μ� �����͸� �߰���, ���� �߰��� ������ ��� ����� ������ ���� ������
INSERT INTO TB_DEPT VALUES ('100015', '����Ʈ�ڷγ���', '999999');

COMMIT; 

ALTER TABLE SQLD.TB_EMP DROP CONSTRAINT FK_TB_EMP01; -- Ư�� ����� �ݵ�� �μ��� �ʿ������� �ǽ��� ���� �ӽ÷� �����Ѵ�.(���� ���Ἲ ���� ���� (FK) ��� DROP

-- �ǽ��� ���� ��� ���̺� �ű� ��� 5���� �߰��ϴµ� �߰��Ǵ� 5���� �μ� �ڵ�� �������� �ʴ� �μ��� "000000"�� INSERT �Ѵ�.
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5456-7878', NULL, '006', '003', '114-554-223433', '000000', 'N');                         
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547', NULL, '004', '001', '110-223-553453', '000000', 'Y');                    
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116', NULL, '004', '001', '100-233-664234', '000000', 'N');                    
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784', NULL, '004', '002', '180-345-556634', '000000', 'Y');                         
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245', NULL, '004', '002', '325-344-45345', '000000', 'Y');                    
COMMIT; 

-------------------------------------------
SELECT -- LEFT OUTER ����
	A.EMP_NO ,
	A.EMP_NM ,
	B.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A,
	TB_DEPT B
WHERE
	A.DEPT_CD IN ( '000000', '100001')
	AND A.DEPT_CD = B.DEPT_CD(+)
	-- ������ �� �����ְ� �������� ��Ī�Ǵ� �͸� �����ش�.
;

SELECT -- LEFT OUTER ����
	A.EMP_NO ,
	A.EMP_NM ,
	B.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A
LEFT OUTER JOIN TB_DEPT B ON
	(A.DEPT_CD = B.DEPT_CD)
WHERE
	A.DEPT_CD IN ( '000000', '100001') ;

-------------------------------------------
SELECT -- RIGHT OUTER ����
	A.EMP_NO ,
	A.EMP_NM ,
	B.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A ,
	TB_DEPT B
WHERE
	B.DEPT_CD IN ('100014', '100015', '100001')
	AND A.DEPT_CD(+) = B.DEPT_CD ;

SELECT -- FULL OUTER ���� (LEFT OUTER ���ΰ� RIGHT OUTER ������ �������� ��µȴ�.)
	A.EMP_NO ,
	A.EMP_NM ,
	B.DEPT_CD ,
	B.DEPT_NM
FROM
	TB_EMP A
FULL OUTER JOIN TB_DEPT B ON
	(A.DEPT_CD = B.DEPT_CD)
WHERE
	1 = 1
	AND ( A.EMP_NO IS NULL
	OR B.DEPT_CD IS NULL )
ORDER BY
	B.DEPT_CD DESC,
	A.EMP_NO DESC ;

-------------------------------------------
-- �ǽ� ���� �� ������ ���� �� ���� ���� �缳��
DELETE 
  FROM TB_DEPT 
 WHERE DEPT_CD IN ('100014', '100015');

DELETE FROM TB_EMP 
WHERE EMP_NO IN ('1000000041','1000000042','1000000043','1000000044','1000000045'); 

COMMIT; 

ALTER TABLE SQLD.TB_EMP ADD CONSTRAINT FK_TB_EMP01 FOREIGN KEY (DEPT_CD) REFERENCES SQLD.TB_DEPT (DEPT_CD);

