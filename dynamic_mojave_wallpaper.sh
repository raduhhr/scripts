#!/bin/bash

# Set DISPLAY, XAUTHORITY, and DBUS_SESSION_BUS_ADDRESS for cron job
export DISPLAY=:0
export XAUTHORITY=/home/radu/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Log environment variables for debugging
echo "DISPLAY=$DISPLAY" >> /home/radu/cron_output.log
echo "XAUTHORITY=$XAUTHORITY" >> /home/radu/cron_output.log
echo "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" >> /home/radu/cron_output.log

# Check if XAUTHORITY is set properly
if [ -f "$XAUTHORITY" ]; then
    echo "XAUTHORITY file exists." >> /home/radu/cron_output.log
else
    echo "XAUTHORITY file does not exist." >> /home/radu/cron_output.log
fi

# Wallpaper script logic
WALLPAPER_DIR="/home/radu/Pictures/Wallpapers/mojave-background"
CURRENT_HOUR=$(date +%H)
CURRENT_MINUTE=$(date +%M)
CURRENT_TIME=$((CURRENT_HOUR * 3600 + CURRENT_MINUTE * 60))

set_wallpaper() {
    local file=$1
    gsettings set org.cinnamon.desktop.background picture-uri "file:///$WALLPAPER_DIR/$file"
}

if (( CURRENT_TIME >= 0 && CURRENT_TIME < 10795 )); then
    set_wallpaper "mojave_dynamic_15.jpeg"
elif (( CURRENT_TIME >= 10795 && CURRENT_TIME < 21595 )); then
    set_wallpaper "mojave_dynamic_16.jpeg"
elif (( CURRENT_TIME >= 21595 && CURRENT_TIME < 25190 )); then
    set_wallpaper "mojave_dynamic_1.jpeg"
elif (( CURRENT_TIME >= 25190 && CURRENT_TIME < 28785 )); then
    set_wallpaper "mojave_dynamic_2.jpeg"
elif (( CURRENT_TIME >= 28785 && CURRENT_TIME < 32380 )); then
    set_wallpaper "mojave_dynamic_3.jpeg"
elif (( CURRENT_TIME >= 32380 && CURRENT_TIME < 35975 )); then
    set_wallpaper "mojave_dynamic_4.jpeg"
elif (( CURRENT_TIME >= 35975 && CURRENT_TIME < 39570 )); then
    set_wallpaper "mojave_dynamic_5.jpeg"
elif (( CURRENT_TIME >= 39570 && CURRENT_TIME < 43165 )); then
    set_wallpaper "mojave_dynamic_6.jpeg"
elif (( CURRENT_TIME >= 43165 && CURRENT_TIME < 50360 )); then
    set_wallpaper "mojave_dynamic_7.jpeg"
elif (( CURRENT_TIME >= 50360 && CURRENT_TIME < 53955 )); then
    set_wallpaper "mojave_dynamic_8.jpeg"
elif (( CURRENT_TIME >= 53955 && CURRENT_TIME < 57550 )); then
    set_wallpaper "mojave_dynamic_9.jpeg"
elif (( CURRENT_TIME >= 57550 && CURRENT_TIME < 61145 )); then
    set_wallpaper "mojave_dynamic_10.jpeg"
elif (( CURRENT_TIME >= 61145 && CURRENT_TIME < 64740 )); then
    set_wallpaper "mojave_dynamic_11.jpeg"
elif (( CURRENT_TIME >= 64740 && CURRENT_TIME < 68335 )); then
    set_wallpaper "mojave_dynamic_12.jpeg"
elif (( CURRENT_TIME >= 68335 && CURRENT_TIME < 75530 )); then
    set_wallpaper "mojave_dynamic_13.jpeg"
elif (( CURRENT_TIME >= 75530 && CURRENT_TIME < 86325 )); then
    set_wallpaper "mojave_dynamic_14.jpeg"
else
    set_wallpaper "mojave_dynamic_15.jpeg"
fi

