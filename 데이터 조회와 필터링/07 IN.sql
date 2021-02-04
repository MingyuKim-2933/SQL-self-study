-- Ư�� ����(�÷� Ȥ�� ����Ʈ)���� Ư�� ���� Ȥ�� ����Ʈ�� �����ϴ��� �Ǵ��ϴ� �������̴�.
 select
	customer_id,
	rental_id,
	return_date
from
	rental
where
	customer_id in (1, 2) -- customer_id == 1 or customer_id ==2 �� ����.
order by
	return_date desc;
--������, �˾ƺ��� ����
--(DBMS ����ȭ��, SQL ����ȭ) ��Ƽ�������� Ư���� IN������ ���ɻ� ������ ���� ����.

---------------------------------------------------------------------- not in
 select
	customer_id,
	rental_id,
	return_date
from
	rental
where
	customer_id not in (1, 2) -- customer_id != 1 and customer_id !=2 �� ����.
order by
	return_date desc;
	
---------------------------------------------------------------------- ���� ����
select
	r.customer_id,
	return_date
from
	rental r
where
	cast (return_date as date) = '2005-05-27' --return_date�� date Ÿ������ �� ��ȯ�Ѵ�. cast()�� ����ȯ�� �����ش�.

---------------------------------------------------------------------- ���� ����
select
	c.first_name,
	c.last_name
from
	customer c
where
	customer_id in ( -- �������� ���
	select
		r.customer_id -- �������� �ȿ� first_name�� last_name�� ������ �������� �ߺ��� �߻��Ǿ� ���� �ʴ�.
	from
		rental r
	where
		cast (return_date as date) = '2005-05-27' );