#!/bin/bash
# Brqx Unix Architectures - Farmacia Zaragoza - 2022
# Script version 0.0.0.1
#
# Crea una red para docker
# alias dnc

dn_network_create()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Creat una red para docker en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : dnc | dn_network_create NAME [DRIVER]             "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro contenedor

NAME=${1}
DRIVER=${2}

if [ "${DRIVER}" == "" ] ; then
DRIVER=bridge
fi

# Hooks para docker
__d

docker network create ${NAME} --driver ${DRIVER}


fi
}
