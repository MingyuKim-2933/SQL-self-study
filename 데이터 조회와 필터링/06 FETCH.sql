-- Ư�� ������ ��� �� ����ϴ� ������ ���� �����ϴ� ������ �Ѵ�. �κ� ���� ó���� ���ȴ�.(LIMIT���� ���� ����)
-- FETCH���� oracle���� ������.
select
	f.film_id,
	f.title
from
	film f
order by
	title fetch first row only -- title�� ������ ���� �߿��� ������ �� �� ���� ���� �����Ѵ�. db���� �� �Ǹ� ��ȸ�ϴ� ��찡 ����.

------------------------------
select
	f2.film_id,
	f2.title
from
	film f2
order by
	title fetch first 3 row only -- title�� ������ ���� �߿��� �� ���� ���� �����Ѵ�. db���� �� �Ǹ� ��ȸ�ϴ� ��찡 ����.

------------------------------
select
	f3.film_id,
	f3.title
from
	film f3
order by
	title offset 5 rows -- 6�� ���� ����Ѵ�.
 fetch first 5 row only	-- 5���� ���� ����Ѵ�.
