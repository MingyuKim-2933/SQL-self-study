-- 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 첫번째 값(first_value) 혹은 마지막 값(last_value)을 구하는 함수이다.
select -- group_name 기준 price가 가장 작은 값이 출력된다.
	p.product_name,
	pg.group_name,
	p.price,
	first_value (p.price) over (partition by pg.group_name order by p.price) as lowest_price_per_group
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

------------------------------------------------------
select -- group_name 기준 price가 가장 큰 값이 출력된다.
	p.product_name,
	pg.group_name,
	p.price,
	last_value (p.price) over (partition by pg.group_name order by p.price range between unbounded preceding and unbounded following) as highest_price_per_group
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

-- LAST_VALUE 함수에는 "range between unbounded preceding and unbounded following"를 추가한다. (범위를 지정해준다.)
-- DEFAULT가 "range between unbounded preceding and current row"이기 때문이다. (현재 열까지 기준으로 가장 큰 값이 출력되어 원하는 값이 출력되지 않는다.)