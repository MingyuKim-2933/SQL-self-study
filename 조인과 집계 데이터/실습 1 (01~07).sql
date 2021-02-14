-- 문제1번) 고객의 기본 정보인 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
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
--위의 결과와 같다.
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

-- 문제2번) 고객의 기본 정보인 고객 id, 이름, 성, 이메일과 함께 고객의 주소, address, district, postal_code, phone, city를 함께 알려주세요.
-- INNER JOIN 2번 사용
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
select --위의 결과와 같다.
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

-- 문제3번) Lima City에 사는 고객의 이름과 성, 이메일, phonenumber에 대해서 알려주세요.
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
select --위의 결과와 같다.
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

-- 문제4번) rental 정보에 추가로 고객의 이름과, 직원의 이름을 함께 보여주세요.
-- 고객의 이름, 직원 이름은 이름과 성을 fullname 칼럼으로 만들어서 직원이름/고객이름 2개의 칼럼으로 확인해주세요.
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
select -- 위의 결과와 같다. 하지만 위의 실행시간보다 2배 가량 빠르다. (약 16초 -> 약 8초)
	r,
	c.first_name || ' ' || c.last_name c_fullname,
	s.first_name  || ' ' || s.last_name s_fullname
from
	rental r, customer c, staff s
where 
	r.customer_id = c.customer_id
	and r.staff_id = s.staff_id
;

-- 문제5번) seth.hannon@sakilacustomer.org 이메일 주소를 가진 고객의 주소 address, address2, postal_code, phone, city 주소를 알려주세요.
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
select -- 위의 결과와 같다.
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
	
	