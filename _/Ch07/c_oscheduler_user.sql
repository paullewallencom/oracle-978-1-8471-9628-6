create user OSCHEDULER
identified by ORACLE
default tablespace USERS
temporary tablespace TEMP
quota unlimited on USERS;

grant	create_session,
	create_table,
	create_sequence
to OSCHEDULER;


create table oscheduler.job_log(
	id	number(10),
	exec_time	date,
	what	varchar2(50))
tablespace users;

create sequence oscheduler.seq;
grant create procedure to oscheduler;

create or replace procedure oscheduler.ins_job_log_entry(
	log_info IN varchar2)
as
begin
   insert into job_log values(
           seq.nextval,
           sysdate,
           log_info
   );
   commit;
end;
/

