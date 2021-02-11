-- OUTER JOIN: 특정 칼럼을 기준으로 매칭된 집합을 출력하지만 한쪽의 집합은 모두 출력하고 다른 한쪽의 집합은 매칭되는 칼럼의 값 만을 출력한다.
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
left outer join basket_b b on -- outer은 생략해도 문제가 없다.
	a.fruit = b.fruit
	
--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
left outer join basket_b b on -- outer은 생략해도 문제가 없다.
	a.fruit = b.fruit
where 
	b.id is null; -- left only: b를 제외한 오직 a에만 있는 데이터를 출력한다.

--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
right outer join basket_b b on-- outer은 생략해도 문제가 없다.
	a.fruit = b.fruit

--------------------------------------
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
right outer join basket_b b on -- outer은 생략해도 문제가 없다.
	a.fruit = b.fruit
where a.id is null -- right only: a를 제외한 오직 b에만 있는 데이터를 출력한다.