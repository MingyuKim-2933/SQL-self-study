---------------------------------- customer 테이블 모든 행 출력 (SELECT)
select 
	* -- 모든 칼럼
from 
	CUSTOMER
;

---------------------------------- customer 테이블의 특정 칼럼만 출력
select --3
	A.FIRST_NAME, --4
	A.address_id,
	A.EMAIL
from --1
	CUSTOMER A--2 --테이블을 Alias 해준다. -- alias -> 코드의 가독성 -> SQL 성능 -- DBMS -> 옵티마이저 -> 최적화기 -> SQL -> 가장 빠르게, 가장 저비용, 실행 
;
