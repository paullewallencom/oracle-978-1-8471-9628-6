select file# "FileNo",
       status "Status",
       checkpoint_time "ChkptTime",
       checkpoint_change# "ChkptChg",
       checkpoint_count "ChkptCnt",
       fuzzy "Fuzzy"
from v$datafile_header;