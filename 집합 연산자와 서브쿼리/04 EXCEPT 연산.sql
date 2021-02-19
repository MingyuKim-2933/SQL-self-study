-- EXCEPT 연산자는 맨위에 SELECT문의 결과 집합에서 그 아래에 있는 SELECT문의 결과 집합을 제외한 결과를 리턴한다.
-- 즉 집합 A와 B의 차집합을 리턴한다.(A-B)
select -- 재고가 존재하는 영화의 필름 ID와 영화 제목을 추출하는 SQL이다.
	distinct i.film_id, --필름과 인벤토리는 1:m관계 -> 두 테이블을 조인하면 -> 영화 하나당 여러 개의 재고가 나와서 distinct를 사용하여 중복을 제거한다.
	f.title
from
	inventory i
inner join film f on
	i.film_id = f.film_id
order by f.title 
;

--------------------------------
-- (전체 필름 - 재고가 존재하는 필름) = 재고가 존재하지 않는 필름
select
	f.film_id,
	f.title
from
	film f
except -- 재고가 존재하는 영화를 뺀다.
select
	distinct i.film_id,
	f2.title
from
	inventory i
inner join film f2 on
	i.film_id = f2.film_id
order by film_id
--결과 집합은 재고가 존재하지 않는 영화다.
