-- EXCEPT �����ڴ� ������ SELECT���� ��� ���տ��� �� �Ʒ��� �ִ� SELECT���� ��� ������ ������ ����� �����Ѵ�.
-- �� ���� A�� B�� �������� �����Ѵ�.(A-B)
select -- ��� �����ϴ� ��ȭ�� �ʸ� ID�� ��ȭ ������ �����ϴ� SQL�̴�.
	distinct i.film_id, --�ʸ��� �κ��丮�� 1:m���� -> �� ���̺��� �����ϸ� -> ��ȭ �ϳ��� ���� ���� ��� ���ͼ� distinct�� ����Ͽ� �ߺ��� �����Ѵ�.
	f.title
from
	inventory i
inner join film f on
	i.film_id = f.film_id
order by f.title 
;

--------------------------------
-- (��ü �ʸ� - ��� �����ϴ� �ʸ�) = ��� �������� �ʴ� �ʸ�
select
	f.film_id,
	f.title
from
	film f
except -- ��� �����ϴ� ��ȭ�� ����.
select
	distinct i.film_id,
	f2.title
from
	inventory i
inner join film f2 on
	i.film_id = f2.film_id
order by title