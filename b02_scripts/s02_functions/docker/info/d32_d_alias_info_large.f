#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

d_alias_info_large()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Docker en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : dozz | d_alias_info_large               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Docker en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#  docker search --> buscar
TEXT="$(alias ds)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker search --> buscar"$(textreset)

#  docker system info --> docker information ( swarm ... )
TEXT="$(alias dsi)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker system info --> docker information ( swarm ... )"$(textreset)

# docker stack --> manage docker swarm and k8s
TEXT="$(alias dk)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker stack --> manage docker swarm and k8s"$(textreset)

#  docker remove instances (To force drm -f)
# alias drm="d rm "
TEXT="$(alias drm)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker rm --> Elimina contendores de Docker"$(textreset)


#  docker network  --> Redes en docker
#  alias dn="d network "
TEXT="$(alias dn)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker network --> Alias principal para manejar redes en Docker"$(textreset)

#  docker network list --> Redes en docker
# alias dnl="dn list "
TEXT="$(alias dnl)"
echo "$(format_text_length ${TEXT})  - ${yellow}docker network list --> Listado de redes de Docker "$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

