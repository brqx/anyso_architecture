#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

do_alias_info()
{
VER="0.0.0.1"
FEC="2023-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Digital Ocean en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : doi | do_info INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 30

alias do="doctl "

# Kubernetes ( d - doker | do - digital_ocean )

alias dok="do kubernetes"

# Listado de clusters de kubernetes

alias dokl="do kubernetes cluster list"

# Debe ser una funcion - para salvar guardar el contexto del cluster
# doctl kubernetes cluster kubeconfig save do-brqx-cluster

alias doksave="dok_save_kubeconfig"


echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos en arquitectura Brqx ${VER} - ${FEC}"
echo "------------------------------------------"

TEXT="$(alias do)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Digital Ocean doctl"$(textreset)

#------------- K U B E R N E T E S  ------------------

TEXT="$(alias dok)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de DO para manejar Kubernetes"$(textreset)


TEXT="$(alias dokl)"
echo "$(format_text_length ${TEXT})  - ${yellow}Listamos los clusters de Kubernetes en DO"$(textreset)

TEXT="$(alias doksave)"
echo "$(format_text_length ${TEXT})  - ${yellow}Recuperamos/Actualizamos el contexto del cluster de DO de K8s"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

