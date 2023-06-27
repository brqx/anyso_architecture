#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias gic

dok_save_kubeconfig()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Actualiza el contexto para un cluster de Digital Ocean en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : doksave | dok_save_kubeconfig CLUSTER_NAME               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

CLUSTER_NAME=$1

# Hay que intentar sacar el cluster don cluster list

if [ "${CLUSTER_NAME}" == "" ] ; then
dok_get_cluster_name
fi

if [ "${CLUSTER_NAME}" == "" ] ; then
# Nombre de cluster por defecto para Digital Ocean - Arquitectura Brqx
CLUSTER_NAME=do-brqx-cluster
fi

# Esto actualiza el kubeconfig con el contexto del cluster de DO
doctl kubernetes cluster kubeconfig save ${CLUSTER_NAME}

fi
}

#-------------------------------------------------------------------

