-- INTERSECT 연산 : INTERSECT 연산자는 두 개 이상의 SELECT문들의 결과 집합을 하나의 결과 집합으로 결합한다.
-- 즉, 집합 A와 B의 교집합을 리턴한다.
select -- inner join 연산과 같은 결과를 출력한다. 실무에서는 inner join을 더 많이 사용한다.
	employee_id
from
	keys
intersect
select
	employee_id
from
	hipos
;

----------------------------------
select -- 위와 같은 결과를 출력한다. intersect를 사용할 때보다 연산속도가 빠르다.
	k.employee_id 
from
	keys k, hipos h
where k.employee_id = h.employee_id
;

----------------------------------
select -- 위와 같은 결과를 출력한다.
	k.employee_id 
from
	keys k
inner join hipos h on
	k.employee_id = h.employee_id 
;

----------------------------------
select -- order by로 역순으로 정렬한다.
	employee_id
from
	keys
intersect
select
	employee_id
from
	hipos
order by -- order by는 마지막 select문 이후에 작성한다.
	employee_id desc
;

----------------------------------
select -- 위와 같은 결과를 출력한다.
	k.employee_id 
from
	keys k, hipos h
where k.employee_id = h.employee_id
order by k.employee_id desc
;

----------------------------------
select -- 위와 같은 결과를 출력한다.
	k.employee_id 
from
	keys k
inner join hipos h on
	k.employee_id = h.employee_id 
order by k.employee_id desc
;