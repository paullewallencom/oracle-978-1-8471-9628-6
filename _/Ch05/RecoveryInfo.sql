select GROUP#,
       STATUS,
       FIRST_CHANGE#
from   V$LOG;

select FILE#,
CHECKPOINT_CHANGE#
from V$DATAFILE_HEADER;

select CONTROLFILE_CHANGE#
from   V$DATABASE;

