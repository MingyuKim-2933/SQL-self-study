-- PAYMENT ���̺��� ���� �ŷ��� AMOUNT�� �׼��� ���� ���� ������ CUSTOMER_ID�� �����϶�. 
-- ��, CUSTOMER_ID�� ���� �����ؾ� �Ѵ�.
select 
	distinct p.customer_id 
from
	payment p 
where
	p.amount = 11.99

-----------------------------------
--solution
select
	distinct p1.customer_id
from
	payment p1
where
	p1.amount = (
	select
		p2.amount
	from
		payment p2
	order by
		p2.amount desc limit 1 
	)

-- ctrl + shift + x ���� �빮�ڷ� �������ش�.