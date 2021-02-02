----------------------------------WHERE 절
select 
	last_name, --3
	first_name
from 
	customer --1
where
	first_name = 'Jamie' --2
;

----------------------------------WHERE 절에 AND를 사용하여 조건 추가
select
	last_name,
	first_name
from
	customer
where
	first_name = 'Jamie'
	and last_name = 'Rice' ;

-- DBeaver블럭 선택 후 ctrl + shift + F를 하면 자동 줄 맞춤을 실행한다. 	

----------------------------------WHERE 절에 OR을 사용하여 조건 추가
select
	customer_id,
	amount,
	payment_data
from
	payment
where
	amount <= 1
	or amount >= 8
