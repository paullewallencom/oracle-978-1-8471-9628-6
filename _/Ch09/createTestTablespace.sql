CREATE TABLESPACE PWDONLY_TEST
DATAFILE '/u01/oracle/oradata/orcl/pwdonly_test01.dbf' size 32M
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

CREATE TABLE SCOTT.EMP_TEST
TABLESPACE PWDONLY_TEST
AS
SELECT * FROM SCOTT.EMP;