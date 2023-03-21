#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias de

de_exec_bash()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta Bash en el contenedor Docker en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : dbash | dt_exec_bash NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro contenedor

NAME=${1}

# Hooks para docker
__d

docker exec -it ${NAME} bash


fi
}
#----------------------------------------------------------
# For alpine images
de_exec_ash()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta Bash en el contenedor Docker en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : dbash | dt_exec_bash NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro contenedor

NAME=${1}

# Hooks para docker
__d

docker exec -it ${NAME} ash


fi

}
