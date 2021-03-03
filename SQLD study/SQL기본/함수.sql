SELECT -- ���� �� �Լ�
      LOWER('SQL Developoer') AS "LOWER('SQL Developoer')" --�ҹ��ڷ� ��ȯ
    , UPPER('SQL Developoer') AS "UPPER('SQL Developoer')" --�빮�ڷ� ��ȯ  
    , ASCII('A') AS "ASCII('A')" --�ƽ�Ű�ڵ尪 ���
    , CHR('65') AS "CHR('65')" --�ƽ�Ű�ڵ尪�� ���� ���
    , CONCAT('SQL', 'Developoer') AS "CONCAT('SQL', 'Developoer')" --���ڿ� ����
    , SUBSTR('SQL Developoer', 1, 3) AS "SUBSTR('SQL Developoer', 1, 3)" --���ڿ� �߶󳻱�
    , LENGTH('SQL') AS "LENGTH('SQL')" --���ڿ��� ���� ���
    , LTRIM(' SQL') AS "LTRIM(' SQL')" --���� ���� ����
    , RTRIM('SQL ') AS "RTRIM('SQL ')" --������ ���� ���� 
 FROM DUAL
 ;

-----------------------------------------------------
SELECT -- ���� �� �Լ�
      ABS(-15) AS "ABS(-15)"  --���밪�� ��ȯ
    , SIGN(1) AS "SIGN(1)"  --���ΰ��� ��ȯ
    , MOD(8,3) AS "MOD(8,3)" --�������� ��ȯ
    , CEIL(38.678) AS "CEIL(38.678)" --������ �ø�
    , FLOOR(38.678) AS "FLOOR(38.678)" --������ ����
    , ROUND(38.678, 2) AS "ROUND(38.678, 2)" --�Ҽ��� 2��° �ڸ����� �ݿø�
    , TRUNC(38.678) AS "TRUNC(38.678)" --0�� �ڸ����� ������ �ڸ�
    , TRUNC(38.678, 1) AS "TRUNC(38.678, 1)" --1�� �ڸ����� ������ �ڸ�
    , TRUNC(38.678, 2) AS "TRUNC(38.678, 2)" --2�� �ڸ����� ������ �ڸ� 
    , TRUNC(38.678, 3) AS "TRUNC(38.678, 3)" --3�� �ڸ����� ������ �ڸ� 
 FROM DUAL
 ;

-----------------------------------------------------
-- ��¥ �� ������ ��ȯ �Լ�
  SELECT SYSDATE AS "SYSDATE" --���� ����Ͻú��� ���
     , EXTRACT(YEAR FROM SYSDATE) AS "EXTRACT(YEAR FROM SYSDATE)" --�� ���
     , EXTRACT(MONTH FROM SYSDATE) AS "EXTRACT(MONTH FROM SYSDATE)" --�� ���
     , EXTRACT(DAY FROM SYSDATE) AS "EXTRACT(DAY FROM SYSDATE)" --�� ��� 
     , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))" --�� ���
     , TO_NUMBER(TO_CHAR(SYSDATE, 'MM')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))" --��  ���
     , TO_NUMBER(TO_CHAR(SYSDATE, 'DD')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'DD'))" --�� ��� 
     , TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))" --�� ���
     , TO_NUMBER(TO_CHAR(SYSDATE, 'MI')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MI'))" --�� ���
     , TO_NUMBER(TO_CHAR(SYSDATE, 'SS')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))" --�� ���
     , TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')" --�� ���(���ڿ�)
     , TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')" --�� ���(���ڿ�)
     , TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD')" --�� ���(���ڿ�)
     , TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')" --�� ���(���ڿ�)
     , TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')" --�� ���(���ڿ�)
     , TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'SS')" --�� ���(���ڿ�)    
  FROM DUAL; 


-----------------------------------------------------
SELECT -- ��¥�� ������ ����
       SYSDATE AS "SYSDATE" --���� ����� �ú���
     , SYSDATE - 1 AS "SYSDATE - 1" --1���� �� ����� �ú��� 
     , SYSDATE - (1/24) AS "SYSDATE - (1/24)" --1�ð����� ����� �ú���
     , SYSDATE - (1/24/60) AS "SYSDATE - (1/24/60)" --1������ ����� �ú���
     , SYSDATE - (1/24/60/60) AS "SYSDATE - (1/24/60/60)" --1������ ����� �ú���
     , SYSDATE - (1/24/60/60) * 10 AS "SYSDATE - (1/24/60/60) * 10" --10������ ����� �ú���
     , SYSDATE - (1/24/60/60) * 30 AS "SYSDATE - (1/24/60/60) * 30" --30������ ����� �ú���
  FROM DUAL 
;

-----------------------------------------------------
SELECT -- ������ ��ȯ�� ����
       TO_CHAR(SYSDATE, 'YYYY/MM/DD') "TO_CHAR(SYSDATE, 'YYYY/MM/DD')" 
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') "TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')"
     , TO_CHAR(10.25, '$999,999,999.99') AS "TO_CHAR(10.25, '$999,999,999.99')"
     , TO_CHAR(12500, 'L999,999,999') AS "TO_CHAR(10.25, '$999,999,999.99')"
     , TO_NUMBER('100') + TO_NUMBER('100') AS "TO_CHAR(10.25, '$999,999,999.99')"
  FROM DUAL
; 

-----------------------------------------------------
-- ���� �� CASE, DECODE
SELECT CASE WHEN SAL_CD = '100001' THEN '�⺻��'
            WHEN SAL_CD = '100002' THEN '�󿩱�'
            WHEN SAL_CD = '100003' THEN 'Ư���󿩱�'
            WHEN SAL_CD = '100004' THEN '�߱ټ���'
            WHEN SAL_CD = '100005' THEN '�ָ�����'
            WHEN SAL_CD = '100006' THEN '���ɽĴ�'
            WHEN SAL_CD = '100007' THEN '��������Ʈ'
            ELSE '��ȿ��������'
            END SAL_NM
  FROM TB_SAL
; 

SELECT DECODE(SAL_CD, '100001', '�⺻��', '100002', '�󿩱�', '��Ÿ')  AS SAL_NM
  FROM TB_SAL 
;  

-----------------------------------------------------
SELECT NVL(DIRECT_MANAGER_EMP_NO, '�ֻ�����') AS ������ --�����ڻ����ȣ�� NULL�̸� "�ֻ�����"�� ���
  FROM TB_EMP
 WHERE DIRECT_MANAGER_EMP_NO IS NULL; 

SELECT NVL(UPPER_DEPT_CD , '�ֻ����μ�') AS �����μ�
  FROM TB_DEPT
 WHERE UPPER_DEPT_CD  IS NULL;


SELECT NVL(MAX(EMP_NM), '�������') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '��ȸ��';

SELECT NVL(MAX(EMP_NM), '�������') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '����ȣ'; 

SELECT NULLIF('����ȣ', '������') --���������� ����ȣ ����
FROM DUAL
;

SELECT NVL(NULLIF('����ȣ', '����ȣ'), '�������')
FROM DUAL
;


SELECT COALESCE(NULL, NULL, 0) AS SAL
FROM DUAL;

SELECT COALESCE(5000, NULL, 0) AS SAL
FROM DUAL;

SELECT COALESCE(NULL, 6000, 0) AS SAL
FROM DUAL;