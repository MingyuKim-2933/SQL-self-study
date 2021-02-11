-- SELF JOIN: 같은 테이블끼리 특정 칼럼을 기준으로 매칭 되는 칼럼을 출력하는 조인이다. 
-- 즉 같은 테이블의 데이터를 각각의 집합으로 분류한 후 조인한다.
-- 동일한 테이블이지만 -> 각각의 다른 집합으로 구성해놓고 -> 이게 셀프조인 -> 그 다음 그 안에서 자신이 원하는 정보를 추출한다.
create table employee -- employee 테이블 생성
(
	employee_id int primary key,
	first_name varchar (255) not null,
	last_name varchar (255) not null,
	manager_id int, -- 관리자
	foreign key (manager_id) -- 참조를 통해 생성하면 조직도가 생성됨.
	references employee (employee_id)
	on delete cascade
	);

--------------------------------------
insert into employee 
(
	employee_id,
	first_name,
	last_name,
	manager_id
)
values
(1, 'Windy', 'Hays', null),
(2, 'Ava', 'Christensen', 1),
(3, 'Hassan', 'Conner', 1),
(4, 'Anna', 'Reeves', 2),
(5, 'Sau', 'Norman', 2),
(6, 'Kelsie', 'Hays', 3),
(7, 'Tory', 'Goff', 3),
(8, 'Salley', 'Lester', 3);

commit;

--------------------------------------
select * from employee

--------------------------------------
select -- SELF JOIN -- 각 직원의 상위 관리자를 출력함.
e.first_name || ' ' || e.last_name employee,
m.first_name || ' ' || m.last_name manager
from 
	employee e
inner join employee m on
	m.employee_id = e.manager_id
order by
	manager;

--------------------------------------
select -- SELF LEFT OUTER JOIN -- 각 직원의 상위 관리자를 출력하면서 모든 직원을 출력함.
e.first_name || ' ' || e.last_name employee,
m.first_name || ' ' || m.last_name manager
from 
	employee e
left outer join employee m on --outer 생략 가능
	m.employee_id = e.manager_id
order by
	manager;

--------------------------------------
--SELF JOIN 부정형 조건
select
	f1.title,
	f2.title,
	f1.length
from
	film f1
inner join film f2 on
	f1.film_id <> f2.film_id -- 필름 아이디는 서로 다르면서 (<> : 서로 다르다)
	and f1.length =f2.length -- 영화의 상영 시간은 동일한 영화 출력

-- 이렇게 출력하면 title 1과 title 2에 영화가 중복하여 나온다.
--------------------------------------
select -- SELF JOIN을 사용하지 않으면 출력되지 않는다.
	*
from film f1
where f1.length = f1.length
and f1.film_id <> f1.film_id

