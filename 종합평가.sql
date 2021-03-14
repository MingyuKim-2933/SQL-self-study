-- ���� �����ϼ���!
set search_path to salesordersexample;

����1��)  �ҸŰ�(retailprice)�� $125�̻��� ��ǰ�� ���ĺ������� �����ֽʽÿ�.

select
	*
from
	products p 
where
	p.retailprice >=125
order by
	productname 


����2��)  Ķ�����Ͼ� �ֿ� ���� �ϸ�, �����ȣ(custzipcode) �� 92199 �� ���� �� ���ΰ���? �߰�������, ��ü ���� ������� column �̸��� all_cnt_customer �̶�� �÷����� �Բ� �˷��ּ���.

Hint 1. Ķ�����Ͼ� �� (custstate = 'CA')

select
	(select 
		count(*) 
	from 
		customers c2 
	where 
		custstate = 'CA'
		and c2.custzipcode = '92199') as cnt_customer,
	count(*) as all_cnt_customer
from
	customers c 
	

����3��)  �ֹ� ��ȣ (ordernumber) 8���� ���� �� �ֹ� �ݾ��� ���ΰ���? 

select
	sum(od.quantityordered*od.quotedprice)
from
	order_details od 
where
	ordernumber = 8
 
����4��) �ֹ����� 2017-09-02�Ͽ� �ش��ϸ鼭,   ��ǰ ��ȣ�� 1 �̰ų� �Ǵ� ��ǰ�� ���� ������ $1000~$2000 �޷� ������ ��ǰ�� ���� ���� ������ �˷��ּ���.
 �ʿ� �÷� : �ֹ�����, ��ID, �ֹ���ȣ, ��ǰ��ȣ,  ��ǰ���� ����,  ��ǰ �ֹ� ����, ��ǰ �� ���űݾ� �� �Բ� �˷��ּ���.

select
	o.orderdate ,
	o.customerid ,
	o.ordernumber,
	od.productnumber ,
	od.quotedprice ,
	od.quantityordered, 
	od.quantityordered*od.quotedprice as total_price
from
	orders o, 
	products p,
	order_details od 
where 
	o.ordernumber = p.productnumber 
	and p.productnumber = od.productnumber 
	and o.orderdate = '2017-09-02'
	and (od.productnumber = 1 
	or od.quotedprice between 1000 and 2000)
	
����5��)  ���� (vendcity)  Ballard, Bellevue �� Redmond�� ���縦 �� ��� ���� ��ü(vendor) �� �̸��� �����ΰ���? 

select
	v.vendname
from
	vendors v 
where 
	v.vendcity = 'Ballard'
	or v.vendcity = 'Bellevue'
	or v.vendcity = 'Redmond'
	
����6��)  �� ��ǰ(product)�� ��ǰ��� �� �Ǹŷ�( quantityordered )�� �˷��ּ���. �߰���, ��ü �Ǹŷ� ���� �˷��ּ���. 

select p.productname, sum(od.quantityordered) as quantityordered , max(db.all_ordered) as total_sales
from (
select sum(od2.quantityordered) as all_ordered 
from order_details od2 
) as db, products p
inner join order_details od 
on p.productnumber = od.productnumber 
group by p.productname 

����7��)  �ֹ� �ݾ��� $1000 �̻��̸�,  �� �ֹ� Ƚ���� 3ȸ �̻��� �� ��ȣ�� �̸���? 

select
	c.customerid,
	 concat(c.custfirstname, ' ', c.custlastname) as full_name
from
	customers c,
	order_details od,
	orders o 
where 
	c.customerid = o.customerid
	and o.ordernumber = od.ordernumber 
group by
	c.customerid
having
	count(od.ordernumber) >=3
	and sum(od.quantityordered * od.quotedprice) >= 1000
 
����8��) �̱� ���ؾȿ� �ִ� �� (custstate ) ���� ��ü �ֹ� �ݾ��� $1,000,000 �� �Ѵ� �ָ� �����ּ���.

Hint  1. ���ؾ� ��  : custstate  =  'WA', 'OR', 'CA'


select db.custstate, db.total_order_price
from (
	select
		c.custstate ,
		sum(od.quantityordered * od.quotedprice) as total_order_price
	from 
		customers c,
		orders o,
		order_details od
	where
		c.customerid = o.customerid
		and o.ordernumber = od.ordernumber 
	group by
		c.custstate
	having
		c.custstate in ('WA', 'OR', 'CA')
	) as db
where db.total_order_price >= 1000000


����9��)  ����� �ֹ��� �� ���� ���� �����ּ���. not exists�� �� Ȱ���Ͽ� Ǯ�����ּ���.
Hint 1. Productname�� Ȱ���Ͽ� ��� Ȯ�� (ī�װ����̺� Ȱ�� X)



select
	*
from 
	customers c,
	orders o,
	order_details od 
where 
	c.customerid = o.customerid 
	and o.ordernumber = od.ordernumber 
	and (not exists (
			select
				1
			from
				products p
			where
				od.productnumber = p.productnumber
				and p.productname like ('%Helmet')
			)) 


����10��) ���� ���� �ֹ� Ƚ���� 3 �� �̻��� ����� �� �ִ� ��� �� �̸��� �����ΰ���? (GROUP BY, HAVING, JOIN ���)


select distinct full_name
from(
select
	to_char(o.orderdate, 'mm') as order_month,
	concat(c.custfirstname, ' ', c.custlastname) as full_name,
	count(o.ordernumber)
from
	customers c
inner join orders o on
	c.customerid = o.customerid
group by
	to_char(o.orderdate, 'mm'),
	full_name
having
	count(o.ordernumber) >= 3
) as db


����11��)������ ������  �̸��� ������ ����� �������?  �ִٸ� �ش� ����� �̸��� ���ؼ� (�̸�+ ��) �������� �˷��ּ���.

select
	distinct concat(c.custfirstname, ' ', c.custlastname ) as custfullname,
	concat(e.empfirstname, ' ', e.emplastname) as empfullname
from
	customers c
inner join orders o on
	c.customerid = o.customerid
inner join employees e on
	o.employeeid = e.employeeid
where
	c.custfirstname = e.empfirstname


����12��)  2017�� 09 ���� �ش� �ϴ� �ֹ��� ���ؼ�, 1~10��, 11~20��, 21~30�Ͽ� ���� ������ ������ ���� �ֹ� �ݾ��� �����ּ���. 
row ���� 1����  1~10�Ͽ� �ش��ϴ� �ֹ��ݾ�,  11~20�Ͽ� �ش��ϴ� �ֹ��ݾ�, 21~30�Ͽ� �ش��ϴ� �ֹ��ݾװ� , �� �ֹ��ݾ׿� ���� �÷����� �����ּ���.

select
	db1.firstorder_sum,
	db2.secondorder_sum,
	db3.thirdorder_sum,
	db4.fullorder_sum
from
	(
	select
		sum(od.quantityordered*od.quotedprice) as firstorder_sum
	from
		orders o
	inner join order_details od on
		o.ordernumber = od.ordernumber
	where
		o.orderdate between '2017-09-01' and '2017-09-10' ) as db1,
	(
	select
		sum(od.quantityordered*od.quotedprice) as secondorder_sum
	from
		orders o
	inner join order_details od on
		o.ordernumber = od.ordernumber
	where
		o.orderdate between '2017-09-11' and '2017-09-20' ) as db2,
	(
	select
		sum(od.quantityordered*od.quotedprice) as thirdorder_sum
	from
		orders o
	inner join order_details od on
		o.ordernumber = od.ordernumber
	where
		o.orderdate between '2017-09-21' and '2017-09-30' ) as db3,
	(
	select
		sum(od.quantityordered*od.quotedprice) as fullorder_sum
	from
		orders o
	inner join order_details od on
		o.ordernumber = od.ordernumber
	where
		o.orderdate between '2017-09-01' and '2017-09-30' ) as db4


����13��) �ֹ��� ���� �� �� ���� ��� ������ �Ű� �����ϼ���.  (analytic function Ȱ��)
- ���� �ֹ� ��ġ �� ��, ���� ����� �����ּ���.
- ������ 1,2,3���� �������� �������� ���� ����Ǿ�� �մϴ�.

- �� ���� ����Ʈ�� ������ ���� ������ �����ϴ�.
- ���� �ֹ� 5ȸ �̻��� Case��  3���� �̻��� ������ �����θ� �����մϴ�. (3������ �����̴� �ҿ����̴� ��������ϴ�.)
ex)  ��1�� 1���� 6ȸ , 3���� 5ȸ,  9���� 5ȸ �ֹ��� �������ִٸ� �����ؾ��մϴ�. 


select
	db.customerid,
	rank() over(
	order by sum(order_cnt) desc),
	sum(order_cnt)
from
	(
	select
		to_char(o.orderdate , 'mm') as order_month,
		o.customerid,
		count(o.ordernumber) as order_cnt
	from
		orders o
	group by
		to_char(o.orderdate , 'mm'),
		o.customerid
	having
		count(o.ordernumber) >= 5 ) as db
group by
	db.customerid



����14��) Tire ī�װ� �ֹ� ���� �Ŵ� �����ϰ� �ֳ���?  (2017�� 1�� ~ 12�� ���� �Ǹŷ��� Ȯ���Ͻø� �˴ϴ�.)
    ���� �ֹ����� ���� �� �ֹ����� �Բ� ǥ���� ���� ���θ� �˷��ּ���.  (analytic function Ȱ��)
    -- �Ʒ��� ǥ�� ������ ���� ���ּ���. 
    - ���� �� ���� ���� ũ�ٸ� ? 'PLUS'
    - ���� ���� ���� ���� �� ���� ũ�ٸ� ? 'MINUS'
    - ���� ���� �Ǹ� ���� ���� �� ���� ���ٸ� ? 'SAME'
    - �� ���� Case �� ? NULL 
    
 Hint 1. ī�װ� ���̺� Ȱ�� �ʿ�  - "Tires" ī�װ� Ȯ�� 
 
select
	yyyy,
	mm,
	order_cnt,
	lag(order_cnt) over(
	order by mm) as lag_order_cnt,
	case
		when order_cnt > lag(order_cnt) over(
		order by mm)
		or order_cnt is null then 'PLUS'
		when order_cnt < lag(order_cnt) over(
		order by mm) then 'MINUS'
		when order_cnt = lag(order_cnt) over(
		order by mm) then 'SAME'
		when lag(order_cnt) over (
		order by mm) is null then null
		else null
	end as compare
from
	(
	select
		yyyy,
		mm,
		count(distinct o.ordernumber) order_cnt
	from
		(
		select
			o.ordernumber,
			extract(year
		from
			o.orderdate) as yyyy,
			extract(month
		from
			o.orderdate) as mm,
			od.productnumber,
			p.categoryid,
			c.categoryid,
			c.categorydescription
		from
			orders o,
			order_details od,
			products p,
			categories c
		where
			o.ordernumber = od.ordernumber
			and p.productnumber = od.productnumber
			and c.categoryid = p.categoryid
			and c.categorydescription = 'Tires'
			and extract(year
		from
			o.orderdate) = '2017' ) as o
	group by
		yyyy,
		mm ) as dt
order by
	mm
		


����15��) �ֹ����ں�,  ������ ó����  �ֹ� ���� �˷��ּ���. �� ��ü �ֹ� ���� �Բ� �����ּ���.  

select 
	o.orderdate,
	count(o.ordernumber) as count_order,
	max(db.total_ordernumber) as total_ordernumber 
from
	(
	select 
		count(o.ordernumber) as total_ordernumber
	from
		employees e, 
		orders o
	where
		e.employeeid = o.employeeid
	) as db,
	employees e, 
	orders o
where
	e.employeeid = o.employeeid 
group by
	o.orderdate 
