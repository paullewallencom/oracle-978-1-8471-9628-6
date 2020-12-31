col GROUP# for 99999
col STATUS for A8
col MEMBER for A40

select   F.GROUP#, 
         SEQUENCE#, 
         L.STATUS, 
         MEMBER
from     V$LOGFILE F, V$LOG L
where    F.GROUP# = L.GROUP#
order by GROUP#
/

