-- ROLLUP�� : ������ GROUPING Į���� �Ұ踦 �����ϴµ� ���ȴ�. ������ �������� �پ��� �Ұ踦 ����� �� �ִ�.
select
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
order by 
	s.brand, s.segment

----------------------------------------
select -- rollup ���� ����ϸ� group by�� �հ� + rollup���� �� �տ� �� Į�� ������ �հ� + ��ü �հ�
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	rollup (s.brand, s.segment)
order by 
	s.brand, s.segment

----------------------------------------
select
	s.segment,
	sum(quantity)
from
	sales s
group by
	s.segment
order by 
	s.segment 

----------------------------------------
select
	s.segment,
	sum(quantity)
from
	sales s
group by
	rollup (s.segment)
order by 
	s.segment 

----------------------------------------
select
	s.segment,
	s.brand,
	sum(quantity)
from
	sales s
group by
	s.segment,
	rollup (s.brand) -- �κ� ROLLUP�� ��ü �հ�� ������ �ʴ´�. ->group by�� �հ� + �� �տ� �� Į���� �հ�(segment ��)�� ��µȴ�.
order by 
	s.segment , s.brand
	
----------------------------------------
select
	s.segment,
	s.brand,
	sum(quantity)
from
	sales s
group by
	s.brand,
	rollup (s.segment) -- �κ� ROLLUP�� ��ü �հ�� ������ �ʴ´�. ->group by�� �հ� + �� �տ� �� Į���� �հ�(brand ��)�� ��µȴ�.
order by 
	s.segment , s.brand	