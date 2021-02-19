-- GROUPING SET��: GROUPING SET���� ����Ͽ� ���� ���� UNION ALL�� �̿��� SQL�� ���� ����� ������ �� �ִ�.
select * from sales

----------------------------------
select -- brand, segment �������� Grouping
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
;

----------------------------------
select -- brand �������� Grouping
	s.brand,
	sum(s.quantity)
from
	sales s
group by
	s.brand
;

----------------------------------
select -- segment �������� Grouping
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.segment
;

----------------------------------
select -- ��ü �հ�
	sum(s.quantity)
from
	sales s
;

----------------------------------
-- ���� 4���� �������� UnionAll �����ڸ� ����Ͽ� �ϳ��� ��ģ��.
-- ������ ���̺��� 4���� �а� �ִ�. -> ���� ���� ���ɼ��� �����Ѵ�.
-- �ʹ� SQL���� �������. -> ����������. -> ���������� ��ƴ�.
select -- brand, segment �������� Grouping
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s
group by
	s.brand, s.segment
union all
select -- brand �������� Grouping
	s2.brand,
	null,
	sum(s2.quantity)
from
	sales s2
group by
	s2.brand
union all
select -- segment �������� Grouping
	null,
	s3.segment,
	sum(s3.quantity)
from
	sales s3
group by
	s3.segment
union all
select -- ��ü �հ�
	null,
	null,
	sum(s4.quantity)
from
	sales s4
;

----------------------------------
-- GROUPING SET���� ����Ͽ� �����ϰ� ���� �������� ���� ����� ����� �� �ִ�.
select
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- ��ȣ ���� ����
		(s.segment), -- ��ȣ ���� ����
		()
	)
;

----------------------------------
select
	grouping(s.brand) grouping_brand, -- �ش� Į���� ���迡 ���Ǿ����� 0, �׷��� ������ 1�� �����Ѵ�.
	grouping(s.segment) grouping_segement, -- �ش� Į���� ���迡 ���Ǿ����� 0, �׷��� ������ 1�� �����Ѵ�.
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- ��ȣ ���� ����
		(s.segment), -- ��ȣ ���� ����
		()
	)
;

----------------------------------
select
	case
	when grouping(s.brand) = 0 and grouping(s.segment) = 0 then '�귣�庰+��޺�'
	when grouping(s.brand) = 0 and grouping(s.segment) = 1 then '�귣�庰'
	when grouping(s.brand) = 1 and grouping(s.segment) = 0 then '��޺�'
	when grouping(s.brand) = 1 and grouping(s.segment) = 1 then '��ü�հ�'
	else ''
	end as "�������",
	s.brand,
	s.segment,
	sum(s.quantity)
from
	sales s 
group by
	grouping sets(
		(s.brand, s.segment),
		(s.brand), -- ��ȣ ���� ����
		(s.segment), -- ��ȣ ���� ����
		()
	)
order by 
	s.brand, s.segment 
;