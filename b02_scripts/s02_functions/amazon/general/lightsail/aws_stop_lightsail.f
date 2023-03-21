#!/bin/bash
#
# Script version 0.0.2
#
# Parada instancias lightsail
# alias awlp
aws_stop_lightsail()
{
VER="0.0.2"

if [ "${1}" == "-?" -a  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "PArada de instancias lightsail pasadas por parametro [$VER]"
echo "=========================================================="
echo "Format  : awlp | aws_start_lightsail [listado instancias] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=$*

STATUS=0
#echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do
echo "instance :  ${instance}"
aws lightsail stop-instance --instance-name  ${instance}  &> /dev/null
STATUS=$(expr ${STATUS} + $? )
done

echo "Stopped Instances ${FILTRO} - ${STATUS}"
fi
}

