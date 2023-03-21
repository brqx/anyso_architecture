#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version : v0.0.2 - Noviembre 2021
#
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Create Cloud Formation Stack
aws_create_cf()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Creacion de stack Cloud Formation ($VER)"
echo "=========================================================="
echo "Format  : awfc | aws_create_cf  [REGION]                        "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Run instance example
#awfc s

REGION=$1

__tmp_file

if [ "${REGION}" == "" ] ; then
__regions
REGION=${CURRENT_REGION}
fi

#-.--.--.--.--.--.- MANDATORY COMMANDS -.--.--.--.--.--.-

# Unique name for stack
if [ "${STACK_NAME}" == "" ] ; then
# Codigo unico random con siempre tres cifras
RANDOM_03=$( echo "$[ $RANDOM  % 1000 ]00" | cut -c1-3 )

STACK_NAME=prueba-stack-${CURRENT_REGION}-${RANDOM_03}
fi

# Alias name for template
if [ "${STACK_FILE}" == "" ] ; then
STACK_FILE=stack_file.yaml
fi

#aws cloudformation delete-stack --stack-name PruebaPilaNet-01 
# aws cloudformation create-stack --stack-name ${STACK_NAME} --template-body file://${STACK_FILE} --region ${REGION}  > ${TMP_FILE}

#aws cloudformation create-stack --stack-name ${STACK_NAME} --capabilities CAPABILITY_AUTO_EXPAND --debug --template-body file://${STACK_FILE} --region ${REGION}
aws cloudformation create-stack --stack-name ${STACK_NAME} --capabilities CAPABILITY_AUTO_EXPAND --template-body file://${STACK_FILE} --region ${REGION}

# STACK_NAME=cat ${TMP_FILE} |   | cut -d ":" -f6 | cut -d "/" -f2

# Empty VARIABLES - Manage Variables

STACK_NAME=
STACK_FILE=

fi
}

