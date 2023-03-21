#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version : v0.0.0.2 - Noviembre 2021
#
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Create Cloud Formation Stack
aws_delete_cf()
{
VER="0.0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Eliminacion de stack Cloud Formation ($VER)"
echo "=========================================================="
echo "Format  : awfd | aws_delete_cf  [STACK] [REGION]                        "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Run instance example
#awfc 

STACK_NAME=$1
REGION=$2

if [ "${REGION}" == "" ] ; then
__region
fi

#aws cloudformation delete-stack --stack-name PruebaPilaNet-01 
aws cloudformation delete-stack --stack-name ${STACK_NAME} --region ${REGION}

# Vaciado de variables

STACK_NAME=
REGION=

fi
}

