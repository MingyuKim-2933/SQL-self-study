-- Cube절 : 지정된 GROUPING 칼럼의 다차원 소계를 생성하는데 사용된다. 간단한 문법으로 다차원 소계를 출력할 수 있다.
-- CUBE절 내 인자의 개수가 3개이면 2의 3제곱의 소계가 발생하게 된다. 즉 8개의 소계가 발생하게 된다.( CUBE절은 2의 N제곱 = 소계의 수가 된다.)
select -- CUBE절 = group by절 합계 + brand별 합계 + segment별 합계 + 전체 합계 (4가지)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	cube (s.brand, s.segment)
order by
	s.brand, s.segment

----------------------------------
select -- ROLL UP절 = group by절 합계 + brand별 합계 + 전체 합계 (3가지)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	rollup (s.brand, s.segment)
order by
	s.brand, s.segment
	
----------------------------------
select -- 부분 CUBE절 = group by절 합계 + brand별 합계 (2가지)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by 
	s.brand,
	cube (s.segment)
order by
	s.brand, s.segment