# 조인과 집계 데이터

1. 조인이란 : 2개 이상의 테이블에 있는 정보 중 사용자가 필요한 집합에 맞게 가상의 테이블처럼 만들어서 결과를 보여주는 것이다.

2. INNER 조인 : 특정 칼럼을 기준으로 정확히 매칭된 집합을 출력한다.

3. OUTER 조인 : 특정 칼럼을 기준으로 매칭된 집합을 출력하지만 한쪽의 집합은 모두 출력하고 다른 한쪽의 집합은 매칭되는 컬럼의 값 만을 출력한다.

4. SELF 조인 : 동일한 테이블 끼리의 특정 컬럼을 기준으로 매칭되는 집합을 출력한다.

5. FULL OUTER 조인 : INNER, LEFT OUTER, RIGHT OUTER 조인 집합을 모두 출력한다.

6. CROSS 조인 : Cartesian Product이라고도 하며 조인되는 두 테이블에서 곱집합을 반환한다.

7. NATURAL 조인 : 특정 테이블의 같은 이름을 가진 칼럼 간의 조인집합을 출력한다.

8. Group BY절 : GROUP BY 절은 SELECT문에서 반환된 행을 그룹으로 나눈다. 각 그룹에 대한 합계, 평균, 카운트 등을 계산할 수 있다.

9. Having절 : GROUP BY절과 함께 HAVING절을 사용하여 GROUP BY의 결과를 특정 조건으로 필터링 하는 기능을 한다.

10. Grouping Set절 : GROUPING SET절을 사용하여 여러 개의 UNION ALL을 이용한 SQL과 같은 결과를 도출할 수 있다.

11. ROLLUP절 : 지정된 GROUPING 칼럼의 소계를 생성하는데 사용된다. 간단한 문법으로 다양한 소계를 출력할 수 있다.

12. Cube절 : 지정된 GROUPING 칼럼의 다차원 소계를 생성하는데 사용된다. 간단한 문법으로 다차원 소계를 출력할 수 있다.

13. 분석함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 합계 및 카운트 등을 계산할 수 있는 함수이다.

14. AVG 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 평균을 구하는 함수이다.

15. ROW_NUMBER, RANK, DENSE_RANK 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 순위를 구하는 함수이다. 

16. FIRST_VALUE, LAST_VALUE 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 첫번째 값(first_value) 혹은 마지막 값(last_value)을 구하는 함수이다.

17. LAG, LEAD 함수 : 특정 집합 내에서 결과 건수의 변화 없이 해당 집합 안에서 특정 칼럼의 이전 행의 값 혹은 다음 행의 값을 구하는 함수이다.

----------------------------------------------------------------------------------------

실습 1 (01~07)

실습 2 (01~09)

Test 2
