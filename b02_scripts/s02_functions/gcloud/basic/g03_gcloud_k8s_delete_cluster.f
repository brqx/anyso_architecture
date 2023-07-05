#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias g8d

gcloud_k8s_delete_cluster()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Elimina un cluster de kubernetes de Google Cloud en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : g8d | gcloud_k8s_delete_cluster CLUSTER_NAME [REGION] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

CLUSTER_NAME=$1
REGION=$2

# Hay que intentar sacar el cluster con cluster list

## Pendiente
## if [ "${CLUSTER_NAME}" == "" ] ; then
## gcloud_get_cluster_name
## fi

if [ "${CLUSTER_NAME}" == "" ] ; then
# Nombre de cluster por defecto para Google Cloud - Arquitectura Brqx
CLUSTER_NAME=gcloud-brqx-cluster
fi

if [ "${REGION}" == "" ] ; then
REGION=europe-west3
fi


# Esto actualiza el kubeconfig con el contexto del cluster de GCC

COMMAND="time gcloud container clusters delete "

COMMAND="${COMMAND} ${CLUSTER_NAME} --region ${REGION} "

${COMMAND}

fi
}

#-------------------------------------------------------------------

