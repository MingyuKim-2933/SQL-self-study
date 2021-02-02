---------------------------------- customer 테이블의 칼럼을 오름차순과 내림차순으로 정렬 (ORDER BY)
select
	a.first_name,
	a.last_name
from 
	customer a
order by
	first_name asc, -- 오름차순 --순차적
	last_name desc -- 내림차순 -- 역순 -- first_name이 같으면 last_name 역순으로 정렬한다.

--order by에 칼럼의 문자열을 적어주는 것이 유지보수적 측면과 가독성 측면에서 좋다.
	
---------------------------------- customer 테이블의 칼럼을 오름차순과 내림차순으로 정렬
select
	a.first_name,
	a.last_name
from 
	customer a
order by
	1 asc, -- 오름차순 --순차적 -- 1은 first_name
	2 desc -- 내림차순 -- 역순 -- first_name이 같으면 last_name 역순으로 정렬한다. --2는 last_name

---------------------------------- DISTINCT를 사용하면 중복 값을 제외한다.
