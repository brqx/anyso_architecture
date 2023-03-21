#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

docker_alias_info()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Docker en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : doz | docker_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Docker en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

TEXT="$(alias doz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de docker short"$(textreset)

TEXT="$(alias dozz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de docker large"$(textreset)

#------------- D O C K E R    C O M P O S E  ------------------

TEXT="$(alias dcz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de Docker Compose short"$(textreset)

TEXT="$(alias dczz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de Docker Compose large"$(textreset)

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

