-- Cube�� : ������ GROUPING Į���� ������ �Ұ踦 �����ϴµ� ���ȴ�. ������ �������� ������ �Ұ踦 ����� �� �ִ�.
-- CUBE�� �� ������ ������ 3���̸� 2�� 3������ �Ұ谡 �߻��ϰ� �ȴ�. �� 8���� �Ұ谡 �߻��ϰ� �ȴ�.( CUBE���� 2�� N���� = �Ұ��� ���� �ȴ�.)
select -- CUBE�� = group by�� �հ� + brand�� �հ� + segment�� �հ� + ��ü �հ� (4����)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	cube (s.brand, s.segment)
order by
	s.brand, s.segment

----------------------------------
select -- ROLL UP�� = group by�� �հ� + brand�� �հ� + ��ü �հ� (3����)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	rollup (s.brand, s.segment)
order by
	s.brand, s.segment
	
----------------------------------
select -- �κ� CUBE�� = group by�� �հ� + brand�� �հ� (2����)
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by 
	s.brand,
	cube (s.segment)
order by
	s.brand, s.segment