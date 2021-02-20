-- 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 합계 및 카운트 등을 계산할 수 있는 함수이다.
select -- 집계 함수는 집계의 결과만을 출력하는 한계가 있다.
	count(*)
from
	product
	
--------------------------------
select -- 집계의 결과와 테이블의 내용도 함께 보여준다. (count + 테이블의 내용)
	count(*) over() , p.* -- count(*)의 결과를 모든 행에 붙여준다.
from
	product p 
	
--------------------------------
--select  -- 사용하고자 하는 분석함수를 쓰고 대상 칼럼을 기재 후 partition by에서 값을 구하는 기준 칼럼을 쓰고 order by에서 정렬 칼럼을 기재한다.
--	c1,
--	분석함수(c2, c3, ...) over (partition by c4 order by c5)
--from table_name
--;