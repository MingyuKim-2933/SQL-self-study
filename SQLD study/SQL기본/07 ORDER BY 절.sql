SELECT
      A.CERTI_CD
    , A.CERTI_NM
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM; -- DEFAULT�� ������������ ����(ASC)

SELECT -- ���� ����
      A.CERTI_CD
    , A.CERTI_NM
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC; -- DESC: ������������ ����

-----------------------------------------------------
-- NULL ���� ����
SELECT
      A.EMP_NO
    , A.EMP_NM
    , A.BIRTH_DE
    , A.ADDR
    , A.TEL_NO
    , A.DIRECT_MANAGER_EMP_NO
 FROM TB_EMP A 
WHERE BIRTH_DE LIKE '196%'
ORDER BY A.DIRECT_MANAGER_EMP_NO DESC; -- ����Ŭ������ ������������ ������ �� NULL���� ���� ũ�ٰ� �ν��Ͽ� ���� ��ġ�Ѵ�.

SELECT -- SELECT���� �������� ���� Į���� �������� ORDER BY�ص� ���������� �����.
      A.CERTI_CD
    , A.ISSUE_INSTI_NM
 FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC;


----------------------------------------------------- 
-- HAVING ���� ����� ����
SELECT A.DEPT_CD
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "���� ���� �������" 
     , MIN(A.BIRTH_DE) AS "���� ���� �������" 
     , COUNT(*) AS "������"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.DEPT_CD ;


SELECT A.DEPT_CD
     , (SELECT L.DEPT_NM FROM TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
     , MAX(A.BIRTH_DE) AS "���� ���� �������" 
     , MIN(A.BIRTH_DE) AS "���� ���� �������" 
     , COUNT(*) AS "������"
 FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.EMP_NM ; -- GROUP BY ���� ���� ���̴� ORDER BY�� �Ϲ� Į���� ��� �� �� ���� GROUP BY ���� Į�� �������θ� ���İ���

-----------------------------------------------------
-- ORDER BY�� �κ� ���� ó��
SELECT A.SAL_HIS_NO -- �������� 10���� �����µ� ���� ��� ���� 10���� ������������ �����Ѵ�.
     , A.PAY_DE
     , A.PAY_AMT
     , A.EMP_NO
  FROM SQLD.TB_SAL_HIS A
 WHERE A.PAY_DE >= '20200501'
   AND A.PAY_DE <= '20200531'
   AND ROWNUM <= 10
 ORDER BY A.PAY_AMT DESC 
 ;
 
  SELECT A.SAL_HIS_NO -- �޿��� ���� ������ ���� �� 10���� �̾� �����Ѵ�.
      , A.PAY_DE
      , A.PAY_AMT
      , A.EMP_NO 
   FROM 
      (
       SELECT
              A.SAL_HIS_NO
            , A.PAY_DE
            , A.PAY_AMT
            , A.EMP_NO
         FROM SQLD.TB_SAL_HIS A
        WHERE A.PAY_DE >= '20200501'
          AND A.PAY_DE <= '20200531'   
        ORDER BY A.PAY_AMT DESC 
     ) A 
 WHERE ROWNUM <= 10
 ; 