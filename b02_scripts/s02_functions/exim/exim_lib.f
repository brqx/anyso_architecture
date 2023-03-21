#!/bin/bash

exim_stop()
{
#-Hacemos una pausa de 1 segundo
sleep 1
service exim stop
#mv /usr/sbin/exim /usr/sbin/exim_blocked
rm -f /usr/sbin/exim
}
exim_start()
{
cp /usr/sbin/exim_blocked  /usr/sbin/exim
service exim start
}

exim_check()
{
EXIM=$(ps -eaf | grep exim | wc -l)

if [ "${EXIM}" == "1" ] ; then
exim_stop
elif [ "${EXIM}" != "0" ] ; then
exim_stop
fi

}
