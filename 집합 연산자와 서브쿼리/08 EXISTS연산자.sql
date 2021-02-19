-- EXISTS������ : EXISTS �����ڴ� �������� ���� ������ �����ϴ��� ���� ���θ��� �Ǵ��Ѵ�. ���� ���θ��� �Ǵ��ϹǷ� ���� �� ���ϰ� �پ���.
-- �ش� ������ �����ϱ⸸ �ϸ� �ٷ� ������ ���߹Ƿ� ���ɻ� �����ϴ�.
select
	c.first_name,
	c.last_name
from
	customer c
where 
	exists ( -- amount�� 11�޷��� �ʰ��� ��� ������ ����Ѵ�.
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount > 11 )
order by
	first_name

--------------------------------	
select
	c.first_name,
	c.last_name
from
	customer c
where
	not exists ( -- amount�� 11�޷��� �ʰ����� ���� ��� ������ ����Ѵ�. (��ü �� - 11�޷��� �ʰ��� ��� �� = 599 - 8 = 591)
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount > 11 )
order by
	first_name
