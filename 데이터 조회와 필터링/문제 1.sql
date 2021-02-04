-- PAYMENT 테이블에서 단일 거래의 AMOUNT의 액수가 가장 많은 고객들의 CUSTOMER_ID를 추출하라. 
-- 단, CUSTOMER_ID의 값은 유일해야 한다.
select 
	distinct p.customer_id 
from
	payment p 
where
	p.amount = 11.99

-----------------------------------
--solution
select
	distinct p1.customer_id
from
	payment p1
where
	p1.amount = (
	select
		p2.amount
	from
		payment p2
	order by
		p2.amount desc limit 1 
	)

-- ctrl + shift + x 전부 대문자로 변경해준다.