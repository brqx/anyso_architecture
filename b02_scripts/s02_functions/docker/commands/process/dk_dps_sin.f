#!/bin/bash
#
# Script version 0.0.3
#
# Listado de imágenes
# alias di
dp_filterno()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "" -o "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado|Filtrado inverso de procesos de docker en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : dpnk | dp_filterno [filter]                         "
echo "----------------------------------------------------------"
echo "Example: "
echo "----------------------------------------------------------"
echo "dpnk | dp_filterno k8s   --> Procesos no de kubernetes    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=${1}

# Hook de docker
__d

# Aqui no sacamos todos
docker ps | grep -v "${FILTRO}"  

fi
}

