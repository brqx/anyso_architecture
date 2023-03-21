#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

terraform_alias_info()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Terraform en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : tz | terraform_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 50

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Terraform en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

TEXT="$(alias tzz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Terraform con comando"$(textreset)

TEXT="$(alias tzc)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Terraform con docker compose"$(textreset)

TEXT="$(alias tzzz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Terraform con comando Extendido"$(textreset)

TEXT="$(alias tzcz)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias Terraform con docker compose Extendido"$(textreset)

echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

