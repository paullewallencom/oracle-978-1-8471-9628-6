store set sqlsettings.sql replace
set pagesize 0
set feedback off
set trimspool on
set termout off
set verify off
spool killSniped.bat
select 'orakill &1 '|| spid
from v$process p, v$session s, v$instance i
where p.addr=s.paddr
and s.status='SNIPED';
spool off
host killSniped
@sqlsettings
host del killSniped.bat
host del sqlsettings.sql