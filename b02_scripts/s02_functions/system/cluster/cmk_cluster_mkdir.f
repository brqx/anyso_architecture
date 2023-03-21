#!/bin/bash
#
# Script version 0.0.4
#
#- Cluster File Operations - Link files 
#  Use cop (Cluster OPeration Command )
cmk()
{
VER="0.0.4"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea un Virtual server en el cluster arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : cmk SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : cmk light                                      "
echo "Example : cmk mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"

FIRST_LETTER=$( echo "${SOURCE}" | cut -c1 )

if [ "${FIRST_LETTER}" != "/" ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
else
echo "Ruta absoluta"
fi

COMMAND="mkdir -p ${SOURCE}"

cop "${COMMAND}"

##- Change perms too

cch 
SOURCE=""
fi
}
