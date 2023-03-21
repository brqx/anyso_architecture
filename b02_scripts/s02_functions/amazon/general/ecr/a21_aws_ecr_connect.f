#!/bin/bash
#
# Script version 0.0.2
#
# Obtencion del TOKEN para conexion a ECR
# alias awlefs

# awe -> aws ecr
# awc -> aws ecs
#awec
aws_ecr_connect()
{
VER="0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Conexion con Token a Repositorio ECR [$VER]	    			             		"
echo "=========================================================="
echo "Format  : awec | aws_ecr_connect [ACCOUNT_ID] [REGION]                     "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Tiene dos modos de funcionamiento
# 1. Pasando los parametros AccountID y/o Region
#
# 2. Usando las variables aws_account_id y aws_region

ACCOUNT_ID_passed=$1
REGION_passed=$2

__check_aws_region_account


if [ "${aws_account_id_inner}" != "" -a  "${aws_region_inner}" != "" ] ; then

#----====----====----====----====----====----====----====----====
#           I N I C I O    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

echo "------------------------------------------------------"
echo "  Generando Token para conectarse al repositorio ECR  "
echo "--==--==--==--==--==--==--==--==--==--==--==--==--==--"

aws ecr get-login-password --region ${aws_region_inner} | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${aws_region_inner}.amazonaws.com
CONNECT_OUT=$?

if [ "${CONNECT_OUT}" != "0" ] ; then
echo "ECR errror : ${CONNECT_OUT} "

# Si es un mac vamos a arreglarlo

uname -a | grep "Darwin" &> /dev/null
IS_MAC=$?

if [ "${IS_MAC}" == "0" ] ; then
security -v unlock-keychain ~/Library/Keychains/login.keychain-db

echo "Please try again once unlocked"
fi

fi

echo "------------------------------------------------------"

#----====----====----====----====----====----====----====----====
#              F I N    D E   L A    L O G I C A 
#----====----====----====----====----====----====----====----====

fi

fi
}
