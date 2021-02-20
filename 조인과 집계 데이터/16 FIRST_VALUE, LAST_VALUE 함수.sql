-- Ư�� ���� ������ ��� �Ǽ��� ��ȭ ���� �ش� ���� �ȿ��� Ư�� Į���� ù��° ��(first_value) Ȥ�� ������ ��(last_value)�� ���ϴ� �Լ��̴�.
select -- group_name ���� price�� ���� ���� ���� ��µȴ�.
	p.product_name,
	pg.group_name,
	p.price,
	first_value (p.price) over (partition by pg.group_name order by p.price) as lowest_price_per_group
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

------------------------------------------------------
select -- group_name ���� price�� ���� ū ���� ��µȴ�.
	p.product_name,
	pg.group_name,
	p.price,
	last_value (p.price) over (partition by pg.group_name order by p.price range between unbounded preceding and unbounded following) as highest_price_per_group
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 

-- LAST_VALUE �Լ����� "range between unbounded preceding and unbounded following"�� �߰��Ѵ�. (������ �������ش�.)
-- DEFAULT�� "range between unbounded preceding and current row"�̱� �����̴�. (���� ������ �������� ���� ū ���� ��µǾ� ���ϴ� ���� ��µ��� �ʴ´�.)