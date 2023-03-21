#!/bin/bash
#---------------------------------------------------------------------------------
#
# Script version 0.0.2 -- 2021 - November
# Farmacia Zaragoza - Brqx Architectures
#
# AWS Hooks for functions
#
# __region    : Define CURRENT REGION variables 
# __regions   : Define REGIONS variables 
#
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Define regions variables
__regions()
{
if    [ "${REGIONS}" == "" ] ; then
REGIONS=$(aws ec2 describe-regions --output text | cut -f4 | tr "\n" " " )
fi

__region

}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Define current region variables
__region()
{

if    [ "${CURRENT_REGION}" == "" ] ; then
CURRENT_REGION=$(aws configure get region)
fi

if    [ "${REGION}" == "" ] ; then
REGION=${CURRENT_REGION}
fi

}

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Manage parms to set current VPC as first param
__set_current_vpc()
{
if [ "$1" == "" ] ; then  
#Caso especial - No se pasa parametro - Miramos variables de entorno

#Suponemos que igual esta definida la variable VPCID
if [ "${VPCID}" != "" ] ; then  
#$1=${VPCID}
# Set cambia todos los argumentos
set -- "${VPCID}"
fi

fi
VPCID=$1
}