create trigger SQLLDR_RESUMABLE_HANDLER after suspend
on database
begin
  execute immediate 'alter database datafile 6 resize 384m';
end;
/
