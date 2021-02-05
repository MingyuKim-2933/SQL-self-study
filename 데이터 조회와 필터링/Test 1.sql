����1��)  �� ��ǰ ������ 5 % ���̸� ��� �ɱ��?

select
	0.95 * p.retailprice as salesprice
from
	salesordersexample.products p ;

����2��)  ���� �ֹ��� ����� �ֹ� ���ڷ� �������� �����ؼ� �����ּ���.

select
	*
from
	salesordersexample.orders o
order by
	orderdate desc ;

����3��)  employees ���̺��� �̿��Ͽ�, 705 ���̵� ���� ������, �̸�, ���� �ش� ������ �¾ �ظ� Ȯ�����ּ���. 

select
	e.empfirstname,
	e.emplastname,
	e.empbirthdate
from
	salesordersexample.employees e
where
	e.employeeid = 705 ;
 

����4��)  customers ���̺��� �̿��Ͽ�, ���� �̸��� ���� �ϳ��� �÷����� ��ü �̸��� �����ּ��� (�̸�, ���� ���·� full_name �̶�� �̸����� �����ּ���) 

select
	concat(c.custfirstname, ', ', c.custlastname) as full_name
from
	salesordersexample.customers c ;

����5��) orders ���̺��� Ȱ���Ͽ�, ����ȣ�� 1001�� �ش��ϴ� ����� employeeid �� 707�� �������κ��� �� �ֹ��� id �� �ֹ� ��¥�� �˷��ּ���.  
         * �ֹ����� ���������� �����Ͽ�, �����ּ���.

select
	o2.ordernumber,
	o2.orderdate
from
	salesordersexample.orders o2
where
	o2.customerid = 1001
	and o2.employeeid = 707
order by
	o2.orderdate ;

����6��)  vendors ���̺��� �̿��Ͽ�, ������ ��ġ�� state �ְ� ��� �Ǵ���, Ȯ���غ�����. �ߺ��� �ְ� �ִٸ�, �ߺ����� �Ŀ� �˷��ּ���. 

select
	distinct v.vendstate
from
	salesordersexample.vendors v ;

����7��) �ֹ����ڰ� 2017-09-02~ 09-03�� ���̿� �ش��ϴ� �ֹ� ��ȣ�� �˷��ּ���.

select 
	o3.ordernumber
from
	salesordersexample.orders o3
where
	o3.orderdate between '2017-09-02' and '2017-09-03' ;

����8��) products ���̺��� Ȱ���Ͽ�, productdescription�� ��ǰ �� ���� ���� ���� ��ǰ �����͸� ��� �˷��ּ���.

select 
	*
from
	salesordersexample.products p2 
where
	p2.productdescription is null ;


����9 ��) vendors ���̺��� �̿��Ͽ�, vendor�� State ������ NY �Ǵ� WA �� ��ü�� �̸��� �˷��ּ���.

select
	v2.vendname 
from
	salesordersexample.vendors v2
where
	v2.vendstate = 'NY' 
	or v2.vendstate = 'WA'

����10��)  customers ���̺��� �̿��Ͽ�, ���� id ����, custstate ���� �� WA ������ ��� ����� WA �� �ƴ� ������ ��� ����� �����ؼ� �����ּ���.
 - customerid ��,  newstate_flag �÷����� �������ּ��� .
 - newstate_flag �÷��� WA �� OTHERS ��  �������ֽø� �˴ϴ�.

select
	c2.customerid,
	replace(c2.custstate, not 'WA', 'OTHERS') as newstate_flag
from 
	salesordersexample.customers c2
