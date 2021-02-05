-- 특정 집합을 출력 시 출력하는 행의 수를 한정하는 역할을 한다. 부분 범위 처리시 사용된다.(LIMIT절과 같은 역할)
-- FETCH절은 oracle에서 지원함.
select
	f.film_id,
	f.title
from
	film f
order by
	title fetch first row only -- title로 정렬한 집합 중에서 최초의 단 한 건의 행을 리턴한다. db에서 한 건만 조회하는 경우가 많다.

------------------------------
select
	f2.film_id,
	f2.title
from
	film f2
order by
	title fetch first 3 row only -- title로 정렬한 집합 중에서 세 개의 행을 리턴한다. db에서 한 건만 조회하는 경우가 많다.

------------------------------
select
	f3.film_id,
	f3.title
from
	film f3
order by
	title offset 5 rows -- 6번 부터 출력한다.
 fetch first 5 row only	-- 5개의 행을 출력한다.
