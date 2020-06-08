#!/bin/sh

mkdir -p config/sway
cp /etc/sway/config config/sway/
cp /etc/i3status.conf config/

mkdir -p config/waybar
cp /etc/xdg/waybar/{config,style.css} config/waybar/
