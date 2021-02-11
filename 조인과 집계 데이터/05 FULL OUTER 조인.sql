-- FULL OUTER JOIN: INNER,LEFT OUTER, RIGHT OUTER 조인 집합을 모두 출력하는 조인 방식이다.
-- 즉 두 테이블간 출력 가능한 모든 데이터를 포함한 집합(합집합)을 출력한다.
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
full outer join
	basket_b b on
	a.fruit = b.fruit;

--------------------------------------
-- ONLY OUTER 조인
select
	a.id id_a,
	a.fruit fruit_a,
	b.id id_b,
	b.fruit fruit_b
from
	basket_a a
full outer join
	basket_b b on
	a.fruit = b.fruit
where 
	a.id is null --right outer
	or b.id is null; -- left outer
	
-------------------------------------- 밑으로는 추가 실습
create table
if not exists departments
(
	department_id serial primary key,
	department_name varchar (255) not null
	);

--------------------------------------
create table
if not exists emp
(
	employee_id serial primary key,
	employee_name varchar (255),
	department_id integer
);

--------------------------------------
insert into departments(department_name)
values --serial인 department_id에는 정수로 1부터 차례대로 입력된다.
('Sales'),
('Marketing'),
('HR'),
('IT'),
('Production');

commit;

--------------------------------------
insert into emp(
	employee_name,
	department_id
	) 
values --serial인 employee_id에는 정수로 1부터 차례대로 입력된다.
('Bette Nicholson', 1),
('Christian Gable', 1),
('Joe Swank', 2),
('Fred Costner', 3),
('Sandra Kilmer', 4),
('Julia Mcqueen', null);

commit;

--------------------------------------
--FULL OUTER JOIN
select
	e.employee_name,
	d.department_name
from emp e
full outer join departments d on
	d.department_id = e.department_id;

--------------------------------------
--FULL OUTER + RIGHT ONLY
select
	e.employee_name,
	d.department_name
from emp e
full outer join departments d on
	d.department_id = e.department_id
where
	e.employee_name is null;

--------------------------------------
--위와 출력 결과는 같은데 RIGHT OUTER + RIGHT ONLY
select
	e.employee_name,
	d.department_name
from emp e
right join departments d on
	d.department_id = e.department_id
where
	e.employee_name is null;

--------------------------------------
--FULL OUTER + LEFT ONLY
select
	e.employee_name,
	d.department_name
from emp e
full outer join departments d on
	d.department_id = e.department_id
where
	d.department_name is null;

--------------------------------------
--위와 출력 결과는 같은데 LEFT OUTER + LEFT ONLY
select
	e.employee_name,
	d.department_name
from emp e
left join departments d on
	d.department_id = e.department_id
where
	d.department_name is null;

