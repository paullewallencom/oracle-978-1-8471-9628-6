col FILE_NAME for a45
col TIMESTAMP for a9
col FILE#     for 9999


select D.FILE#, 
       D.NAME  FILE_NAME, 
       H.CHECKPOINT_CHANGE#, 
       to_char( H.CHECKPOINT_TIME, 'HH24:MI:SS') TIMESTAMP
from   V$DATAFILE D, V$DATAFILE_HEADER H
where  D.FILE# = H.FILE# ;
