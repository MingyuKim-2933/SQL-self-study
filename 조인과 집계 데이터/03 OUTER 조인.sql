-- OUTER JOIN: Ư�� Į���� �������� ��Ī�� ������ ��������� ������ ������ ��� ����ϰ� �ٸ� ������ ������ ��Ī�Ǵ� Į���� �� ���� ����Ѵ�.
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
left outer join basket_b b on -- outer�� �����ص� ������ ����.
	a.fruit = b.fruit
	
--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
left outer join basket_b b on -- outer�� �����ص� ������ ����.
	a.fruit = b.fruit
where 
	b.id is null; -- left only: b�� ������ ���� a���� �ִ� �����͸� ����Ѵ�.

--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
right outer join basket_b b on-- outer�� �����ص� ������ ����.
	a.fruit = b.fruit

--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
right outer join basket_b b on -- outer�� �����ص� ������ ����.
	a.fruit = b.fruit
where a.id is null -- right only: a�� ������ ���� b���� �ִ� �����͸� ����Ѵ�.