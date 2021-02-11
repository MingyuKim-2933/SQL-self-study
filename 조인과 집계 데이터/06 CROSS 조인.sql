-- CROSS JOIN: �� ���� ���̺��� CATESIAN PRODUCT ������ ����� ����Ѵ�. ������ ������ ���� ���̴� ����̴�.
-- �ǽ� �غ�
create table cross_t1
(label char(1) primary key);

----------------------------------
create table cross_t2
(score int primary key);

----------------------------------
insert into cross_t1 (label)
values
('A'),
('B');

commit;

----------------------------------
insert into cross_t2 (score)
values
(1),
(2),
(3);

commit;

----------------------------------
select -- CATESIAN PRODUCT ������ ����� ��µȴ�. 2 x 3 = 6 ���� ����� ��µȴ�.
	*
from
	cross_t1
cross join cross_t2
order by
	label;

----------------------------------
select -- INNER ������ ǥ���ϴ� �ٸ� ��� (���� ����� ����.)
	*
from
	cross_t1, cross_t2
order by
	label;

----------------------------------
select label,
	case when label = 'A' then sum(score)
		when label = 'B' then sum(score) * -1
		else 0 -- A�� B �� �� � ��쵵 �ƴϸ� 0�� ����Ѵ�.
		end as calc -- case�� ����� calc Į���� ����� ����Ѵ�.
from
	cross_t1
cross join cross_t2
group by
	label;