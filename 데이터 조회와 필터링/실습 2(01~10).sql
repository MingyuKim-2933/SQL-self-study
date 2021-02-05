-- ����1��) film ���̺��� Ȱ���Ͽ�,  film ���̺���  100���� row �� Ȯ���غ�����. 
select
	* 
from
	film
order by film
	limit 100

-- ����2��) actor �� ��(last_name) ��  Jo �� �����ϴ� ����� id ���� ���� ���� ��� �ѻ���� ���Ͽ�, �����  id ����  �̸�, �� �� �˷��ּ���.
select
	actor_id,
	first_name,
	last_name
from 
	actor a
where	
	last_name like 'Jo%'
order by 
	actor_id limit 1

-- ����3��)film ���̺��� �̿��Ͽ�, film ���̺��� ���̵��� 1~10 ���̿� �ִ� ��� �÷��� Ȯ�����ּ���.	
select
	*
from
	film
where
	film_id between 1 and 10
	
-- ����4��) country ���̺��� �̿��Ͽ�, country �̸��� A �� �����ϴ� country �� Ȯ�����ּ���.
select 
	country
from
	country
where
	country like 'A%'

-- ����5��) country ���̺��� �̿��Ͽ�, country �̸��� s �� ������ country �� Ȯ�����ּ���.
select 
	country
from
	country
where
	country like '%s'	

-- ����6��) address ���̺��� �̿��Ͽ�, �����ȣ(postal_code) ���� 77�� �����ϴ� �ּҿ� ���Ͽ�, address_id, address, district ,postal_code �÷��� Ȯ�����ּ���.	
select 
	address_id,
	address,
	district,
	postal_code
from
	address
where
	postal_code like '77%'

-- ����8��) payment ���̺��� �̿��Ͽ�,  ����ȣ�� 341�� �ش� �ϴ� ����� ������ 2007�� 2�� 15~16�� ���̿� �� ��� ���������� Ȯ�����ּ���.	
select 
	*
from 
	payment
where
	customer_id = 341
	and cast(payment_date as date) between '2007-02-15' and '2007-02-16'

-- ����9��) payment ���̺��� �̿��Ͽ�, ����ȣ�� 355�� �ش� �ϴ� ����� ���� �ݾ��� 1~3�� ���̿� �ش��ϴ� ��� ���� ������ Ȯ�����ּ���.
select 
	*
from 
	payment
where
	customer_id = 355
	and amount between 1 and 3

-- ����10��) customer ���̺��� �̿��Ͽ�, ���� �̸��� Maria, Lisa, Mike �� �ش��ϴ� ����� id, �̸�, ���� Ȯ�����ּ���.
select
	customer_id,
	first_name,
	last_name
from
	customer
where
	first_name = 'Maria'
	or first_name ='Lisa'
	or first_name  = 'Mike'

-- ����11��) film ���̺��� �̿��Ͽ�,  film�� ���̰�  100~120 �� �ش��ϰų� �Ǵ� rental �뿩�Ⱓ�� 3~5�Ͽ� �ش��ϴ� film �� ��� ������ Ȯ�����ּ���.
select
	*
from
	film
where
	length between 100 and 120
	or rental_duration between 3 and 5

-- ����12��) address ���̺��� �̿��Ͽ�, postal_code ����  ����('') �̰ų� 35200, 17886 �� �ش��ϴ� address �� ��� ������ Ȯ�����ּ���.
select
	*
from
	address
where
	postal_code ='' 
	or postal_code = '35200'
	or postal_code = '17886'

-- ����13��) address ���̺��� �̿��Ͽ�,  address �� ���ּ�(=address2) ����  �������� �ʴ� ��� �����͸� Ȯ���Ͽ� �ּ���.
select
	*
from
	address 
where
	address2 is null

-- ����14��) staff ���̺��� �̿��Ͽ�, staff �� picture ������ ���� �ִ� ������ id, �̸�,���� Ȯ�����ּ���.
-- �� �̸��� ���� �ϳ��� �÷����� �̸�, ���� ���·� ���ο� �÷� name �÷����� �������ּ���.
select 
	staff_id,
	first_name || ' ' || last_name as name	
from 
	staff
where
	picture is not null
	
-- ����15��) rental ���̺��� �̿��Ͽ�, �뿩�������� ���� �ݳ� ����� ���� �뿩���� ��� ������ Ȯ�����ּ���.
select
	*
from 
	rental
where
	return_date is null

-- ����16��) address ���̺��� �̿��Ͽ�, postal_code ����  �� ��(NULL) �̰ų� 35200, 17886 �� �ش��ϴ� address �� ��� ������ Ȯ�����ּ���.
select
	*
from
	address
where
	postal_code is null
	or postal_code = '35200'
	or postal_code  = '17886'

-- ����17��) ���� ���� John �̶�� �ܾ ����, ���� �̸��� ���� ��� ã���ּ���.	
select
	first_name,
	last_name
from
	customer
where
	last_name like '%John%'

-- ����18��) �ּ� ���̺���, address2 ���� null ���� row ��ü�� Ȯ���غ����?
select
	*
from 
	address
where
	address2 is null