#!/bin/bash
#
# Script version 0.0.4
#
#- Cluster File Operations - Link files 
#  Use cop (Cluster OPeration Command )
cvi()
{
VER="0.0.4"
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Crea un Virtual server en el cluster arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wccr SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : wccr light                                      "
echo "Example : wccr mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

SOURCE=${1}

CURRENT_PATH=${PWD}
CURRENT_FOLDER=$( dirname ${CURRENT_PATH}   )

#Casos - Hay que analizar la ruta

COMMAND="vim ${SOURCE}:scp  ${CURRENT_PATH}/{SOURCE} [CLUSTER]:${CURRENT_FOLDER}"

cor "${COMMAND}"

fi
}
