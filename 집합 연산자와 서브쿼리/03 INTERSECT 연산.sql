-- INTERSECT ���� : INTERSECT �����ڴ� �� �� �̻��� SELECT������ ��� ������ �ϳ��� ��� �������� �����Ѵ�.
-- ��, ���� A�� B�� �������� �����Ѵ�.
select -- inner join ����� ���� ����� ����Ѵ�. �ǹ������� inner join�� �� ���� ����Ѵ�.
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
select -- ���� ���� ����� ����Ѵ�. intersect�� ����� ������ ����ӵ��� ������.
	k.employee_id 
from
	keys k, hipos h
where k.employee_id = h.employee_id
;

----------------------------------
select -- ���� ���� ����� ����Ѵ�.
	k.employee_id 
from
	keys k
inner join hipos h on
	k.employee_id = h.employee_id 
;

----------------------------------
select -- order by�� �������� �����Ѵ�.
	employee_id
from
	keys
intersect
select
	employee_id
from
	hipos
order by -- order by�� ������ select�� ���Ŀ� �ۼ��Ѵ�.
	employee_id desc
;

----------------------------------
select -- ���� ���� ����� ����Ѵ�.
	k.employee_id 
from
	keys k, hipos h
where k.employee_id = h.employee_id
order by k.employee_id desc
;

----------------------------------
select -- ���� ���� ����� ����Ѵ�.
	k.employee_id 
from
	keys k
inner join hipos h on
	k.employee_id = h.employee_id 
order by k.employee_id desc
;