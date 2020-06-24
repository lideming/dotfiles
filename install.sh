#!/bin/sh

mkdir -p ~/.config/sway
cp config/sway/{config,script.py} ~/.config/sway

mkdir -p ~/.config/waybar
cp config/waybar/{config,style.css} ~/.config/waybar/

mkdir -p ~/.config/swaylock
cp config/swaylock/config ~/.config/swaylock/

mkdir -p ~/.config/fish/conf.d
cp bashrc.fish  ~/.config/fish/conf.d/

mkdir -p ~/bin
cp bin/startsway ~/bin/
