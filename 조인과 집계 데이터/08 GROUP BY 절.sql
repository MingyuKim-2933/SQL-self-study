-- GROUP BY ���� SELECT������ ��ȯ�� ���� �׷����� ������. �� �׷쿡 ���� �հ�, ���, ī��Ʈ ���� ����� �� �ִ�.
select
	p.customer_id
from 
	payment p
group by -- �� ���� custome r_id�� payment ���̺� ���� �� �� �� �ִµ� group by�� ����ϸ� �ߺ��� customer_id�� �������ش�.
	p.customer_id
;
------------------------------------------
select --���� ����� �Ȱ���(distinct�� �ߺ��� �������ش�.)
	distinct p.customer_id
from
	payment p
;	
------------------------------------------
select -- �ŷ����� ���� ���� �������� ����Ѵ�.
	p.customer_id,
	sum(amount) as amount_sum
	from
	payment p
group by p.customer_id
order by amount_sum desc -- amount_sum ��� sum(amount)�� ����
;

------------------------------------------
select -- ���� ���� ����� ��µ����� order by�� ���ڷ� �ѹ��� �ϴ� ���� ���� �ٲ� ���� �־ ��õ���� �ʴ´�.
	p.customer_id,
	sum(amount) as amount_sum
	from
	payment p
group by p.customer_id
order by 2 desc
;

------------------------------------------
select -- group by�� ����Ͽ� staff���� �ߺ��� �����ϰ� �� staff���� ��� Ƚ���� count�Ͽ� ����Ѵ�.
	p.staff_id,
	count(p.payment_id) as count
from 
	payment p
group by staff_id;

------------------------------------------
select 
	p.staff_id,
	s.staff_id,
	s.first_name,
	s.last_name,
	count(p.payment_id) as count
from 
	payment p, staff s
where
	p.staff_id = s.staff_id
group by --���� select������ ����� Į������ group by�� ��� �������־�� �Ѵ�.
	p.staff_id,
	s.staff_id,
	s.first_name,
	s.last_name 

