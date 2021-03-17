set search_path to salesordersexample;

문제1번)  소매가(retailprice)가 $125이상인 상품을 알파벳순으로 보여주십시오.

select
	*
from
	products p 
where
	p.retailprice >=125
order by
	productname 


문제2번)  캘리포니아 주에 거주 하며, 우편번호(custzipcode) 가 92199 인 고객이 몇 명인가요? 추가적으로, 전체 고객은 몇명인지 column 이름을 all_cnt_customer 이라는 컬럼으로 함께 알려주세요.

Hint 1. 캘리포니아 주 (custstate = 'CA')

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
	

문제3번)  주문 번호 (ordernumber) 8번에 대한 총 주문 금액은 얼마인가요? 

select
	sum(od.quantityordered*od.quotedprice)
from
	order_details od 
where
	ordernumber = 8
 
문제4번) 주문일이 2017-09-02일에 해당하면서,   상품 번호가 1 이거나 또는 상품의 개당 가격이 $1000~$2000 달러 사이인 상품에 대한 구매 정보를 알려주세요.
 필요 컬럼 : 주문일자, 고객ID, 주문번호, 상품번호,  상품개당 가격,  상품 주문 갯수, 상품 총 구매금액 을 함께 알려주세요.

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
	
문제5번)  도시 (vendcity)  Ballard, Bellevue 및 Redmond에 본사를 둔 모든 공급 업체(vendor) 의 이름은 무엇인가요? 

select
	v.vendname
from
	vendors v 
where 
	v.vendcity = 'Ballard'
	or v.vendcity = 'Bellevue'
	or v.vendcity = 'Redmond'
	
문제6번)  각 제품(product)의 제품명과 총 판매량( quantityordered )을 알려주세요. 추가로, 전체 판매량 또한 알려주세요. 

select p.productname, sum(od.quantityordered) as quantityordered , max(db.all_ordered) as total_sales
from (
select sum(od2.quantityordered) as all_ordered 
from order_details od2 
) as db, products p
inner join order_details od 
on p.productnumber = od.productnumber 
group by p.productname 

문제7번)  주문 금액이 $1000 이상이며,  총 주문 횟수가 3회 이상인 고객 번호와 이름은? 

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
 
문제8번) 미국 서해안에 있는 주 (custstate ) 에서 전체 주문 금액이 $1,000,000 가 넘는 주를 보여주세요.

Hint  1. 서해안 주  : custstate  =  'WA', 'OR', 'CA'


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


문제9번)  헬멧을 주문한 적 없는 고객을 보여주세요. not exists를 꼭 활용하여 풀이해주세요.
Hint 1. Productname을 활용하여 헬맷 확인 (카테고리테이블 활용 X)



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


문제10번) 고객의 월별 주문 횟수가 3 번 이상을 기록한 적 있는 모든 고객 이름은 무엇인가요? (GROUP BY, HAVING, JOIN 사용)


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


문제11번)직원과 고객중이  이름이 동일한 사람이 있을까요?  있다면 해당 사람의 이름에 대해서 (이름+ 성) 형식으로 알려주세요.

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


문제12번)  2017년 09 월에 해당 하는 주문에 대해서, 1~10일, 11~20일, 21~30일에 대한 각각의 구간에 대한 주문 금액을 보여주세요. 
row 수는 1개로  1~10일에 해당하는 주문금액,  11~20일에 해당하는 주문금액, 21~30일에 해당하는 주문금액과 , 총 주문금액에 대한 컬럼으로 보여주세요.

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


문제13번) 주문을 많이 한 고객 순서 대로 순위를 매겨 나열하세요.  (analytic function 활용)
- 같은 주문 수치 일 때, 같은 등수로 보여주세요.
- 순위는 1,2,3등의 형식으로 순차적인 값이 노출되어야 합니다.

- 단 고객의 리스트는 다음에 제한 조건을 가집니다.
- 월별 주문 5회 이상한 Case를  3개월 이상한 경험한 고객으로만 제한합니다. (3개월은 연속이던 불연속이던 상관없습니다.)
ex)  고객1이 1월에 6회 , 3월에 5회,  9월에 5회 주문한 경험이있다면 포함해야합니다. 


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
having count(db.order_month) >= 3


문제14번) Tire 카테고리 주문 량이 매달 증가하고 있나요?  (2017년 1월 ~ 12월 까지 판매량만 확인하시면 됩니다.)
    월별 주문량을 이전 달 주문량과 함께 표기해 증가 여부를 알려주세요.  (analytic function 활용)
    -- 아래의 표기 값으로 산출 해주세요. 
    - 이전 달 보다 값이 크다면 ? 'PLUS'
    - 이전 달의 값이 현재 값 보다 크다면 ? 'MINUS'
    - 현재 달의 판매 량과 이전 달 값이 같다면 ? 'SAME'
    - 이 외의 Case 는 ? NULL 
    
 Hint 1. 카테고리 테이블 활용 필요  - "Tires" 카테고리 확인 
 
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
		

문제15번) 주문일자별,  직원이 처리한  주문 수를 알려주세요. 총 전체 주문 수도 함께 보여주세요.  

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
