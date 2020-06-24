#!/bin/sh

mkdir -p config/sway
cp ~/.config/sway/{config,script.py} config/sway/

mkdir -p config/waybar
cp ~/.config/waybar/{config,style.css} config/waybar/

mkdir -p config/swaylock
cp ~/.config/swaylock/config config/swaylock/

cp ~/.config/fish/conf.d/bashrc.fish ./

mkdir -p bin
cp /usr/bin/startsway bin/
