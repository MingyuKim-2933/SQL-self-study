-- ROW_NUMBER, RANK, DENSE_RANK �Լ� : Ư�� ���� ������ ��� �Ǽ��� ��ȭ ���� �ش� ���� �ȿ��� Ư�� Į���� ������ ���ϴ� �Լ��̴�. 
-- ROW_NUMBER�Լ� : ���� ������ �־ ������ ���������� ������ �ű��. (1, 2, 3... ������ ������.)
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
-- RANK �Լ� : ���� ������ ������ ���� ������ �ű�� �� ���� ������ �ǳʶڴ�. (1, 1, 3, 4... ������ ������.)
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
-- RANK �Լ� : ���� ������ ������ ���� ������ �ű�� �� ���� ������ �ǳʶ��� �ʴ´�.. (1, 1, 2, 3... ������ ������.)
select
	p.product_name,
	pg.group_name,
	p.price,
	dense_rank () over (partition by pg.group_name order by p.price)
from 
	product p
inner join product_group pg on
	p.group_id = pg.group_id 