-- ANY �����ڴ� ���� ���������� ���� ��ȯ�� �� ���հ� ���Ѵ�. ANY �����ڴ� ���������� ���� ��� ���̶� ������ �ϸ� ������ �����ȴ�.
select 
	f.title,
	f.length 
from 
	film f
where length >= any
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

	select
		f2.title,
		f2.length
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	