-- ALL������ : ALL �����ڴ� ���� ���� ������ ���� ��ȯ�� �� ���հ� ���Ѵ�. ALL �����ڴ� ���������� ��� ���� ������ �ؾ߸� ������ �����ȴ�.
select 
	f.title,
	f.length 
from 
	film f
where length >= all -- ī�װ� �� ��ȭ �� ��� ��ȭ(length 185�� �ִ�)�� length���� ũ�ٸ� ����Ѵ�. (185 �̻��̸� ����Ѵ�.)
(
	select
		max(f2.length)
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	group by
		fc.category_id
)
;

----------------------------------------
select 
	f.film_id,
	f.title,
	f.length
from
	film f
where length > all -- round(avg(f2.length), 2)�� 120.44�� �ִ��̿��� 120.44 �̻��� ������ ��µȴ�.
(
	select
		round(avg(f2.length), 2) -- round(�� , �Ҽ��� �ڸ�) round()�� �ι� ° ���ڴ� �ݿø��Ͽ� �� ��° �ڸ����� ������ �� �����ش�.
	from 
		film f2
	group by 
		f2.rating
)
order by f.length
;