-- NATURAL JOIN: 두 개의 테이블에서 같은이름을 가진 칼럼 간의 INNER 조인 집합 결과를 출력한다. SQL문 자체가 간소해 지는 방법이다.
-- 실무에서 자주 쓰이지는 않는다.
-- 실습 준비
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
	foreign key (category_id) -- 한 개의 카테고리는 여러 개의 제품를 받는다.
	references categories_a (category_id) -- 참조한다. 즉 특정 제품은 특정 카테고리를 가지고 있어야 한다. -- 외래키 제약 조건(참조 무결성 제약 조건)
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
select -- 자동으로 동일하게 가지고 있는 category_id 칼럼을 기준으로 INNER JOIN한다.
	*
from  
	products_a a
natural join
	categories_a b
;

-------------------------------------------
select -- NATURAL JOIN의 결과와 같다. 그러나 자동보다는 안정성 있는 INNER JOIN을 사용하는 것이 좋다.
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
select -- 위의 결과와 같다.
	a.category_id,
	a.product_id,
	a.product_name,
	b.category_name
from
	products_a a, categories_a b
where
	a.category_id = b.category_id
	
-------------------------------------------
-- 추가 실습
-- city와 country에는 동일한 이름으로 존재하는 칼럼이 country_id와 last_update이다.
-- 이런 경우 NATURAL JOIN 시에는 last_update 칼럼까지 INNER JOIN에 성공해야만 결과 값이 나온다.
select
	*  
from
	city a
natural join
	country b;

-------------------------------------------
select -- INNER JOIN을 사용하면 의도한 대로 데이터가 출력된다.
	*
from
	city a
inner join country b on
	a.country_id = b.country_id 

-------------------------------------------
select -- 위의 결과와 같다.
	*
from
	city a, country b
where
	a.country_id = b.country_id 