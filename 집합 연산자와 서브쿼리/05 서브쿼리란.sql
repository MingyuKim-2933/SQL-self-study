-- 서브쿼리란 : 서브쿼리는 SQL문 내에서 메인 쿼리가 아닌 하위에 존재하는 쿼리를 말한다. 서브쿼리를 활용함으로써 다양한 결과를 도출 할 수 있다.
-- 2개의 SQL을 결합하여 하나의 SQL문으로 결과를 도출 하는 방법이다. 
-- 서브쿼리에는 중첩 서브쿼리, 인라인 뷰, 스칼라 서브쿼리가 존재한다. 셋 중 뭐가 제일 빠른지는 알 수 없다.
select 
	avg(f.rental_rate)
from
	film f
;

-----------------------------	
select
	f.film_id,
	f.title,
	f.rental_rate
from 
	film f
where f.rental_rate > 2.98
;

-- 서브쿼리를 사용하지 않으면 2개의 SQL을 사용해야 해서 불편하다.
------------------------------
select -- 중첩 서브쿼리의 활용
	f.film_id,
	f.title,
	f.rental_rate
from
	film f
where -- where문 안에 중첩 서브쿼리를 선언한다.
	f.rental_rate > -- 중첩 서브쿼리의 시작
	(
	select
		avg(f2.rental_rate)
	from
		film f2 
	) --중첩 서브쿼리의 종료
;

------------------------------
select -- 인라인 뷰의 활용
	f.film_id,
	f.title,
	f.rental_rate
from -- 인라인 뷰는 from절 안에 서브쿼리를 선언한다
	film f,
	(
	select
		avg(rental_rate) as avg_rental_rate
	from
		film 
	) f2
where f.rental_rate > f2.avg_rental_rate

------------------------------
select -- 스칼라 서브쿼리의 활용 -> 인라인 뷰 안에 또 서브쿼리가 존재한다.
 f.film_id,
	f.title,
	f.rental_rate
from -- 인라인 뷰는 from절 안에 서브쿼리를 선언한다
( -- 인라인 뷰의 시작
	select
		f.film_id,
		f.title,
		f.rental_rate,
		(  -- 스칼라 서브쿼리의 시작
		select
			avg(f2.rental_rate)
		from
			film f2 ) as avg_rental_rate -- 스칼라 서브쿼리의 종료
	from
		film f ) f -- 인라인 뷰의 종료
where
	f.rental_rate > f.avg_rental_rate
