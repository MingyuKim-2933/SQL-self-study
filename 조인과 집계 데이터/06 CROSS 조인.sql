-- CROSS JOIN: 두 개의 테이블의 CATESIAN PRODUCT 연산의 결과를 출력한다. 데이터 복제에 많이 쓰이는 기법이다.
-- 실습 준비
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
select -- CATESIAN PRODUCT 연산의 결과가 출력된다. 2 x 3 = 6 개의 결과가 출력된다.
	*
from
	cross_t1
cross join cross_t2
order by
	label;

----------------------------------
select -- INNER 조인을 표현하는 다른 방법 (위와 결과가 같다.)
	*
from
	cross_t1, cross_t2
order by
	label;

----------------------------------
select label,
	case when label = 'A' then sum(score)
		when label = 'B' then sum(score) * -1
		else 0 -- A와 B 둘 중 어떤 경우도 아니면 0을 출력한다.
		end as calc -- case의 결과를 calc 칼럼을 만들어 출력한다.
from
	cross_t1
cross join cross_t2
group by
	label;