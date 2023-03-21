#!/bin/bash
#
# Script version 0.0.2
#
# Arranque instancias lightsail
# alias awls
aws_start_lightsail()
{
VER="0.0.2"

if [ "${1}" == "-?" -a  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Arranque de instancias lightsail pasadas por parametro [$VER]						"
echo "=========================================================="
echo "Format  : awls | aws_start_lightsail [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=$*

STATUS=0
echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do
echo "instance :  ${instance}"
aws lightsail start-instance --instance-name  ${instance}  &> /dev/null
STATUS=$(expr ${STATUS} + $? )
done

echo "Started Instances - ${STATUS}"
fi
}

