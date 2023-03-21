#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta delete -f de muchos ficheros
# alias de

k8_delf_yaml()
{
VER="0.0.0.2"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Ejecuta una orden en muchos archivos yaml Kubernetes en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : kdf | k8_delf_yaml NAME NAME NAME ...           "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Ejecuta bash en nuestro pod
#kgp pod XXX -o yaml

# Hooks para kubernetes
__k


for archivo in $* ; do 
#echo ${archivo}
k delete -f ${archivo}

done


##k get ${OBJECT} ${NAME} -o yaml

fi
}
