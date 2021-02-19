-- GROUPING SET절: GROUPING SET절을 사용하여 여러 개의 UNION ALL을 이용한 SQL과 같은 결과를 도출할 수 있다.
select * from sales

----------------------------------
select -- brand, segment 기준으로 Grouping
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
;

----------------------------------
select -- brand 기준으로 Grouping
	s.brand,
	sum(s.quantity)
from
	sales s
group by
	s.brand
;

----------------------------------
select -- segment 기준으로 Grouping
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.segment
;

----------------------------------
select -- 전체 합계
	sum(s.quantity)
from
	sales s
;

----------------------------------
-- 위의 4개의 쿼리문을 UnionAll 연산자를 사용하여 하나로 합친다.
-- 동일한 테이블을 4번씩 읽고 있다. -> 성능 저하 가능성이 존재한다.
-- 너무 SQL문이 길어진다. -> 복잡해진다. -> 유지보수가 어렵다.
select -- brand, segment 기준으로 Grouping
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
union all
select -- brand 기준으로 Grouping
	s2.brand,
	null,
	sum(s2.quantity)
from
	sales s2
group by
	s2.brand
union all
select -- segment 기준으로 Grouping
	null,
	s3.segment,
	sum(s3.quantity)
from
	sales s3
group by
	s3.segment
union all
select -- 전체 합계
	null,
	null,
	sum(s4.quantity)
from
	sales s4
;

----------------------------------
-- GROUPING SET절을 사용하여 간단하게 위의 쿼리문과 같은 결과를 출력할 수 있다.
select
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- 괄호 생략 가능
		(s.segment), -- 괄호 생략 가능
		()
	)
;

----------------------------------
select
	grouping(s.brand) grouping_brand, -- 해당 칼럼이 집계에 사용되었으면 0, 그렇지 않으면 1을 리턴한다.
	grouping(s.segment) grouping_segement, -- 해당 칼럼이 집계에 사용되었으면 0, 그렇지 않으면 1을 리턴한다.
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- 괄호 생략 가능
		(s.segment), -- 괄호 생략 가능
		()
	)
;

----------------------------------
select
	case
	when grouping(s.brand) = 0 and grouping(s.segment) = 0 then '브랜드별+등급별'
	when grouping(s.brand) = 0 and grouping(s.segment) = 1 then '브랜드별'
	when grouping(s.brand) = 1 and grouping(s.segment) = 0 then '등급별'
	when grouping(s.brand) = 1 and grouping(s.segment) = 1 then '전체합계'
	else ''
	end as "집계기준",
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- 괄호 생략 가능
		(s.segment), -- 괄호 생략 가능
		()
	)
order by 
	s.brand, s.segment 
;