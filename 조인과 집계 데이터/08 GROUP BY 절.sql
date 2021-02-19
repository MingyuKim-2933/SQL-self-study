-- GROUP BY절 : GROUP BY 절은 SELECT문에서 반환된 행을 그룹으로 나눈다. 각 그룹에 대한 합계, 평균, 카운트 등을 계산할 수 있다.
select -- 중복 값이 제거된 customer_id를 구할 수 있다.
	p.customer_id
from 
	payment p
group by -- 한 개의 custome r_id가 payment 테이블에 여러 번 들어갈 수 있는데 group by를 사용하면 중복된 customer_id를 제거해준다.
	p.customer_id
;
------------------------------------------
select --위의 결과와 똑같다(distinct가 중복을 제거해준다.)
	distinct p.customer_id
from
	payment p
;	
------------------------------------------
select -- 거래액이 가장 많은 고객순으로 출력한다.
	p.customer_id,
	sum(amount) as amount_sum
	from
	payment p
group by p.customer_id
order by amount_sum desc -- amount_sum 대신 sum(amount)도 가능
;

------------------------------------------
select -- 위와 같은 결과가 출력되지만 order by에 숫자로 넘버링 하는 것은 값이 바뀔 수도 있어서 추천하지 않는다.
	p.customer_id,
	sum(amount) as amount_sum
	from
	payment p
group by p.customer_id
order by 2 desc
;

------------------------------------------
select -- group by를 사용하여 staff들의 중복을 제거하고 각 staff들의 계산 횟수를 count하여 출력한다.
	p.staff_id,
	count(p.payment_id) as count
from 
	payment p
group by staff_id
;

------------------------------------------
select 
	p.staff_id,
	s.staff_id,
	s.first_name,
	s.last_name,
	count(p.payment_id) as count
from 
	payment p, staff s
where
	p.staff_id = s.staff_id
group by --위의 select문에서 선언된 칼럼들은 group by에 모두 선언해주어야 한다.
	p.staff_id,
	s.staff_id,
	s.first_name,
	s.last_name 
;

