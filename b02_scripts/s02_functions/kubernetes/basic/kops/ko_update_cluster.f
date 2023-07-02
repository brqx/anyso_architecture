#!/bin/bash
#
# Script version 0.0.0.1
#
# Actualiza un cluster kubernetes con kops
# alias kou

ko_update_cluster()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

# Si esta definida la variable, la usa

if [ "${NAME}" == "" ] ; then
NAME=${1}
fi

if [ "${1}" == "-?" -o "${NAME}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Actualiza los cambios en un cluster con Kops - kubernetes en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : kou | ko_update_cluster NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

kops update cluster --name ${NAME} --yes --admin

fi
}
