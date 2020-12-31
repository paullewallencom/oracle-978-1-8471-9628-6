REM This scripts assumes a unix like environment exists and the paths are valid.

CREATE TABLESPACE RCAT
DATAFILE '/u01/oracle/oradata/orcl/rcat01.dbf' SIZE 32M AUTOEXTEND ON NEXT 32M
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO UNIFORM SIZE 64K;

CREATE USER RCAT 
IDENTIFIED BY ORACLE
DEFAULT TABLESPACE RCAT
QUOTA UNLIMITED ON RCAT;

GRANT CONNECT, RESOURCE TO RCAT;
GRANT RECOVERY_CATALOG_OWNER TO RCAT;