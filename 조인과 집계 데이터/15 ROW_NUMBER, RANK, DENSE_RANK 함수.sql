-- ROW_NUMBER, RANK, DENSE_RANK 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 순위를 구하는 함수이다. 
-- ROW_NUMBER함수 : 같은 순위가 있어도 무조건 순차적으로 순위를 매긴다. (1, 2, 3... 순으로 나간다.)
select
	p.product_name,
	pg.group_name,
	p.price,
	row_number () over (partition by pg.group_name order by p.price desc)
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

--------------------------------------
-- RANK 함수 : 같은 순위가 있으면 동일 순위로 매기고 그 다음 순위로 건너뛴다. (1, 1, 3, 4... 순으로 나간다.)
select
	p.product_name,
	pg.group_name,
	p.price,
	rank () over (partition by pg.group_name order by p.price)
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

--------------------------------------
-- RANK 함수 : 같은 순위가 있으면 동일 순위로 매기고 그 다음 순위로 건너뛰지 않는다.. (1, 1, 2, 3... 순으로 나간다.)
select
	p.product_name,
	pg.group_name,
	p.price,
	dense_rank () over (partition by pg.group_name order by p.price)
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 