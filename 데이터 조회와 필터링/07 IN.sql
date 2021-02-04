-- 특정 집합(컬럼 혹은 리스트)에서 특정 집합 혹은 리스트가 존재하는지 판단하는 연산자이다.
 select
	customer_id,
	rental_id,
	return_date
from
	rental
where
	customer_id in (1, 2) -- customer_id == 1 or customer_id ==2 와 같다.
order by
	return_date desc;
--가독성, 알아보기 쉽다
--(DBMS 최적화기, SQL 최적화) 옵티마이저의 특성상 IN조건이 성능상 유리할 때가 많다.

---------------------------------------------------------------------- not in
 select
	customer_id,
	rental_id,
	return_date
from
	rental
where
	customer_id not in (1, 2) -- customer_id != 1 and customer_id !=2 와 같다.
order by
	return_date desc;
	
---------------------------------------------------------------------- 서브 쿼리
select
	r.customer_id,
	return_date
from
	rental r
where
	cast (return_date as date) = '2005-05-27' --return_date를 date 타입으로 형 변환한다. cast()는 형변환을 시켜준다.

---------------------------------------------------------------------- 서브 쿼리
select
	c.first_name,
	c.last_name
from
	customer c
where
	customer_id in ( -- 서브쿼리 사용
	select
		r.customer_id -- 서브쿼리 안에 first_name과 last_name을 넣으면 데이터의 중복이 발생되어 좋지 않다.
	from
		rental r
	where
		cast (return_date as date) = '2005-05-27' );