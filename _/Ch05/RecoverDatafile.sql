col FILE#     for 9999
col FILE_NAME for a45
col ERROR     for a25

select D.FILE#,
       D.NAME   FILE_NAME,
       R.ERROR
from   V$RECOVER_FILE R, V$DATAFILE D
where  R.FILE# = D.FILE#;

