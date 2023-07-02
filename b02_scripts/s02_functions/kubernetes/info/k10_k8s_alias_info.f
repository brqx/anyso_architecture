#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

k8s_alias_info()
{
VER="0.0.0.1"
FEC="2023-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Kubernetes en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : k8z | k8_alias_info                             "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 30

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos en arquitectura Brqx ${VER} - ${FEC}"
echo "------------------------------------------"

TEXT="$(alias k)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Kubernetes"$(textreset)

#------------- A P P L Y   ------------------

TEXT="$(alias ka)"
echo "$(format_text_length ${TEXT})  - ${yellow}Apply del fichero con Kubernetes"$(textreset)

TEXT="$(alias kae)"
echo "$(format_text_length ${TEXT})  - ${yellow}Apply con envsubst del fichero con Kubernetes"$(textreset)

#------------- D E L E T E  ------------------

TEXT="$(alias kd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Borrado de infraestructura del fichero con Kubernetes"$(textreset)

#------------- G E T   ------------------


# Kubenetes - Get nodes

TEXT="$(alias kgn)"
echo "$(format_text_length ${TEXT})  - ${yellow}Muestra los nodos del cluster de kubernetes"$(textreset)

# Kubenetes - Get all

TEXT="$(alias kga)"
echo "$(format_text_length ${TEXT})  - ${yellow}Muestra todos los objetos del cluster de Kubernetes"$(textreset)

# Kubenetes - Get events

TEXT="$(alias kd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de los eventos ocurridos en el Cluster de Kubernetes"$(textreset)

# Kubenetes - Get Pods

TEXT="$(alias kgp)"
echo "$(format_text_length ${TEXT})  - ${yellow}Reporta los pods que se ejecutan en el Cluster de Kubernetes"$(textreset)

# Kubenetes - Get Services

TEXT="$(alias kgs)"
echo "$(format_text_length ${TEXT})  - ${yellow}Muestra los servicos que corren en el cluste en el namespace por defecto con Kubernetes"$(textreset)

# Kubenetes - Get Deployments

TEXT="$(alias kgd)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de los deployment del Cluster en Kubernetes"$(textreset)

# Kubenetes - Get Replicaset

TEXT="$(alias kgr)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de los Replicaset del Cluster en Kubernetes"$(textreset)


# Kubenetes - Get Ingress

TEXT="$(alias kgi)"
echo "$(format_text_length ${TEXT})  - ${yellow}Informa de los Ingress del Cluster en Kubernetes"$(textreset)



echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

