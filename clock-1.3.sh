#!/bin/bash

##You can show anything in the upper right corner of the terminal.
##CMD is your command which you want to run.
##TIME is every how many seconds to execute CMD.

CMD='date +%y.%m.%d-%T'
TIME=1
while [ $1 ]
do
    if [ "$1" == '-c' ] || [ "$1" == '--command' ]
    then
        CMD=$2
        shift 2
    elif [ "$1" == '-t' ] || [ "$1" == '--time' ]
    then
        TIME=$2
        shift 2
    else
        shift
    fi
done

LEN=$($CMD)
COL=$[$(tput cols)-${#LEN}+1]
while EXECMD=$($CMD); do
    echo -ne "\033[s\033[1;${COL}H$EXECMD\033[u"
    sleep $TIME
done
