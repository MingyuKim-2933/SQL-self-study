-- UnionAll연산: 두 개 이상의 SELECT 문들의 결과 집합을 단일 결과 집합으로 결합하며 결합 시 중복된 데이터도 모두 출력한다.
select -- 중복이 제거되지 않는다. 
	*
from
	sales2007_1
union all
select
	*
from
	sales2007_2 s 
	
---------------------------------
select -- 중복이 제거 되지 않는다.
	name
from
	sales2007_1
union
select
	name
from
	sales2007_2 s 	
	
---------------------------------
select -- 중복이 제거 되지 않는다.
	amount
from
	sales2007_1
union
select
	amount
from
	sales2007_2 s 	

---------------------------------
select -- 중복이 제거 되지 않는다.
	*
from
	sales2007_1
union
select
	*
from
	sales2007_2 s 
order by --ORDER BY는 맨 마지막 SELECT문에 작성 해야 한다.
	amount desc 