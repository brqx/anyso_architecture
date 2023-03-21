#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias de

tf_exec_bash()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta Bash en el pod de terraform en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : kbash | dt_exec_bash NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod

NAME=${1}

# Hooks para kubernetes
#__k

# Pendiente
tf exec -it ${NAME} -- bash

fi
}

#-------------------------------------------------------------------

