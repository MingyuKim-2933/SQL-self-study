-- Ư�� ���տ��� ��� Į���� ���� Ư�� �����ȿ� ���� ������ ����ϴ� �������̴�.
SELECT
	p0.customer_id,
	p0.payment_id,
	p0.amount
FROM
	payment p0
WHERE
	p0.amount BETWEEN 8 AND 9
	
/* �� SQL�� �� SQL�� ����� ������.
where
	p.amount >= 8
	and p.amount <= 9
*/

--------------------------------	
SELECT
	p1.customer_id,
	p1.payment_id,
	p1.amount
FROM
	payment p1
WHERE
	p1.amount NOT BETWEEN 8 AND 9	
	
/* �� SQL�� �� SQL�� ����� ������.
where
	p.amount < 8
	or p.amount > 9
*/
	
--------------------------------
select 
	p2.customer_id,
	p2.payment_id,
	p2.amount,
	p2.payment_date
from 
	payment p2 
where
	cast(p2.payment_date as date) between '2007-02-07' and '2007-02-15'--payment_date�� date ������ Ÿ������ �� ��ȯ �����ش�. -- cast()�� �� ��ȯ�� �����ش�.

	-- to_char(p2.payment_date, 'YYYY-MM-DD') between '2007-02-07' and '2007-02-15' -- payment_date�� ������ Ÿ���� char�� ��ȯ��Ų��. -- �� SQL�� �� SQL�� ����� ������.
	