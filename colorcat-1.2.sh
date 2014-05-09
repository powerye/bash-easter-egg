#! /bin/bash

##Let the cat command with color

trap 'echo -ne "\033[0m";exit' INT  QUIT TERM EXIT
IFS=

cat $1 | while read -r -s -n1 char; do
    [ "$char" ] || echo
    echo -ne "\033[$[$RANDOM%7+31]m$char"
done

exit
