-- 특정 칼럼을 기준으로 정확히 매칭된 집합을 출력한다. INNER 조인은 대표적인 조인의 종류이다.
-- 두 테이블의 교집합을 출력한다.
select
	a.id id_a, -- as를 안붙여도 a.id가 id_a 칼럼 명으로 바껴서 출력된다.
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
inner join basket_b b on --basket_a와 basket_b의 교집합 fruit를 출력한다.
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
inner join payment b on --고객은 여러 건의 결제를 할 수 있다. 고객1:결제M -> 1:M 관계가 된다.
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
where a.customer_id = 2; -- join한 테이블에서 customer_id가 2인 사람만 출력한다.

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
