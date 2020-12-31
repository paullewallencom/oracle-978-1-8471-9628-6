SELECT table_name
FROM dictionary
WHERE table_name like 'DBA/_HIST/_%' ESCAPE '/'
ORDER BY table_name;