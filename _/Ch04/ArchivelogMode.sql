REM Connect SYS as SYSDBA
CONNECT / AS SYSDBA

REM Shutdown must be either normal, immediate or transactional
SHUTDOWN IMMEDIATE

REM The archivelog mode must be set while database is in Mount state
STARTUP MOUNT

REM Sets database in Archivelog mode
ALTER DATABASE ARCHIVELOG

REM Opens the database
ALTER DATABASE OPEN