#!/bin/bash

ip="" # LOGIN SERVER IP
username=""
password=""
isp="0"

path="/drcom/login"
time=`date +"%s"`
url="http://${ip}${path}?callback=dr0&DDDDD=${username}&upass=${password}&0MKKey=123456&R1=0&R3=${isp}&R6=0&_=${time}000"

function main() {
  while true ; do
    echo "==> Check Internet..." | blue
    if checkInternet ; then
      echo "==> No Internet. Try logging in..." | red
      login
      echo "==> More sleep after login..." | yellow
      sleep 30
    fi
    echo "==> Sleep..." | green
    sleep 30
  done
}

function login() {
  logindev enp2s0
  logindev br0
}

function logindev() {
  echo "==> Login with ${1}..." | cyan
  curl --interface "$1" --connect-timeout 5 -v -s -X GET "$url"
  echo
}

function checkInternet() {
  [[ $(curl -s -D - http://connect.rom.miui.com/generate_204 2>/dev/null | head -1 | cut -d' ' -f 2) != "204" ]]
}

black()  { IFS= ; while read -r line; do echo -e '\e[30m'$line'\e[0m'; done; }
red()    { IFS= ; while read -r line; do echo -e '\e[31m'$line'\e[0m'; done; }
green()  { IFS= ; while read -r line; do echo -e '\e[32m'$line'\e[0m'; done; }
yellow() { IFS= ; while read -r line; do echo -e '\e[33m'$line'\e[0m'; done; }
blue()   { IFS= ; while read -r line; do echo -e '\e[34m'$line'\e[0m'; done; }
purple() { IFS= ; while read -r line; do echo -e '\e[35m'$line'\e[0m'; done; }
cyan()   { IFS= ; while read -r line; do echo -e '\e[36m'$line'\e[0m'; done; }
white()  { IFS= ; while read -r line; do echo -e '\e[37m'$line'\e[0m'; done; }

main
