-- ROLLUP절 : 지정된 GROUPING 칼럼의 소계를 생성하는데 사용된다. 간단한 문법으로 다양한 소계를 출력할 수 있다.
select
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
order by 
	s.brand, s.segment

----------------------------------------
select -- rollup 절을 사용하면 group by별 합계 + rollup절의 맨 앞에 쓴 칼럼 기준의 합계 + 전체 합계
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	rollup (s.brand, s.segment)
order by 
	s.brand, s.segment

----------------------------------------
select
	s.segment,
	sum(quantity)
from
	sales s
group by
	s.segment
order by 
	s.segment 

----------------------------------------
select
	s.segment,
	sum(quantity)
from
	sales s
group by
	rollup (s.segment)
order by 
	s.segment 

----------------------------------------
select
	s.segment,
	s.brand,
	sum(quantity)
from
	sales s
group by
	s.segment,
	rollup (s.brand) -- 부분 ROLLUP시 전체 합계는 구하지 않는다. ->group by별 합계 + 맨 앞에 쓴 칼럼별 합계(segment 별)가 출력된다.
order by 
	s.segment , s.brand
	
----------------------------------------
select
	s.segment,
	s.brand,
	sum(quantity)
from
	sales s
group by
	s.brand,
	rollup (s.segment) -- 부분 ROLLUP시 전체 합계는 구하지 않는다. ->group by별 합계 + 맨 앞에 쓴 칼럼별 합계(brand 별)가 출력된다.
order by 
	s.segment , s.brand	