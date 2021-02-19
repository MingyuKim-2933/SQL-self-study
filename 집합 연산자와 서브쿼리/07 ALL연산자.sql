-- ALL연산자 : ALL 연산자는 값을 서브 쿼리에 의해 반환된 값 집합과 비교한다. ALL 연산자는 서브쿼리의 모든 값이 만족을 해야만 조건이 성립된다.
select 
	f.title,
	f.length 
from 
	film f
where length >= all -- 카테고리 별 영화 중 모든 영화(length 185가 최댓값)의 length보다 크다면 출력한다. (185 이상이면 출력한다.)
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

----------------------------------------
select 
	f.film_id,
	f.title,
	f.length
from
	film f
where length > all -- round(avg(f2.length), 2)가 120.44가 최댓값이여서 120.44 이상의 값들이 출력된다.
(
	select
		round(avg(f2.length), 2) -- round(수 , 소수점 자리) round()의 두번 째 인자는 반올림하여 몇 번째 자리까지 보여줄 지 정해준다.
	from 
		film f2
	group by 
		f2.rating
)
order by f.length
;