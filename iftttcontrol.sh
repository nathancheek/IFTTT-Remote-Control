#!/bin/sh
#This script checks for a Dropbox-synced file and then runs a preconfigured command accordingly

IFTTTLOCATION="/home/username/Dropbox/IFTTT"
LOGLOCATION="/home/username/IFTTT.log"
SLEEP="sleep"
REBOOT="reboot"
SHUTDOWN="shutdown"
Date=$(date +"%Y-%m-%d %T")

if [ -e $IFTTTLOCATION/$SLEEP.txt ]; then
rm $IFTTTLOCATION/$SLEEP.txt
echo "$Date - Going to sleep" >> $LOGLOCATION
pm-suspend
exit 0
fi
if [ -e $IFTTTLOCATION/$REBOOT.txt ]; then
rm $IFTTTLOCATION/$REBOOT.txt
echo "$Date - Rebooting" >> $LOGLOCATION
reboot
exit 0
fi
if [ -e $IFTTTLOCATION/$SHUTDOWN.txt ]; then
rm $IFTTTLOCATION/$SHUTDOWN.txt
echo "$Date - Shutting down" >> $LOGLOCATION
shutdown now
exit 0
fi
exit 0