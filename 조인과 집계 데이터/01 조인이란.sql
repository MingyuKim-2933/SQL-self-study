-- �����̶�?
create table basket_a 
(
	ID INT primary key,
	fruit varchar (100) not null
);

select * from basket_a; -- �����Ͱ� ���� ������

-------------------------------------
insert into basket_a (id, fruit)
values
(1, 'Apple'),
(2, 'Orange'),
(3, 'Banana'),
(4, 'Cucumber')
;

-- insert, update, delete -> �������� ���� �� ���� -> commit;�� �ؾ��Ѵ�, rollback; -> Ʈ����� ó��
commit;

--------------------------------------
select * from basket_a

create table basket_b 
(
	ID INT primary key,
	fruit varchar (100) not null
);

select * from basket_b; -- �����Ͱ� ���� ������

---------------------------------------
insert into basket_a (id, fruit)
values
(1, 'Orange'),
(2, 'Apple'),
(3, 'Watermelon'),
(4, 'Pear')
;

-- insert, update, delete -> �������� ���� �� ���� -> commit;�� �ؾ��Ѵ�, rollback; -> Ʈ����� ó��
commit;

----------------------------------------

--������ ���ο� ���� �н��Ѵ�.

