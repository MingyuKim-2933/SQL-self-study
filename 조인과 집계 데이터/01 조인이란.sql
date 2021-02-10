-- 조인이란?
create table basket_a 
(
	ID INT primary key,
	fruit varchar (100) not null
);

select * from basket_a; -- 데이터가 없는 공집합

-------------------------------------
insert into basket_a (id, fruit)
values
(1, 'Apple'),
(2, 'Orange'),
(3, 'Banana'),
(4, 'Cucumber')
;

-- insert, update, delete -> 데이터의 삽입 및 갱신 -> commit;을 해야한다, rollback; -> 트랜잭션 처리
commit;

--------------------------------------
select * from basket_a

create table basket_b 
(
	ID INT primary key,
	fruit varchar (100) not null
);

select * from basket_b; -- 데이터가 없는 공집합

---------------------------------------
insert into basket_a (id, fruit)
values
(1, 'Orange'),
(2, 'Apple'),
(3, 'Watermelon'),
(4, 'Pear')
;

-- insert, update, delete -> 데이터의 삽입 및 갱신 -> commit;을 해야한다, rollback; -> 트랜잭션 처리
commit;

----------------------------------------

--앞으로 조인에 대해 학습한다.

