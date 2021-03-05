 SELECT A.EMP_NO -- INNER JOIN
     , A.EMP_NM
     , A.ADDR
     , B.DEPT_CD
     , B.DEPT_NM
  FROM TB_EMP A, TB_DEPT B 
  WHERE A.DEPT_CD = B.DEPT_CD 
    AND A.ADDR LIKE '%수원%'
ORDER BY A.EMP_NO
; 

-------------------------------------------
SELECT A.EMP_NO -- NATURAL JOIN
     , A.EMP_NM
     , A.ADDR     
     , DEPT_CD
     , B.DEPT_NM
FROM TB_EMP A NATURAL JOIN TB_DEPT B 
  WHERE A.ADDR LIKE '%수원%'
;

 SELECT A.EMP_NO -- NATURAL JOIN에 ALIAS를 사용하여 오류 발생
      , A.EMP_NM
      , A.ADDR     
      , B.DEPT_NM
      , B.DEPT_CD
  FROM TB_EMP A NATURAL JOIN TB_DEPT B 
 WHERE A.ADDR LIKE '%수원%'
;

-------------------------------------------
SELECT -- USING 절
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
	A.ADDR LIKE '%수원%' ;

SELECT -- USING 절 안에 ALIAS를 사용하여 오류 발생
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
	A.ADDR LIKE '%수원%'
;

-------------------------------------------
SELECT -- ON 절
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
	A.ADDR LIKE '%수원%'
;

SELECT -- 앨리어스를 적지 않아 오류 발생
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
	A.ADDR LIKE '%수원%' ;

-------------------------------------------
SELECT -- 3개 테이블 WHERE 절로 조인
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
	AND A.ADDR LIKE '%수원%'
	AND A.EMP_NO = C.EMP_NO
ORDER BY
	A.EMP_NO;

SELECT -- 3개 테이블 JOIN, ON 사용하여 조인
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
	A.ADDR LIKE '%수원%';

-------------------------------------------
-- OUTER 조인 실습 환경 구축
INSERT INTO TB_DEPT VALUES ('100014', '4차산업혁명팀', '999999'); -- 부서 테이블에 부서 데이터를 추가함, 새로 추가한 팀에는 어떠한 사원도 속하지 않은 상태임
INSERT INTO TB_DEPT VALUES ('100015', '포스트코로나팀', '999999');

COMMIT; 

ALTER TABLE SQLD.TB_EMP DROP CONSTRAINT FK_TB_EMP01; -- 특정 사원은 반드시 부서가 필요하지만 실습을 위해 임시로 제거한다.(참조 무결성 제약 조건 (FK) 잠시 DROP

-- 실습을 위해 사원 테이블에 신규 사원 5명을 추가하는데 추가되는 5명의 부서 코드는 존재하지 않는 부서인 "000000"로 INSERT 한다.
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000041', '이순신', '19811201', '1', '경기도 용인시 수지구 죽전1동 435', '010-5456-7878', NULL, '006', '003', '114-554-223433', '000000', 'N');                         
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000042', '정약용', '19820402', '1', '경기도 고양시 덕양구 화정동 231', '010-4054-6547', NULL, '004', '001', '110-223-553453', '000000', 'Y');                    
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000043', '박지원', '19850611', '1', '경기도 수원시 팔달구 매탄동 553', '010-1254-1116', NULL, '004', '001', '100-233-664234', '000000', 'N');                    
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000044', '장보고', '19870102', '1', '경기도 성남시 분당구 정자동 776', '010-1215-8784', NULL, '004', '002', '180-345-556634', '000000', 'Y');                         
INSERT INTO SQLD.TB_EMP T (T.EMP_NO, T.EMP_NM, T.BIRTH_DE, T.SEX_CD, T.ADDR, T.TEL_NO, T.DIRECT_MANAGER_EMP_NO, T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, T.SAL_TRANS_ACCNT_NO, T.DEPT_CD, T.LUNAR_YN ) 
     VALUES ('1000000045', '김종서', '19880824', '1', '경기도 고양시 일산서구 백석동 474', '010-3687-1245', NULL, '004', '002', '325-344-45345', '000000', 'Y');                    
COMMIT; 

-------------------------------------------
SELECT -- LEFT OUTER 조인
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
	-- 왼쪽은 다 보여주고 오른쪽은 매칭되는 것만 보여준다.
;

SELECT -- LEFT OUTER 조인
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
SELECT -- RIGHT OUTER 조인
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

SELECT -- FULL OUTER 조인 (LEFT OUTER 조인과 RIGHT OUTER 조인의 합집합이 출력된다.)
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
-- 실습 종료 후 데이터 삭제 및 제약 조건 재설정
DELETE 
  FROM TB_DEPT 
 WHERE DEPT_CD IN ('100014', '100015');

DELETE FROM TB_EMP 
WHERE EMP_NO IN ('1000000041','1000000042','1000000043','1000000044','1000000045'); 

COMMIT; 

ALTER TABLE SQLD.TB_EMP ADD CONSTRAINT FK_TB_EMP01 FOREIGN KEY (DEPT_CD) REFERENCES SQLD.TB_DEPT (DEPT_CD);

