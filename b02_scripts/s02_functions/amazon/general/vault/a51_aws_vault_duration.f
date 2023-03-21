#!/bin/bash
#
# Script version 0.0.0.2
#
# Listado de Elastic IP de AWS
# alias awvd

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

aws_vault_duration()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Conexion a aws con Token y una duraccion determinada [$VER]			"
echo "=========================================================="
echo "Format  : awvd | aws_vault_duration DURATION PROFILE"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

PROFILE=$1

DURATION=$1

unset AWS_VAULT

if [ "${DURATION}" == "" ] ; then 
DURATION="2h"
fi

if [ "${PROFILE}" == "" ] ; then 
PROFILE="tf"
fi


aws-vault exec --duration=${DURATION} ${PROFILE}

fi

}

