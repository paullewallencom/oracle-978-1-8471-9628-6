-- sql*loader demo tablespace

create tablespace sqlldrdemo
datafile 'C:\ORACLE\PRODUCT\10.1.0\ORADATA\ALPHA\SQLLDRDEMO01.DBF' size 32m autoextend on next 16m;

create user sqlldrdemo identified by oracle
default tablespace sqlldrdemo
quota unlimited on sqlldrdemo;

grant connect, resource to sqlldrdemo;

create table sqlldrdemo.emp
tablespace sqlldrdemo
as
select * from scott.emp
where 1=2;

create table sqlldrdemo.dept
tablespace sqlldrdemo
as
select * from scott.dept
where 1=2

