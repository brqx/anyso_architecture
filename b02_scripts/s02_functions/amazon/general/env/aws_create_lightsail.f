#!/bin/bash
#
# Script version 0.0.3
#
# Create Instance
# alias awlc
aws_create_lightsail()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Generación de instancias lightsail pasadas por parametro   "
echo "=========================================================="
echo "Format  : awlc | aws_create_lightsail [creacion instancias]"
echo "----------------------------------------------------------"
echo "----------------------------------------------------------"
echo "Example"
echo "----------------------------------------------------------"
echo "awlc r01 r02 r03  --> generate instances with defaul values"
echo "awlc r04"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
# Para poder tener agilidad y crear N instancias vamos a considerar dos variables de entorno

FILTRO1=$1

if [ "${KEYPAIR}" == "" ] ; then
KEYPAIR=public_pelonakeypair
fi


AVAILBILITY=us-east-2a
BLUEPRINT=drupal
BUNDLE=nano_2_0

if

FILTRO=$*


for instance in "${FILTRO}" ; do
aws lightsail create-instances 
--instance-ids  ${instance}
--availability-zone <value>
--blueprint-id <value>
--bundle-id <value>
[--user-data <value>]
[--key-pair-name <value>]




done

fi
}

