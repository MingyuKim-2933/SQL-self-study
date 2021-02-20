-- WITH���� Ȱ�� : WITH���� Ȱ�������ν� SELECT���� ����� �ӽ� �������� �����صΰ� SQL������ ��ġ ���̺�ó�� �ش� ������ �ҷ��� �� �ִ�.
select
	f.film_id,
	f.title,
	(case
		when f.length < 30 then 'SHORT'
		when f.length >= 30 and f.length <90 then 'MEDIUM'
		when f.length >90 then 'long'
		end) length 
from 
	film f

-----------------------------
-- with���� �̿��ؼ� �ش� ������ tmp1���� �����ϰ� �Ʒ� select������ tmp1�� ��ȸ�Ͽ���.
with tmp1 as (
	select
		f.film_id,
		f.title,
		(case
			when f.length < 30 then 'SHORT'
			when f.length >= 30 and f.length <90 then 'MEDIUM'
			when f.length >90 then 'LONG'
			end) length -- as ���� ����
	from 
		film f
)
select 
	* 
from 
	tmp1
where length = 'LONG' -- tmp1���տ��� �󿵽ð� ������ 'LONG'�� ������ ����Ͽ���. 