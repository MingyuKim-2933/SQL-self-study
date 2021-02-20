-- AVG �Լ� : Ư�� ���� ������ ��� �Ǽ��� ��ȭ ���� �ش� ���� �ȿ��� Ư�� Į���� ����� ���ϴ� �Լ��̴�.
select -- ���� �Լ��� ������ ����� ����Ѵ�. (1���� ���)
	avg(price)
from
	product

------------------------------
select -- group_name ���� group�� avg�� ���´�.
	pg.group_name,
	avg(p.price)
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 
group by
pg.group_name

------------------------------
select -- �м��Լ��� ����Ͽ� ��� ������ �״�� ����ϸ鼭 GROUP NAME ������ ����� ����Ͽ���.
	p.product_name,
	p.price,
	pg.group_name, 
	avg(p.price) over (partition by pg.group_name) -- �����ٰ� �� �����ָ鼭 pg.group_name ���� avg�� ����Ѵ�.
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 
	
------------------------------
select -- �м��Լ��� ����Ͽ� ��� ������ �״�� ����ϸ鼭 GROUP NAME ������ ���ʴ�� ��������� ����Ͽ���.
	p.product_name,
	p.price,
	pg.group_name, 
	avg(p.price) over (partition by pg.group_name order by p.price) -- order by�� �߰��ϸ� ��������� �Ѵ�.
from
	product p
inner join product_group pg on
	p.group_id = pg.group_id 