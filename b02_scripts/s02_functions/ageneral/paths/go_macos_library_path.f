#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org - Linux - MACOS
# Farmacia Zaragoza - Brqx Architectures - Rct - 2021
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Version Fichero : v0.0.0.3 -- Noviembre 2021
#
# Go MacOS Library Path
#-------------------------------------------------------------------

# alias li


go_macos_library_path()
{
VER="0.0.1"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "   Ajuste Paths para MacOS  [$VER]	    			             		"
echo "=========================================================="
echo "Format  : li | alias li="go_macos_library_path"                       "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

if [ -d "/Library/${PWD}" ] ; then

cd "/Library/${PWD}"

alias li="cd /Library/${PWD}"

fi

fi
}
