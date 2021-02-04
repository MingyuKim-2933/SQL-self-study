-- ����1��) dvd ��Ż ��ü��  dvd �뿩�� �־��� ��¥�� Ȯ�����ּ���.
select 
	distinct date(rental_date) --date()�� ����ϸ� ��, ��, �ʸ� ������ ��¥�� ��ȯ�Ѵ�.
from
	rental
	
-- ����2��) ��ȭ���̰� 120�� �̻��̸鼭, �뿩�Ⱓ�� 4�� �̻��� ������, ��ȭ������ �˷��ּ���.
select
	title
from
	film
where
	length >=120
	and rental_duration >=4

-- ����3��) ������ id �� 2 ����  ������  id, �̸�, ���� �˷��ּ���
select	
	staff_id,
	first_name,
	last_name
from
	staff
where 
	staff_id = 2

-- ����4��) ���� ���� �߿���,   ���� ���� ��ȣ�� 17510 �� �ش��ϴ�  ,  ���� ���� ���� (amount) �� ���ΰ���?
select
	amount
from 
	payment
where
	payment_id = 17510

-- ����5��) ��ȭ ī�װ� �߿��� ,Sci-Fi  ī�װ���  ī�װ� ��ȣ�� ����ΰ���?
select 
	A.category_id
from 
	category A
where
	name = 'Sci-Fi' -- ���ڿ��� ��� ''�� ����Ͽ��� �Ѵ�.( "" ��� �Ұ�)
	
-- ����6��) film ���̺��� Ȱ���Ͽ�, rating  ���(?) �� ���ؼ�, ��� ����� �ִ��� Ȯ���غ�����. 	
--5���� ����� �ִ�.
/*
rating
PG-13
NC-17
G
PG
R
*/
select
	count(distinct rating) -- count()�� ����ϸ� ������ ��ȯ�Ѵ�.
from
	film
	
-- ����7��) �뿩 �Ⱓ�� (ȸ�� - �뿩��) 10�� �̻��̿��� rental ���̺� ���� ��� ������ �˷��ּ���. �� , �뿩�Ⱓ��  �뿩���ں��� �뿩�Ⱓ���� �����Ͽ� ����մϴ�.
select
	*,
	date(return_date) - date(rental_date) + 1 as check -- as()�� �̸��� �ٿ��ش�. check��� Į���� ������ ���� �߰��Ѵ�.
from
	rental
where
	date(return_date) - date(rental_date) + 1 >= 10 

-- ����8��) ���� id ��  50,100,150 ..�� 50���� ����� �ش��ϴ� ���鿡 ���ؼ�, ȸ�� ���� ���� �̺�Ʈ�� �����Ϸ����մϴ�. �� ���̵� 50�� ����� ���̵��, ���� �̸� (��, �̸�)�� �̸��Ͽ� ���ؼ� Ȯ�����ּ���.	
select
	c.customer_id,
	c.last_name ||',' || first_name  as fullname , -- ||�� ����ϸ� ������ �ΰ��� ���δ�.
	c.email
from
	customer c
where
	--customer_id % 50 = 0
	mod(customer_id , 50) = 0 -- mod(a, b)�� a % b�� ��ȯ�Ѵ�.

-- ����9��) ��ȭ ������ ���̰� 8������, ��ȭ ���� ����Ʈ�� �������ּ���.
select 
	f.title
from
	film f
where 
	length(title) = 8 -- length()�� ����ϸ� ���ڿ��� ���̸� ��ȯ�Ѵ�.

-- ����10��)	city ���̺��� city ������ ��ΰ���?	

-- 1)1�� Ǯ��
select
	count(distinct city) -- 599��. �ǹ����� ���� ����
from
	city c 

-- 2)2�� Ǯ��
select
	* -- 600��
from
	city
order by
	city_id desc
	
-- 3)3�� Ǯ��
select
	max(city_id) -- 600��
from
	city c

-- ����11��)	��ȭ����� �̸� (�̸�+' '+��) �� ���ؼ�,  �빮�ڷ� �̸��� �����ּ���.  �� ��ȭ����� �̸��� ������ ����� �ִٸ�,  �ߺ� �����ϰ�, �˷��ּ���.
select
	distinct (upper(a.first_name) || ' '|| upper(a.last_name)) as fullname -- ���ο� Į���� ���� ������ as�� ����Ͽ� Į������ �ٿ��ִ� ���� ����. upper()�� �빮��, lower()�� �ҹ���
from
	actor a

-- ����12��)	�� �߿���,  active ���°� 0 �� �� ���� ������� �ʰ� �ִ� ���� ���� �˷��ּ���.
select
	count(active = 0)
from
	customer

-- ����13��)	Customer ���̺��� Ȱ���Ͽ�,  store_id = 1 �� ���ε�  ���� ���� ������� Ȯ���غ�����.
select
	count(store_id = 1)
from
	customer c

-- ����14��)	rental ���̺��� Ȱ���Ͽ�,  ���� return �ߴ� ��¥�� 2005��6��20�Ͽ� �ش��ߴ� rental �� ������ ������� Ȯ���غ�����. ?????
select
	count(date(return_date) = '2005-06-20')
from
	rental

-- ����15��)	film ���̺��� Ȱ���Ͽ�, 2006�⿡ ��ð� �ǰ� rating �� 'G' ��޿� �ش��ϸ�, �뿩�Ⱓ�� 3�Ͽ� �ش��ϴ�  �Ϳ� ���� film ���̺��� ��� �÷��� �˷��ּ���.
select
	*
from
	film f
where
	release_year = 2006
	and rating = 'G'
	and rental_duration = 3
	
-- ����16��)	language ���̺� �ִ� id, name �÷��� Ȯ���غ����� .
 select
 	language_id,
 	name
 from
 	language 

-- ����17��)	film ���̺��� Ȱ���Ͽ�,  rental_duration ��  7�� �̻� �뿩�� ������  film �� ���ؼ�  film_id,   title,  description �÷��� Ȯ���غ�����.	
select
	f.film_id,
	f.title,
	f.description
from
	film f
where
	rental_duration >= 7
	
-- ����18��)	film ���̺��� Ȱ���Ͽ�,  rental_duration   �뿩�� ������ ���ڰ� 3�� �Ǵ� 5�Ͽ� �ش��ϴ�  film_id,  title, desciption �� Ȯ�����ּ���.	
select
	f2.film_id,
	f2.title,
	f2.description
from
	film f2
where
	rental_duration = 3
	or rental_duration =5
	
-- ����19��)	Actor ���̺��� �̿��Ͽ�,  �̸��� Nick �̰ų�  ���� Hunt ��  �����  id ��  �̸�, ���� Ȯ�����ּ���.	
select
	a.actor_id, 
	a.first_name, 
	a.last_name 
from
	actor a 
where
	a.first_name = 'Nick'
	or a.last_name = 'Hunt'
-- ����20��)	Actor ���̺��� �̿��Ͽ�, Actor ���̺���  first_name �÷��� last_name �÷��� , firstname, lastname ���� �÷����� �ٲ㼭 �����ּ���	?????
select
	a2.firstname = a2.first_name,
	a2.lastname = a2.last_name
from
	actor a2