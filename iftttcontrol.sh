#!/bin/sh
#This script checks for a Dropbox-synced file and then runs a preconfigured command accordingly

#Dropbox folder and log lcoation of choosing
IFTTTLOCATION="/home/username/Dropbox/IFTTT"
LOGLOCATION="/home/username/IFTTT.log"
Date=$(date +"%Y-%m-%d %T")

#Add custom variables here to trigger custom commands
SLEEP="sleep"
REBOOT="reboot"
SHUTDOWN="shutdown"

#Sleep
if [ -e $IFTTTLOCATION/$SLEEP.txt ]; then
rm $IFTTTLOCATION/$SLEEP.txt
echo "$Date - Going to sleep" >> $LOGLOCATION
pm-suspend
exit 0
fi

#Reboot
if [ -e $IFTTTLOCATION/$REBOOT.txt ]; then
rm $IFTTTLOCATION/$REBOOT.txt
echo "$Date - Rebooting" >> $LOGLOCATION
init 6
exit 0
fi

#Shutdown
if [ -e $IFTTTLOCATION/$SHUTDOWN.txt ]; then
rm $IFTTTLOCATION/$SHUTDOWN.txt
echo "$Date - Shutting down" >> $LOGLOCATION
shutdown now
exit 0
fi

#Add custom commands here following example formatting
exit 0