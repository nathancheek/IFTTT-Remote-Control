#/bin/sh
#This script checks for a Dropbox-synced file and then runs a preconfigured command accordingly

IFTTTLOCATION="/home/username/Dropbox/IFTTT"
LOGLOCATION="/home/username/IFTTT.log"
SLEEP="sleep"
REBOOT="reboot"
SHUTDOWN="shutdown"
Date=$(date +"%D %T")

if [ -s $IFTTTLOCATION/$SLEEP.txt ]; then
rm $IFTTTLOCATION/$SLEEP.txt
echo "Going to sleep at $Date" >> $LOGLOCATION
pm-suspend
exit 0
fi
if [ -s $IFTTTLOCATION/$REBOOT.txt ]; then
rm $IFTTTLOCATION/$REBOOT.txt
echo "Rebooting at $Date" >> $LOGLOCATION
reboot
exit 0
fi
if [ -s $IFTTTLOCATION/$SHUTDOWN.txt ]; then
rm $IFTTTLOCATION/$SHUTDOWN.txt
echo "Shutting down at $Date" >> $LOGLOCATION
shutdown now
exit 0
fi
exit 0