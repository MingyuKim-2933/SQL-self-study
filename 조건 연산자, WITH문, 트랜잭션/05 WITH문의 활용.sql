-- WITH문의 활용 : WITH문을 활용함으로써 SELECT문의 결과를 임시 집합으로 저장해두고 SQL문에서 마치 테이블처럼 해당 집합을 불러올 수 있다.
select
	f.film_id,
	f.title,
	(case
		when f.length < 30 then 'SHORT'
		when f.length >= 30 and f.length <90 then 'MEDIUM'
		when f.length >90 then 'long'
		end) length 
from 
	film f

-----------------------------
-- with문을 이용해서 해당 집합을 tmp1으로 지정하고 아래 select문에서 tmp1을 조회하였다.
with tmp1 as (
	select
		f.film_id,
		f.title,
		(case
			when f.length < 30 then 'SHORT'
			when f.length >= 30 and f.length <90 then 'MEDIUM'
			when f.length >90 then 'LONG'
			end) length -- as 생략 가능
	from 
		film f
)
select 
	* 
from 
	tmp1
where length = 'LONG' -- tmp1집합에서 상영시간 구분이 'LONG'인 집합을 출력하였다. 