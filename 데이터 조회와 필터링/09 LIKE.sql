-- 특정 집합에서 어떠한 칼럼의 값이 특정 값과 유사한 패턴을 갖는 집합을 출력하는 연산자이다.
/*
특정 패턴에서 '%'는 어떤 문자 혹은 문자열이든지 매칭 되었다고 판단한다.
특정 패턴에서 '_'는 한 개의 문자가 어떤 문자이든지 매칭 되었다고 판단한다.

'FOO' LIKE 'FOO' -> TRUE 'FOO'는 'FOO'이므로 참이다.
'FOO' LIKE 'F%' -> TRUE 'F%'는 'F'로 시작하면 모두 참이다.
'FOO' LIKE  '_O_' -> TURE '_O_'는 3자리 문자열이고 가운데 문자가 'O'라면 모두 참이다.
'BAR' LIKE 'B_' FALSE 'B_'는 2자리 문자열이고 'B'로 시작하기만 하면 두번째 문자는 무엇이든 간에 참이다. 하지만 'BAR'는 'B'로 시작하긴 했지만 3자리 이므로 거짓이다.
*/
---------------------------------------------------------------
SELECT
	'FOO' LIKE 'FOO', --TRUE
	'FOO' LIKE 'F%' , --TRUE
	'FOO' LIKE  '_O_', --TRUE
	'BAR' LIKE 'B_' --FALSE
	
---------------------------------------------------------------	
select 
	c.first_name,
from 
	customer c 
where
	first_name like '%er%' --first name에 er이 포함된 모든 사람을 출력한다.
	
---------------------------------------------------------------		
select 
	c2.first_name, 
from 
	customer c2 
where
	first_name not like 'Jen%' --first name이 'Jen'으로 시작되는 사람을 빼고 출력한다.	