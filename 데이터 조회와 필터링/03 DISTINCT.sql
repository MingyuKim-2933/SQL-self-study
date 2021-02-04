---------------------------------- DISTINCT를 사용하기 위한 테이블 생성.
drop table T1;
create table T1 (ID SERIAL not null primary key, BCOLOR VARCHAR, FCOLOR VARCHAR);

insert
	into T1 (BCOLOR, FCOLOR)
values
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue')
;

commit; -- 테이블 생성 -> DDL --> 치는 순간에 바로 적용

---------------------------------- 생성된 테이블 확인
select
	*
from 
	t1;

---------------------------------- distinct 사용(중복된 값 제거), 칼럼 1개 (DISTINCT)
select 
	distinct bcolor
from 
	t1
order by
	bcolor --오름차순으로 정렬
;

---------------------------------- distinct 사용, 칼럼 2개
select 
	distinct bcolor, fcolor
from 
	t1
order by
	bcolor, fcolor 
;

---------------------------------- distinct on 사용(자주 사용되지는 않음)
select 
	distinct on (bcolor) bcolor, fcolor -- bcolor 기준 중복 제거된 값이 기준 집합이 됨
from 
	t1
order by
	bcolor, fcolor;
