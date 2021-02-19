-- EXISTS연산자 : EXISTS 연산자는 서브쿼리 내에 집합이 존재하는지 존재 여부만을 판단한다. 존재 여부만을 판단하므로 연산 시 부하가 줄어든다.
-- 해당 집합이 존재하기만 하면 바로 연산을 멈추므로 성능상 유리하다.
select
	c.first_name,
	c.last_name
from
	customer c
where 
	exists ( -- amount가 11달러를 초과한 모든 고객들을 출력한다.
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount > 11 )
order by
	first_name

--------------------------------	
select
	c.first_name,
	c.last_name
from
	customer c
where
	not exists ( -- amount가 11달러를 초과하지 않은 모든 고객들을 출력한다. (전체 고객 - 11달러를 초과한 모든 고객 = 599 - 8 = 591)
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount > 11 )
order by
	first_name
