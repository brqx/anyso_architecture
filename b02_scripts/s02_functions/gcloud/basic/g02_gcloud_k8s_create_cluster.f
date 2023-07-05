#!/bin/bash
#
# Script version 0.0.0.1
#
# Ejecuta bash en el contenedor
# alias g8c

gcloud_k8s_create_cluster()
{
VER="0.0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea un cluster de kubernetes de Google Cloud en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : g8c | gcloud_k8s_create_cluster CLUSTER_NAME [REGION] [NUM_NODES] "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

CLUSTER_NAME=$1
REGION=$2
NUM_NODES=$3

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

if [ "${NUM_NODES}" == "" ] ; then
NUM_NODES=1
fi

# Esto actualiza el kubeconfig con el contexto del cluster de GCC

COMMAND="time gcloud container clusters create "

COMMAND="${COMMAND} ${CLUSTER_NAME} --num-nodes ${NUM_NODES} --region ${REGION} --scopes"

${COMMAND} "https://www.googleapis.com/auth/ndev.clouddns.readwrite"

fi
}

#-------------------------------------------------------------------

