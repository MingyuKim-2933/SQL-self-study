-- HAVING �� : GROUP BY���� �Բ� HAVING���� ����Ͽ� GROUP BY�� ����� Ư�� �������� ���͸� �ϴ� ����� �Ѵ�.
-- HAVING���� GROUP BY���� ���� ������ �׷����� ������ �����Ѵ�.(Grouping�� ���迡 ���ؼ� ��� �����͸� ���� ���� HAVING��)
-- �ݸ鿡 WHERE���� GROUP BY���� ����Ǳ� ���� ���� ���� ������ �����Ѵ�.(���̺��� ���� �̴� ������ WHERE��)
select
	p.customer_id,
	sum(amount) as amount_sum
from 
	payment p 
group by
	p.customer_id
having
	sum(amount) > 200 -- sum(amount)�� amount_sum���� �ٲٸ� ������ �߻��Ѵ�.
;

----------------------------------------
select
	p.customer_id,
	c.email, -- select���� Į���� �߰��ϸ� GROUP BY�� �ȿ����� �Ȱ��� Į���� �߰������ ������ �߻����� �ʴ´�.
	sum(p.amount) as amount_sum
from 
	payment p, customer c
where
	p.customer_id = c.customer_id 
group by
	p.customer_id,
	c.email -- select������ ������ Į���� ���� Į���� �������־���.
having
	sum(p.amount) > 200 -- sum(amount)�� amount_sum���� �ٲٸ� ������ �߻��Ѵ�
;

-- Ctrl + Shift + X �ϸ� �빮�ڷ� �������ش�.

----------------------------------------
select
	c.store_id,
	count(c.customer_id) as count
from
	customer c
group by
	c.store_id
having 
	count(c.customer_id) > 300
--where -- where���� ����ϸ� ������ �߻��Ѵ�.
--	count(c.customer_id) > 300