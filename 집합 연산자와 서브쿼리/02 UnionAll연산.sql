-- UnionAll����: �� �� �̻��� SELECT ������ ��� ������ ���� ��� �������� �����ϸ� ���� �� �ߺ��� �����͵� ��� ����Ѵ�.
select -- �ߺ��� ���ŵ��� �ʴ´�. 
	*
from
	sales2007_1
union all
select
	*
from
	sales2007_2 s 
	
---------------------------------
select -- �ߺ��� ���� ���� �ʴ´�.
	name
from
	sales2007_1
union
select
	name
from
	sales2007_2 s 	
	
---------------------------------
select -- �ߺ��� ���� ���� �ʴ´�.
	amount
from
	sales2007_1
union
select
	amount
from
	sales2007_2 s 	

---------------------------------
select -- �ߺ��� ���� ���� �ʴ´�.
	*
from
	sales2007_1
union
select
	*
from
	sales2007_2 s 
order by --ORDER BY�� �� ������ SELECT���� �ۼ� �ؾ� �Ѵ�.
	amount desc 