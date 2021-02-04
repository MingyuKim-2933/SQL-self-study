-- 특정 집합에서 어떠한 칼럼의 값이 특정 범위안에 들어가는 집합을 출력하는 연산자이다.
SELECT
	p0.customer_id,
	p0.payment_id,
	p0.amount
FROM
	payment p0
WHERE
	p0.amount BETWEEN 8 AND 9
	
/* 이 SQL은 위 SQL과 결과가 동일함.
where
	p.amount >= 8
	and p.amount <= 9
*/

--------------------------------	
SELECT
	p1.customer_id,
	p1.payment_id,
	p1.amount
FROM
	payment p1
WHERE
	p1.amount NOT BETWEEN 8 AND 9	
	
/* 이 SQL은 위 SQL과 결과가 동일함.
where
	p.amount < 8
	or p.amount > 9
*/
	
--------------------------------
select 
	p2.customer_id,
	p2.payment_id,
	p2.amount,
	p2.payment_date
from 
	payment p2 
where
	cast(p2.payment_date as date) between '2007-02-07' and '2007-02-15'--payment_date를 date 데이터 타입으로 형 변환 시켜준다. -- cast()는 형 변환을 시켜준다.

	-- to_char(p2.payment_date, 'YYYY-MM-DD') between '2007-02-07' and '2007-02-15' -- payment_date의 데이터 타입을 char로 변환시킨다. -- 이 SQL은 위 SQL과 결과가 동일함.
	