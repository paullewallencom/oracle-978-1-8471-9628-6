col osuser for a12

select spid, osuser, s.program 
from v$process p, v$session s 
where p.addr=s.paddr;

