-- HAVING 절 : GROUP BY절과 함께 HAVING절을 사용하여 GROUP BY의 결과를 특정 조건으로 필터링 하는 기능을 한다.
-- HAVING절은 GROUP BY절에 의해 생성된 그룹행의 조건을 설정한다.(Grouping한 집계에 대해서 어떠한 데이터를 뽑을 때는 HAVING절)
-- 반면에 WHERE절은 GROUP BY절이 적용되기 전에 개별 행의 조건을 설정한다.(테이블의 행을 뽑는 기준은 WHERE절)
select
	p.customer_id,
	sum(amount) as amount_sum
from 
	payment p 
group by
	p.customer_id
having
	sum(amount) > 200 -- sum(amount)를 amount_sum으로 바꾸면 에러가 발생한다.
;

----------------------------------------
select
	p.customer_id,
	c.email, -- select에서 칼럼을 추가하면 GROUP BY절 안에서도 똑같은 칼럼을 추가해줘야 에러가 발생하지 않는다.
	sum(p.amount) as amount_sum
from 
	payment p, customer c
where
	p.customer_id = c.customer_id 
group by
	p.customer_id,
	c.email -- select문에서 선언한 칼럼과 같은 칼럼을 선언해주었다.
having
	sum(p.amount) > 200 -- sum(amount)를 amount_sum으로 바꾸면 에러가 발생한다
;

-- Ctrl + Shift + X 하면 대문자로 변경해준다.

----------------------------------------
select
	c.store_id,
	count(c.customer_id) as count
from
	customer c
group by
	c.store_id
having 
	count(c.customer_id) > 300
--where -- where절을 사용하면 에러가 발생한다.
--	count(c.customer_id) > 300