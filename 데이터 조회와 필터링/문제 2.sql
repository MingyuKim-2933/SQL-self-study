-- ���鿡�� ��ü �̸����� ���� �ϰ��� �Ѵ�. CUSTOMER ���̺��� ���� EMAIL�ּҸ� �����ϰ�, �̸��� ���Ŀ� ���� �ʴ� �̸��� �ּҴ� ���ܽ��Ѷ�.
--(�̸��� ������ '@'�� �����ؾ� �ϰ� '@'�� �������� ���ƾ� �ϰ� '@'�� ������ ���ƾ� �Ѵ�.)
select
	email
from
	customer c
where
	email like '%@%'
	and email not like '@%'
	and email not like '%@'
;