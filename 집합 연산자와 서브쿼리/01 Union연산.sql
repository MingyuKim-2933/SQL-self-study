-- UNION 연산 : 두 개 이상의 SELECT 문들의 결과 집합을 단일 결과 집합으로 결합하며 결합 시 중복된 데이터는 제거된다.
-- 두 개의 SELECT문에서 중복되는 데이터 값이 있다면 중복은 제거 된다.
-- ORDER BY로 정렬하고자 할 경우 맨 마지막 SELECT문에 ORDER BY절을 사용한다.
select -- ('Mary', '100000')중복 제거됨.
	*
from
	sales2007_1
union
select
	*
from
	sales2007_2 s 
	
---------------------------------
select -- 'Mike, Jon, Marry' 중복 제거됨
	name
from
	sales2007_1
union
select
	name
from
	sales2007_2 s 	
	
---------------------------------
select -- '100000' 중복 제거됨
	amount
from
	sales2007_1
union
select
	amount
from
	sales2007_2 s 	

---------------------------------
select -- ('Mary', '100000')중복 제거됨.
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
		