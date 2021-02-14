-- NATURAL JOIN: �� ���� ���̺��� �����̸��� ���� Į�� ���� INNER ���� ���� ����� ����Ѵ�. SQL�� ��ü�� ������ ���� ����̴�.
-- �ǹ����� ���� �������� �ʴ´�.
-- �ǽ� �غ�
create table categories_a
(
	category_id serial primary key,
	category_name varchar (255) not null
);

-------------------------------------------
create table products_a
(
	product_id serial primary key,
	product_name varchar (255) not null,
	category_id int not null,
	foreign key (category_id) -- �� ���� ī�װ��� ���� ���� ��ǰ�� �޴´�.
	references categories_a (category_id) -- �����Ѵ�. �� Ư�� ��ǰ�� Ư�� ī�װ��� ������ �־�� �Ѵ�. -- �ܷ�Ű ���� ����(���� ���Ἲ ���� ����)
);	

-------------------------------------------
insert into categories_a(category_name)
values
('Samrt Phone'),
('Laptop'),
('Tablet');

commit;

-------------------------------------------
insert into products_a
	(product_name,
	 category_id)
values
('iPhone', 1),
('Samsung Galaxy', 1),
('HP Elite', 2),
('Lenovo Thinkpad', 2),
('iPad', 3),
('Kindle Fire', 3);

commit;

-------------------------------------------
select -- �ڵ����� �����ϰ� ������ �ִ� category_id Į���� �������� INNER JOIN�Ѵ�.
	*
from  
	products_a a
natural join
	categories_a b
;

-------------------------------------------
select -- NATURAL JOIN�� ����� ����. �׷��� �ڵ����ٴ� ������ �ִ� INNER JOIN�� ����ϴ� ���� ����.
	a.category_id,
	a.product_id,
	a.product_name,
	b.category_name
from
	products_a a
inner join
	categories_a b on
	a.category_id = b.category_id

-------------------------------------------	
select -- ���� ����� ����.
	a.category_id,
	a.product_id,
	a.product_name,
	b.category_name
from
	products_a a, categories_a b
where
	a.category_id = b.category_id
	
-------------------------------------------
-- �߰� �ǽ�
-- city�� country���� ������ �̸����� �����ϴ� Į���� country_id�� last_update�̴�.
-- �̷� ��� NATURAL JOIN �ÿ��� last_update Į������ INNER JOIN�� �����ؾ߸� ��� ���� ���´�.
select
	*  
from
	city a
natural join
	country b;

-------------------------------------------
select -- INNER JOIN�� ����ϸ� �ǵ��� ��� �����Ͱ� ��µȴ�.
	*
from
	city a
inner join country b on
	a.country_id = b.country_id 

-------------------------------------------
select -- ���� ����� ����.
	*
from
	city a, country b
where
	a.country_id = b.country_id 