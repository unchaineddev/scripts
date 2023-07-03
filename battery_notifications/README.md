## Prerequisites

```
sudo pacman -S dunst cronie 
```

## Move both scripts to ~/.local/bin

 ![Battery_notify](https://github.com/xyzsuf/scripts/blob/main/battery_notifications/battery_notify.sh)

 ![Charging_notify](https://github.com/xyzsuf/scripts/blob/main/battery_notifications/charging_notify.sh)

 
 ## Setting cron tab using cronie

In a terminal type, 

```shell
$ crontab -e 
```

Inside the crontab scheduler, schedule it to preferred time. I have set it to 10 minutes


```
*/10 * * * * /home/username/.local/bin/battery_notify
```

## Finally, Set udev rules 

```
# https://wiki.archlinux.org/title/udev#Triggering_desktop_notifications_from_a_udev_rule

# Rule for when switching to battery
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME_TO_RUN_SCRIPT_AS -c /usr/local/bin/brightness_notification.sh"
# Rule for when switching to AC
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME_TO_RUN_SCRIPT_AS -c /usr/local/bin/brightness_notification.sh"
```




