#
# This script prepares five raw devices for a Test ASM environment.
# The assigned raw devices are /dev/raw/raw1 ... /dev/raw/raw5
#


echo Preparing ASM disks ...
WHOAMI='whoami'
if [ $WHOAMI != root ] ; then 
	echo $0 must be run as root 
	exit 1
fi
if [ ! -d /u01/asmdisks ] ; then 
	mkdir -p /u01/asmdisks
fi
cd /u01/asmdisks
VDISK=0
DD=/bin/dd
LOSETUP=/sbin/losetup
RAW=/usr/bin/raw
LOGFILE=/tmp/asmsetup.log
date > $LOGFILE
while [ $VDISK -lt 5 ] ; do
	VDISK='expr $VDISK + 1 ' 
	echo -e Creating Virtual Disk $VDISK ... \\c 
	if [ ! -f /u01/asmdisks/asm_disk$VDISK ] ; then 
	$DD if=/dev/zero of=asm_disk$VDISK bs=1024k count=400 2>&1>> $LOGFILE 
fi 
$LOSETUP /dev/loop$VDISK asm_disk$VDISK 2>&1>> $LOGFILE 
$RAW /dev/raw/raw$VDISK /dev/loop$VDISK 2>&1>> $LOGFILE 
sleep 3 
chown oracle:oinstall /dev/raw/raw$VDISK 2>&1>> $LOGFILE 
chmod 777 /dev/raw/raw$VDISK 
echo Done
done
echo -e \\n Please verify execution log $LOGFILE

