#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: wallpaper.sh /path/to/video.mp4"
  exit 1
fi

VIDEO="$1"

pkill mpvpaper 2>/dev/null
pkill swww-daemon 2>/dev/null

LAPTOP="eDP-1"
EXTERNAL="HDMI-A-2" # adjust to your output names

mpvpaper "$LAPTOP" "$VIDEO" -o "--loop-playlist=inf --no-audio --no-osc --no-osd-bar" &
mpvpaper "$EXTERNAL" "$VIDEO" -o "--loop-playlist=inf --no-audio --no-osc --no-osd-bar" &
