-- FULL OUTER JOIN: INNER,LEFT OUTER, RIGHT OUTER ���� ������ ��� ����ϴ� ���� ����̴�.
-- �� �� ���̺� ��� ������ ��� �����͸� ������ ����(������)�� ����Ѵ�.
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
-- ONLY OUTER ����
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
	
-------------------------------------- �����δ� �߰� �ǽ�
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
values --serial�� department_id���� ������ 1���� ���ʴ�� �Էµȴ�.
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
values --serial�� employee_id���� ������ 1���� ���ʴ�� �Էµȴ�.
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
--���� ��� ����� ������ RIGHT OUTER + RIGHT ONLY
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
--���� ��� ����� ������ LEFT OUTER + LEFT ONLY
select
	e.employee_name,
	d.department_name
from emp e
left join departments d on
	d.department_id = e.department_id
where
	d.department_name is null;

