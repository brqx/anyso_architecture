#!/bin/bash
#
# Script version 0.0.0.2   -   03/02/2022
#
# Ejecuta pod directamente en el cluster de kubernetes
# alias krpodgen |krgen

k8_runpod_sh()
{
VER="0.0.0.2"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta un pod directamente con una imagen en Kubernetes en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : krgen | k8_runpod_sh podname [imagen] [shell] ...           "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod
#kgp pod XXX -o yaml

# Hooks para kubernetes
__k

podname=$1
imagen=$2
shell=$3

if [ "${imagen}" == "" ] ; then 
imagen="nginx:alpine"
fi

if [ "${shell}" == "" ] ; then 
shell="sh"
fi

# Deprecated version
# k run --rm -it --generator=run-pod/v1 ${podname} --image=${imagen} -- ${shell} 

# Example : kubectl run --image=nginx:alpine myfirstpod -- labels=example=myfirstpod

# Current version
k run --rm -it  --image=${imagen} ${podname} -- ${shell} 


fi
}
