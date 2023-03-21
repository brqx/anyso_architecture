#!/bin/bash
#
# Script version 0.0.3
#
# Listado de imágenes
# alias di
dp_filter()
{
VER="0.0.1"
##"${1}" == "-?" -o


if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Listado|Filtrado de procesos de docker en arquitectura Brqx [$VER]						"
echo "=========================================================="
echo "Format  : dps | dpa | dp_filter [filter]                         "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

FILTRO=${1}
FILTRO2=${2}
if [ "${FILTRO}" != "" ] ; then
#Hay un filtro

  if [ "${FILTRO}" == "all" ] ; then

    if [ "${FILTRO2}" != "" ] ; then
    # Hay un filtro2
      docker ps -a | tr -s " " | grep "${FILTRO2}"  
    else
    # No hay filtro2
      docker ps -a 
    fi
  else
    docker ps | tr -s " " | grep "${FILTRO}"  
  fi
else
#no hay filtro1
  docker ps 
fi

fi
}

