-- ���������� : ���������� SQL�� ������ ���� ������ �ƴ� ������ �����ϴ� ������ ���Ѵ�. ���������� Ȱ�������ν� �پ��� ����� ���� �� �� �ִ�.
-- 2���� SQL�� �����Ͽ� �ϳ��� SQL������ ����� ���� �ϴ� ����̴�. 
-- ������������ ��ø ��������, �ζ��� ��, ��Į�� ���������� �����Ѵ�. �� �� ���� ���� �������� �� �� ����.
select 
	avg(f.rental_rate)
from
	film f
;

-----------------------------	
select
	f.film_id,
	f.title,
	f.rental_rate
from 
	film f
where f.rental_rate > 2.98
;

-- ���������� ������� ������ 2���� SQL�� ����ؾ� �ؼ� �����ϴ�.
------------------------------
select -- ��ø ���������� Ȱ��
	f.film_id,
	f.title,
	f.rental_rate
from
	film f
where -- where�� �ȿ� ��ø ���������� �����Ѵ�.
	f.rental_rate > -- ��ø ���������� ����
	(
	select
		avg(f2.rental_rate)
	from
		film f2 
	) --��ø ���������� ����
;

------------------------------
select -- �ζ��� ���� Ȱ��
	f.film_id,
	f.title,
	f.rental_rate
from -- �ζ��� ��� from�� �ȿ� ���������� �����Ѵ�
	film f,
	(
	select
		avg(rental_rate) as avg_rental_rate
	from
		film 
	) f2
where f.rental_rate > f2.avg_rental_rate

------------------------------
select -- ��Į�� ���������� Ȱ�� -> �ζ��� �� �ȿ� �� ���������� �����Ѵ�.
 f.film_id,
	f.title,
	f.rental_rate
from -- �ζ��� ��� from�� �ȿ� ���������� �����Ѵ�
( -- �ζ��� ���� ����
	select
		f.film_id,
		f.title,
		f.rental_rate,
		(  -- ��Į�� ���������� ����
		select
			avg(f2.rental_rate)
		from
			film f2 ) as avg_rental_rate -- ��Į�� ���������� ����
	from
		film f ) f -- �ζ��� ���� ����
where
	f.rental_rate > f.avg_rental_rate
