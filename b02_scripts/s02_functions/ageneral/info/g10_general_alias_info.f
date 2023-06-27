#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Informa de los alias definidos en arquitectura
# ------------------------------------------------------

general_alias_info()
{
VER="0.0.0.1"
FEC="2023-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Informacion de los alias generales definidos en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : general_i | general_alias_info               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

# Establecemos el size del texto deseado para la salida
set_text_length 30

echo "--==--==--==--==--==--==--==--==--==--==--"
echo "Alias definidos en arquitectura Brqx ${VER} - ${FEC}"
echo "------------------------------------------"

TEXT="$(alias li)"
echo "$(format_text_length ${TEXT})  - ${yellow}Alias de acceso a rutas MacOS"$(textreset)


echo "--==--==--==--==--==--==--==--==--==--==--"


fi
}

#-------------------------------------------------------------------

