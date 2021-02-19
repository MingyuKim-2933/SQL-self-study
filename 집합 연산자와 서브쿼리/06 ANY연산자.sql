-- ANY연산자 : ANY 연산자는 값을 서브쿼리에 의해 반환된 값 집합과 비교한다. ANY 연산자는 서브쿼리의 값이 어떠한 값이라도 만족을 하면 조건이 성립된다.
select 
	f.title,
	f.length 
from 
	film f
where length >= any -- 카테고리 별 영화 중 어떠한 영화(length 178이 최소값)의 length보다 크다면 출력한다. (178 이상이면 출력한다.)
(
	select
		max(f2.length)
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	group by
		fc.category_id
)
;

-------------------------------
select 
	f.title,
	f.length 
from 
	film f
where length = any -- 카테고리 별 영화 중 어떠한 영화의 length와 같다면 출력한다.
(
	select
		max(f2.length)
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	group by
		fc.category_id
)
;

-------------------------------
select -- 위와 같은 결과를 출력한다. 
	f.title,
	f.length 
from 
	film f
where length in -- '= ANY' 는 'IN'과 동일 / '= ANY'보다 'IN'이 직관적이여서 자주 쓰인다.
(
	select
		max(f2.length)
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	group by
		fc.category_id
)
;
