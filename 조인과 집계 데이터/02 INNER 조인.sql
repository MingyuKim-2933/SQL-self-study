-- Ư�� Į���� �������� ��Ȯ�� ��Ī�� ������ ����Ѵ�. INNER ������ ��ǥ���� ������ �����̴�.
-- �� ���̺��� �������� ����Ѵ�.
select
	a.id id_a, -- as�� �Ⱥٿ��� a.id�� id_a Į�� ������ �ٲ��� ��µȴ�.
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
inner join basket_b b on --basket_a�� basket_b�� ������ fruit�� ����Ѵ�.
	a.fruit = b.fruit;

-------------------------------------
select
	a.customer_id,
	a.first_name,
	a.last_name,
	a.email,
	b.amount,
	b.payment_date
from
	customer a
inner join payment b on --���� ���� ���� ������ �� �� �ִ�. ��1:����M -> 1:M ���谡 �ȴ�.
	a.customer_id = b.customer_id

-------------------------------------
select 
	a.customer_id,
	a.first_name,
	a.last_name,
	a.email,
	b.amount,
	b.payment_date 
from 
	customer a
inner join payment b on
	a.customer_id = b.customer_id
where a.customer_id = 2; -- join�� ���̺��� customer_id�� 2�� ����� ����Ѵ�.

-------------------------------------
select 
	a.customer_id,
	a.first_name,
	a.last_name,
	a.email,
	b.amount,
	b.payment_date,
	c.first_name staff_first_name,
	c.last_name s_last_name
from 
	customer a
inner join payment b on
	a.customer_id = b.customer_id
inner join staff c on 
	b.staff_id = c.staff_id 
