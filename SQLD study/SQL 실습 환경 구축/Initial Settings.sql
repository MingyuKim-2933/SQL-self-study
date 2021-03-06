-- 재실행을 위한 초기화 작업
DROP USER SQLD CASCADE;
DROP TABLESPACE SQLD_DATA INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE SQLD_TEMP INCLUDING CONTENTS AND DATAFILES;

-- 사용자 계정 생성
CREATE USER SQLD IDENTIFIED BY 1234;
ALTER USER SQLD ACCOUNT UNLOCK;
GRANT RESOURCE, DBA, CONNECT TO SQLD;

-- 테이블 스페이스 생성
CREATE TABLESPACE SQLD_DATA
datafile 'D:\app\dbmsexpert\virtual\oradata\orcl19c\SQLD_DATA.dbf' SIZE 1G
AUTOEXTEND ON NEXT 512M MAXSIZE UNLIMITED
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

CREATE TEMPORARY TABLESPACE SQLD_TEMP
TEMPFILE 'D:\app\dbmsexpert\virtual\oradata\orcl19c\SQLD_TEMP.dbf' SIZE 512M
AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;

--SQLD사용자 계정에 방금 생성한 테이블 스페이스를 디폴트 스페이스로 설정
ALTER USER SQLD DEFAULT TABLESPACE SQLD_DATA;
ALTER USER SQLD TEMPORARY TABLESPACE SQLD_TEMP;