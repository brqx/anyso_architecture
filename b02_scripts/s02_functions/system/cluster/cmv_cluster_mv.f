#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- cmv
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Mueve carpetas y ficheros en arquitectura de cluster
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T move cluster folder file
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cmv mainwar mongo -- Mueve mainwar a mongo en todo el cluster
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
cmv()
{
VER="0.0.4"
DEP="00"		# Depth script

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Run move command in Cluster Architecture Brqx [$VER] ($DEP)"
echo "=========================================================="
echo "Format  : cmv SOURCE TARGET                               "
echo "----------------------------------------------------------"
echo "Example : cmv light  log                                  "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"
TARGET="${2}"
FOLDER_SRC=$(dirname ${SOURCE})
FOLDER_TAR=$(dirname ${TARGET})

FIRST_LETTER=$( echo "${SOURCE}" | cut -c1 )
FIRST_LETTER_TAR=$( echo "${TARGET}" | cut -c1 )


if [ "${FIRST_LETTER}" != "/"  ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
else
echo "Source absoluta"
fi

if [ "${FIRST_LETTER_TAR}" != "/"  ] ; then
#- Is a new folder with relative path
TARGET="${PWD}/${TARGET}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
else
echo "Target absoluta"
fi

COMMAND="mv -f ${SOURCE} ${TARGET}"

echo "cop ${COMMAND}"
cop ${COMMAND}
fi
}
