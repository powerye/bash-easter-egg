#! /bin/bash

##Let the entire terminal flashes

TERM=xterm-256color
tput civis

#while ((++i))
for i in {1..256}
do
    tput setab $i
    clear
#   echo -n '  '
    sleep .5
done

tput cnorm
