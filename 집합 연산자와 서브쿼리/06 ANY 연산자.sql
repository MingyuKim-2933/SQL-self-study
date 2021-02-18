-- ANY 연산자는 값을 서브쿼리에 의해 반환된 값 집합과 비교한다. ANY 연산자는 서브쿼리의 값이 어떠한 값이라도 만족을 하면 조건이 성립된다.
select 
	f.title,
	f.length 
from 
	film f
where length >= any
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

	select
		f2.title,
		f2.length
	from 
		film f2,
		film_category fc
	where
		f2.film_id = fc.film_id
	