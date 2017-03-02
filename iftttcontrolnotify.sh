#/bin/sh
#This script checks for a Dropbox-synced file and then runs a preconfigured command accordingly
#It also sends a notification to your devices via Pushover (pushover.net)

#Dropbox folder and log lcoation of choosing
IFTTTLOCATION="/home/username/Dropbox/IFTTT"
LOGLOCATION="/home/username/IFTTT.log"
Date=$(date +"%Y-%m-%d %T")

#Add custom variables here to trigger custom commands
SLEEP="sleep"
REBOOT="reboot"
SHUTDOWN="shutdown"

#Pushover configuration
POTOKEN="000000000000"
POUSER="000000000000"
POSOUND="intermission"

#Sleep
if [ -e $IFTTTLOCATION/$SLEEP.txt ]; then
rm $IFTTTLOCATION/$SLEEP.txt
curl -s \
-F "token=$POTOKEN" \
-F "user=$POUSER" \
-F "message=Sleeping at $Date" \
-F "sound=$POSOUND" \
https://api.pushover.net/1/messages.json
echo "$Date - Going to sleep" >> $LOGLOCATION
pm-suspend
exit 0
fi

#Reboot
if [ -e $IFTTTLOCATION/$REBOOT.txt ]; then
rm $IFTTTLOCATION/$REBOOT.txt
curl -s \
-F "token=$POTOKEN" \
-F "user=$POUSER" \
-F "message=Rebooting at $Date" \
-F "sound=$POSOUND" \
https://api.pushover.net/1/messages.json
echo "$Date - Rebooting" >> $LOGLOCATION
init 6
exit 0
fi

#Shutdown
if [ -e $IFTTTLOCATION/$SHUTDOWN.txt ]; then
rm $IFTTTLOCATION/$SHUTDOWN.txt
curl -s \
-F "token=$POTOKEN" \
-F "user=$POUSER" \
-F "message=Shutting down at $Date" \
-F "sound=$POSOUND" \
https://api.pushover.net/1/messages.json
echo "$Date - Shutting down" >> $LOGLOCATION
shutdown now
exit 0
fi


#Add custom commands here following example formatting
exit 0