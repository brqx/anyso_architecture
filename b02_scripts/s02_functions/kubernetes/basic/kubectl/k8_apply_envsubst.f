#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta apply con envsubst
# alias kae

k8_apply_envsubst()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Aplica manifiesto de Kubernetes substituyendo variables en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : kae | k8_apply_envsubst FILE_YAML               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else


# Hooks para kubernetes
__k

archivo=$1

envsubst < $archivo | k apply -f -


fi
}
