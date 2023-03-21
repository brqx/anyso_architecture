#!/bin/bash
#
# Script version 0.0.2
#
# Obtencion ip instancias lightsail
# alias awlp
aws_getip_lightsail()
{
VER="0.0.2"

if [ "${1}" == "-?" -a  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Obetención de las IP de instancia/s lightsail pasada por parametro [$VER]"
echo "=========================================================="
echo "Format  : awli | aws_getip_lightsail [listado instancias] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=$*


# Primer metodo
# aws lightsail get-instance-access-details --instance-name ${instance} --output text | grep BEGIN | tr "\t" " " | cut -d " " -f5
# Otro metodo para obtener la ip
# aws lightsail get-instance --instance-name 'LightsailDemo' --query 'instance.privateIpAddress' 

#echo "Filtro pasado : ${FILTRO}"
for instance in ${FILTRO} ; do

PRIV_IP_INSTANCE=$(aws lightsail get-instance --instance-name ${instance} --query 'instance.privateIpAddress' --output text )
PUB_IP_INSTANCE=$( aws lightsail get-instance --instance-name ${instance} --query 'instance.publicIpAddress'  --output text )

#Common target for many commands
TARGET="${PUB_IP_INSTANCE}"
echo "instance ${instance} - priv ${PRIV_IP_INSTANCE} - pub ${PUB_IP_INSTANCE}"
done
fi
}

