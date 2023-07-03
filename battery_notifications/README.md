1. Prerequisites

```
sudo pacman -S dunst cronie 
```

2. Move both scripts to ~/.local/bin


3. Setting cron tab using cronie 

```shell
$ crontab -e 
```

4. Inside the crontab 

```
*/10 * * * * /home/username/.local/bin/battery_notify
```

5. Setting udev rules 

```
# https://wiki.archlinux.org/title/udev#Triggering_desktop_notifications_from_a_udev_rule

# Rule for when switching to battery
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME_TO_RUN_SCRIPT_AS -c /usr/local/bin/brightness_notification.sh"
# Rule for when switching to AC
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME_TO_RUN_SCRIPT_AS -c /usr/local/bin/brightness_notification.sh"
```




