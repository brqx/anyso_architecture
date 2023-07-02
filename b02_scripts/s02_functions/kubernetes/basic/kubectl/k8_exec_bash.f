#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias de

k8_exec_bash()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta Bash en el pod de kubernetes en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : kbash | dt_exec_bash NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod

NAME=${1}

# Hooks para kubernetes
__k

k exec -it ${NAME} -- bash

fi
}

#-------------------------------------------------------------------

k8_exec_sh()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta sh en el pod de kubernetes en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : ksh | dt_exec_sh NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod

NAME=${1}

# Hooks para kubernetes
__k

k exec -it ${NAME} -- sh

fi
}
