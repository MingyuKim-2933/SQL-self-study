-- LAG, LEAD �Լ� : Ư�� ���� ������ ��� �Ǽ��� ��ȭ ���� �ش� ���� �ȿ��� Ư�� Į���� ���� ���� �� Ȥ�� ���� ���� ���� ���Ѵ�.
-- LAG �Լ� : ���� ���� ���� ã�´�.
select
	p.product_name,
	pg.group_name,
	p.price,
	          lag(p.price, 1) over (partition by pg.group_name order by p.price) as prev_price, -- lag�� �ι�° �Ķ���ʹ� ���� �࿡�� �� ��° ���� ���� ���� ������� ���Ѵ�. (�Ʒ� �ٰ� ��ġ�� �����ָ� �������� ��������.)
	p.price - lag(p.price, 1) over (partition by pg.group_name order by p.price) as cur_prev_diff -- ���� ���� price���� ���� ���� price�� ����.
from 
	product p 
inner join product_group pg on
	p.group_id = pg.group_id 

------------------------------------------
-- LEAD �Լ� : ���� ���� ���� ã�´�.
select
	p.product_name,
	pg.group_name,
	p.price,
	          lead(p.price, 1) over (partition by pg.group_name order by p.price) as next_price, -- lead�� �ι�° �Ķ���ʹ� ���� �࿡�� �� ��° ���� ���� ���� ������� ���Ѵ�. (�Ʒ� �ٰ� ��ġ�� �����ָ� �������� ��������.)
	p.price - lead(p.price, 1) over (partition by pg.group_name order by p.price) as cur_next_diff -- ���� ���� price���� ���� ���� price�� ����.
from 
	product p 
inner join product_group pg on
	p.group_id = pg.group_id 