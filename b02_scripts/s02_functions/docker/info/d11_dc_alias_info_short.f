#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

dc_alias_info_short()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias definidos en Docker Compose en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : dcz | dc_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos Docker Compose en arquitectura Brqx ${VER} - ${FEC} - Nivel 0"
echo "------------------------------------------"

set_text_length 40

#  dc up --> Borrar la cache y ejecutar docker compose
TEXT="$(alias dcu)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura detach sin usar cache"$(textreset)

#  dc up --> Arrancar estructura no detach
TEXT="$(alias dcud)"
echo "$(format_text_length ${TEXT})  - ${yellow}Arrancar estructura no detach sin usar cache"$(textreset)

#  dc stop --> Detiene estructura
TEXT="$(alias dcs)"
echo "$(format_text_length ${TEXT})  - ${yellow}Para/destruye estructura"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

