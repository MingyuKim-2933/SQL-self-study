-- SELF JOIN: ���� ���̺��� Ư�� Į���� �������� ��Ī �Ǵ� Į���� ����ϴ� �����̴�. 
-- �� ���� ���̺��� �����͸� ������ �������� �з��� �� �����Ѵ�.
-- ������ ���̺������� -> ������ �ٸ� �������� �����س��� -> �̰� �������� -> �� ���� �� �ȿ��� �ڽ��� ���ϴ� ������ �����Ѵ�.
create table employee -- employee ���̺� ����
(
	employee_id int primary key,
	first_name varchar (255) not null,
	last_name varchar (255) not null,
	manager_id int, -- ������
	foreign key (manager_id) -- ������ ���� �����ϸ� �������� ������.
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
select -- SELF JOIN -- �� ������ ���� �����ڸ� �����.
e.first_name || ' ' || e.last_name employee,
m.first_name || ' ' || m.last_name manager
from 
	employee e
inner join employee m on
	m.employee_id = e.manager_id
order by
	manager;

--------------------------------------
select -- SELF LEFT OUTER JOIN -- �� ������ ���� �����ڸ� ����ϸ鼭 ��� ������ �����.
e.first_name || ' ' || e.last_name employee,
m.first_name || ' ' || m.last_name manager
from 
	employee e
left outer join employee m on --outer ���� ����
	m.employee_id = e.manager_id
order by
	manager;

--------------------------------------
--SELF JOIN ������ ����
select
	f1.title,
	f2.title,
	f1.length
from
	film f1
inner join film f2 on
	f1.film_id <> f2.film_id -- �ʸ� ���̵�� ���� �ٸ��鼭 (<> : ���� �ٸ���)
	and f1.length =f2.length -- ��ȭ�� �� �ð��� ������ ��ȭ ���

-- �̷��� ����ϸ� title 1�� title 2�� ��ȭ�� �ߺ��Ͽ� ���´�.
--------------------------------------
select -- SELF JOIN�� ������� ������ ��µ��� �ʴ´�.
	*
from film f1
where f1.length = f1.length
and f1.film_id <> f1.film_id

