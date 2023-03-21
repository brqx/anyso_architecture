#!/bin/bash
#
# Script version 0.0.3
#
# Listado de imágenes
# alias aw2sto
aws_start_ec2()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Parada de instancias ec2 pasadas por parametro. Sin parametro para todas las de la zona [$VER]						"
echo "=========================================================="
echo "Format  : aw2sto | aws_stop_ec2 [listado instancias]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO1=$1

FILTRO=$*

if    [ "${FILTRO1}" != "z" ] ; then
#Hay un filtro
FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output text --region ${REGION} | tr "\t" ":" | grep running | cut -d ":" -f1 | tr "\n" " " )
fi

for instance in "${FILTRO}" ; do
aw2 stop-instances --instance-ids  ${instance}
done

fi
}

