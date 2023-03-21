#!/bin/bash
#
# Script version 0.0.0.2
#
# Listado de imágenes
# alias di
di_filter()
{
VER="0.0.0.3"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado|Filtrado de imágenes de docker en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : di | di_filter [filter] [VER]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=${1}
DVER=${2}

# Hooks para docker
__d

if [ "${DVER}" == "" ] ; then
#Aqui en un futuro podemos ajustar latest
DVER=""
fi

if [ "${FILTRO}" != "" ] ; then
#Hay un filtro

docker images | tr -s " " | grep "${FILTRO}"  | grep "${DVER}"

else

docker images | tr -s " " | grep "${DVER}"

fi

fi
}
