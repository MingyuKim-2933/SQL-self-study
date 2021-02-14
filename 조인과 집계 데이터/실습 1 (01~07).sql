-- ����1��) ���� �⺻ ������ �� id, �̸�, ��, �̸��ϰ� �Բ� ���� �ּ� address, district, postal_code, phone ��ȣ�� �Բ� �����ּ���.
-- INNER JOIN
select
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.district,
	a.postal_code,
	a.phone 
from
	customer c
inner join address a on
	a.address_id = c.address_id 
;

-------------------------------------
--���� ����� ����.
select
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.district,
	a.postal_code,
	a.phone 
from
	customer c, address a
where
	a.address_id = c.address_id
;

-- ����2��) ���� �⺻ ������ �� id, �̸�, ��, �̸��ϰ� �Բ� ���� �ּ�, address, district, postal_code, phone, city�� �Բ� �˷��ּ���.
-- INNER JOIN 2�� ���
select
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.district,
	a.postal_code,
	a.phone,
	ci.city
from
	customer c
inner join address a on
	a.address_id = c.address_id
inner join city ci on
	a.city_id = ci.city_id  
;

-------------------------------------
select --���� ����� ����.
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.district,
	a.postal_code,
	a.phone,
	ci.city
from
	customer c, address a, city ci
where 
	a.address_id = c.address_id
	and a.city_id = ci.city_id
;

-- ����3��) Lima City�� ��� ���� �̸��� ��, �̸���, phonenumber�� ���ؼ� �˷��ּ���.
select
	c.first_name,
	c.last_name,
	c.email,
	a.phone 
from
	customer c
inner join address a on
	a.address_id = c.address_id
inner join city ci on
	a.city_id = ci.city_id 
where 
	ci.city = 'Lima'
;

-------------------------------------
select --���� ����� ����.
	c.first_name,
	c.last_name,
	c.email,
	a.phone 
from
	customer c, address a, city ci
where 
	a.address_id = c.address_id
	and a.city_id = ci.city_id 
	and ci.city = 'Lima'
;

-- ����4��) rental ������ �߰��� ���� �̸���, ������ �̸��� �Բ� �����ּ���.
-- ���� �̸�, ���� �̸��� �̸��� ���� fullname Į������ ���� �����̸�/���̸� 2���� Į������ Ȯ�����ּ���.
select 
	r,
	c.first_name || ' ' || c.last_name c_fullname,
	s.first_name  || ' ' || s.last_name s_fullname
from
	rental r
inner join customer c on
	r.customer_id = c.customer_id	
inner join staff s on
	r.staff_id = s.staff_id
;

-------------------------------------	
select -- ���� ����� ����. ������ ���� ����ð����� 2�� ���� ������. (�� 16�� -> �� 8��)
	r,
	c.first_name || ' ' || c.last_name c_fullname,
	s.first_name  || ' ' || s.last_name s_fullname
from
	rental r, customer c, staff s
where 
	r.customer_id = c.customer_id
	and r.staff_id = s.staff_id
;

-- ����5��) seth.hannon@sakilacustomer.org �̸��� �ּҸ� ���� ���� �ּ� address, address2, postal_code, phone, city �ּҸ� �˷��ּ���.
select
	a.address,
	a.address2,
	a.postal_code,
	a.phone,
	ci.city
from
	customer c
inner join address a on
	c.address_id = a.address_id
inner join city ci on
	a.city_id = ci.city_id 
where
	c.email = 'seth.hannon@sakilacustomer.org'

-------------------------------------		
select -- ���� ����� ����.
	a.address,
	a.address2,
	a.postal_code,
	a.phone,
	ci.city
from
	customer c, address a, city ci
where
	c.address_id = a.address_id
	and a.city_id = ci.city_id
	and c.email = 'seth.hannon@sakilacustomer.org'
	
	