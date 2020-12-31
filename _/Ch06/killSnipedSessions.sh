TEMPFILE=/tmp/$$.tmp
sqlplus system/system_password <<EOF
spool $TEMPFILE
select p.spid from v\$process p,v\$session s
where s.paddr=p.addr
and s.status='SNIPED';
spool off
EOF
for i in `cat $TEMPFILE | grep "^0123456789"`
do
kill -9 $i
done
rm $TEMPFILE