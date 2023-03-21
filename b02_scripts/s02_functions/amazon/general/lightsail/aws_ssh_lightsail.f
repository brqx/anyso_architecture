#!/bin/bash
#
# Script version 0.0.1
#
# Obtencion ip instancias lightsail
# alias awlp
aws_ssh()
{
VER="0.0.1"

if [ "${1}" == "-?" -a  "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Conexion ssh a la instancia pasada por parametro [$VER]"
echo "=========================================================="
echo "Format  : awssh | aws_getip_lightsail instancia [usuario] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

instance=$1
INSTANCE_USER=$2

if [ "${KEY}" == "" ] ; then
KEY="pelonakeypair.pem"
fi

#Users could be bitnami - ubuntu - ec2-user
if [ "${INSTANCE_USER}" == "" ] ; then
INSTANCE_USER=bitnami
fi

CMD="ssh -i ${KEY} ${INSTANCE_USER}@${PUB_IP_INSTANCE}"

#echo "Filtro pasado : ${FILTRO}"

PRIV_IP_INSTANCE=$(aws lightsail get-instance --instance-name ${instance} --query 'instance.privateIpAddress' --output text )
PUB_IP_INSTANCE=$( aws lightsail get-instance --instance-name ${instance} --query 'instance.publicIpAddress'  --output text )

${CMD}
fi
}

