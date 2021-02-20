-- AVG 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 평균을 구하는 함수이다.
select -- 집계 함수는 집계의 결과만 출력한다. (1개의 결과)
	avg(price)
from
	product

------------------------------
select -- group_name 기준 group별 avg가 나온다.
	pg.group_name,
	avg(p.price)
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 
group by
pg.group_name

------------------------------
select -- 분석함수를 사용하여 결과 집합을 그대로 출력하면서 GROUP NAME 기준의 평균을 출력하였다.
	p.product_name,
	p.price,
	pg.group_name, 
	avg(p.price) over (partition by pg.group_name) -- 보여줄거 다 보여주면서 pg.group_name 기준 avg를 출력한다.
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 
	
------------------------------
select -- 분석함수를 사용하여 결과 집합을 그대로 출력하면서 GROUP NAME 기준의 차례대로 누적평균을 출력하였다.
	p.product_name,
	p.price,
	pg.group_name, 
	avg(p.price) over (partition by pg.group_name order by p.price) -- order by를 추가하면 누적집계로 한다.
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 