-- UNION ���� : �� �� �̻��� SELECT ������ ��� ������ ���� ��� �������� �����ϸ� ���� �� �ߺ��� �����ʹ� ���ŵȴ�.
-- �� ���� SELECT������ �ߺ��Ǵ� ������ ���� �ִٸ� �ߺ��� ���� �ȴ�.
-- ORDER BY�� �����ϰ��� �� ��� �� ������ SELECT���� ORDER BY���� ����Ѵ�.
select -- ('Mary', '100000')�ߺ� ���ŵ�.
	*
from
	sales2007_1
union
select
	*
from
	sales2007_2 s 
	
---------------------------------
select -- 'Mike, Jon, Marry' �ߺ� ���ŵ�
	name
from
	sales2007_1
union
select
	name
from
	sales2007_2 s 	
	
---------------------------------
select -- '100000' �ߺ� ���ŵ�
	amount
from
	sales2007_1
union
select
	amount
from
	sales2007_2 s 	

---------------------------------
select -- ('Mary', '100000')�ߺ� ���ŵ�.
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
		