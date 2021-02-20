-- LAG, LEAD 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 이전 행의 값 혹은 다음 행의 값을 구한다.
-- LAG 함수 : 이전 행의 값을 찾는다.
select
	p.product_name,
	pg.group_name,
	p.price,
	          lag(p.price, 1) over (partition by pg.group_name order by p.price) as prev_price, -- lag의 두번째 파라미터는 현재 행에서 몇 번째 이전 행의 값을 출력할지 정한다. (아래 줄과 위치를 맞춰주면 가독성이 좋아진다.)
	p.price - lag(p.price, 1) over (partition by pg.group_name order by p.price) as cur_prev_diff -- 현재 행의 price에서 이전 행의 price를 뺀다.
from 
	product p 
inner join product_group pg on
	p.group_id = pg.group_id 

------------------------------------------
-- LEAD 함수 : 다음 행의 값을 찾는다.
select
	p.product_name,
	pg.group_name,
	p.price,
	          lead(p.price, 1) over (partition by pg.group_name order by p.price) as next_price, -- lead의 두번째 파라미터는 현재 행에서 몇 번째 다음 행의 값을 출력할지 정한다. (아래 줄과 위치를 맞춰주면 가독성이 좋아진다.)
	p.price - lead(p.price, 1) over (partition by pg.group_name order by p.price) as cur_next_diff -- 현재 행의 price에서 이전 행의 price를 뺀다.
from 
	product p 
inner join product_group pg on
	p.group_id = pg.group_id 