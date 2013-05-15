IFTTT-Remote-Control
====================

Run preset commands on a linux computer via text message

###Introduction###

This project works thanks to [IFTTT](https://ifttt.com) and [Dropbox](https://www.dropbox.com).  IFTTT receives a text and syncs it to the computer via Dropbox.  Then a script will check for the existence of the file and if it is there, run a command.

###Implementation###

####Dropbox####

1. You will need to create an account if you haven't already.
2. Dropbox can be downloaded from [https://www.dropbox.com/install](https://www.dropbox.com/install)
3. See the [Dropbox Wiki](http://www.dropboxwiki.com/Text_Based_Linux_Install#Running_on_system_startup) for configuring Dropbox to run at startup

####IFTTT####

1. Create an account if you haven't already
2. Go to [https://ifttt.com/recipes/85666](https://ifttt.com/recipes/85666) activate the Dropbox and SMS channels if they aren't already, customize as needed, then click "Use Recipe"

####Script####

1. Download the script ```iftttcontrol.sh``` from this repository
2. Edit the variables at the beginning of the file for the IFTTT folder location and where you want a log to be stored
3. Edit the command variables if you are using different IFTTT text tags
4. You may want to move the script to a safe location and change the owner to root so it can't be edited too easily

####Cron####

1. These commands require root, I used the crontab at /etc/crontab
2. This is the line that I entered in crontab to run the script every minute, where "```/etc/ifttt/iftttcontrol.sh```" is the location of the script, it may be different for you:  
```*/1 * * * * root sh /etc/ifttt/iftttcontrol.sh```

###Pushover Notifications###

If you would like to receive [Pushover](https://pushover.net) notifications, use the iftttcontrolnotify.sh file instead of the iftttcontrol.sh file.
Be sure to set the POTOKEN and POUSER variables.