#!/bin/bash
#
# Script version 0.0.2 - 13-08-2020
#
# Borrado de instancias normal. La borra aunque esté corriendo
# alias awll
aws_delete_lightsail()
{
VER="0.0.2"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borrado de instancias lightsail (Solo las borra si estan paradas) [$VER]					"
echo "=========================================================="
echo "Format  : awld | aws_delete_lightsail [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
FILTRO=$*

STATUS=0
echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do
echo "instance :  ${instance}"
#  hay que ver si está parada
# STATE 16 running
STATE=$(aws lightsail get-instance-state --instance-name ${instance} --output text | tr '\t' ' '  | cut -d ' ' -f3)

if [ "${STATE}" != "running" ] ; then
aws lightsail delete-instance --instance-name  ${instance}  &> /dev/null
STATUS=$(expr ${STATUS} + $? )
else
echo "instance started : ${instance} . Please stop to delete"
fi

done

echo "Deleted Instances - ${STATUS}"

fi
}

