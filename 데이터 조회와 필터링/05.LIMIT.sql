select
	f.film_id,
	f.title,
	f.release_year
from
	film f
order by film_id -- ORDER BY를 한 결과중에서
	limit 4 -- 4건만 출력한다.
	offset 3; -- (0, 1, 2, 3) 3번부터 출력된다. 즉 4번째 데이터부터 출력된다.

---------------------------------------------------------------------
select
	f2.film_id,
	f2.title,
	f2.rental_rate 
from
	film f2 
order by rental_rate desc -- rental_rate를 내림차순으로 정렬
limit 100 offset 5; -- 6번째 데이터부터 100개를 출력한다.
