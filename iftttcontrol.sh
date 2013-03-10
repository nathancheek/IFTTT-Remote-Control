#/bin/sh
#This script checks for a Dropbox-synced file and then runs a preconfigured command accordingly

IFTTTLOCATION="/home/nathancheek/Dropbox/IFTTT"
LOGLOCATION="/home/nathancheek/IFTTT.log"
SLEEP="sleep"
REBOOT="reboot"
Date=$(date +"%D %T")

if [ -s $IFTTTLOCATION/$SLEEP.txt ]; then
rm $IFTTTLOCATION/$SLEEP.txt
echo "Going to sleep at $Date" >> $LOGLOCATION
pm-suspend
exit 1
fi

if [ -s $IFTTTLOCATION/$REBOOT.txt ]; then
rm $IFTTTLOCATION/$REBOOT.txt
echo "Rebooting at $Date" >> $LOGLOCATION
reboot
exit 1
fi
