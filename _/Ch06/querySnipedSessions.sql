select username, sid, status 
from v$session 
where status='SNIPED';