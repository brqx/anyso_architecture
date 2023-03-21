#!/bin/bash
#
# Script version 0.0.0.2
#
# Listado de imágenes
# alias di
db_tag()
{
VER="0.0.0.2"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Genera una compilacion de Docker con el tag indicado en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : dbt | db_tag [TAG]                              "
echo "Ejemplo : dbt "helloworld:3.0"                            "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

TAG=${1}

# Hooks para docker
__d

docker build -t ${TAG} .

fi
}
