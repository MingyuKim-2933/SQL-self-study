select
	f.film_id,
	f.title,
	f.release_year
from
	film f
order by film_id -- ORDER BY�� �� ����߿���
	limit 4 -- 4�Ǹ� ����Ѵ�.
	offset 3; -- (0, 1, 2, 3) 3������ ��µȴ�. �� 4��° �����ͺ��� ��µȴ�.

---------------------------------------------------------------------
select
	f2.film_id,
	f2.title,
	f2.rental_rate 
from
	film f2 
order by rental_rate desc -- rental_rate�� ������������ ����
limit 100 offset 5; -- 6��° �����ͺ��� 100���� ����Ѵ�.
