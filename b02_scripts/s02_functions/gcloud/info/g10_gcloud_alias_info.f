#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

gcloud_alias_info()
{
VER="0.0.0.1"
FEC="2023-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Google Cloud en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : gci | gcloud_info INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 40


echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos en arquitectura Brqx ${VER} - ${FEC}"
echo "------------------------------------------"

TEXT="$(alias g)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias principal de Google Cloud"$(textreset)

#------------- C R E A T E   K 8 S  ------------------

TEXT="$(alias g8c)"
echo "$(format_text_length ${TEXT})  - ${yellow}(g8a) de GC para crear un cluster de k8s"$(textreset)

#------------- D E L E T E   K 8 S  ------------------

TEXT="$(alias g8d)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC para eliminar un cluster de k8s"$(textreset)

#------------- S E R V I C E S   K 8 S  ------------------

TEXT="$(alias gsvc)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC Services k8s"$(textreset)


#------------- C O N F I G    K 8 S  ---------------------

TEXT="$(alias gcfg)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC Config k8s"$(textreset)

#------------- P R O J E C T S    K 8 S  -----------------

TEXT="$(alias gprj)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC Projects k8s"$(textreset)

#------------- C O M P O N E N T S     K 8 S  -----------------

TEXT="$(alias gcomp)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC Components k8s"$(textreset)

#------------- S A V E   K U B E C O N F I G   K 8 S  ---------

TEXT="$(alias gcsave)"
echo "$(format_text_length ${TEXT})  - ${yellow}GC Save Kubeconfig k8s"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

