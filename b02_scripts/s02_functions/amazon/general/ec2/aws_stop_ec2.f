#!/bin/bash
#
# Script version 0.0.3
#
# Listado de imágenes
# alias aw2sto
aws_stop_ec2()
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

OPTION=$1
TAG_NAME=$2
TAG_VALUE=$3

FILTRO=$*

#Vamos a tener una funcion intermedia que nos va a dar un filtro

# Opciones de funcionamiento
# a --> Para todas las instancias de todas las regiones
# z --> Para las instancias de la region indicada
# t --> Para las instancias del tag indicado de todas las regiones

if    [ "${OPTION}" != "z" ] ; then
#Hay un filtro de region (zone)
FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output text --region ${REGION} | tr "\t" ":" | grep running | cut -d ":" -f1 | tr "\n" " " )

else
#Actuamos sobre todas las regiones filtrando por el tag
REGIONES=$( aws ec2 describe-regions --output text | cut -f4 | tr "\n " " " )

fi
#if    [ "${OPTION}" == "a" ] ; then
#Actuamos sobre todas las regiones con y sin tag

#for REGION in "${REGIONES}" ; do

# Como puede dar disntintos valores para que la query funcione hay que dar opcion 0 (None)
#FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key=='${TAG_NAME}'].Value | [0]]" --output text --region us-east-2 | grep ${TAG_VALUE} | tr  "\t"  " " | cut -d " " -f1 |  tr "\n" " "  )

#elif   [ "${OPTION}" != "t" ] ; then
#Hay un filtro
#TAG_NAME=${FILTRO2}
#aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId]" --output text --region us-east-2 | grep ${TAG_VALUE} | tr  "\t"  " " | cut -d " " -f1 |  tr "\n" " " 


#FILTRO=$( aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output text --region ${REGION} | tr "\t" ":" | grep running | cut -d ":" -f1 | tr "\n" " " )
#fi

#for instance in "${FILTRO}" ; do
#aw2 stop-instances --instance-ids  ${instance}
#done

fi
}

