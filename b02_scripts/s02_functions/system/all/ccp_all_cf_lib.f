#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- ccp
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
#T copy cluster folder file
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ccp mainwar mongo -- Copia mainwar a mongo en todo el cluster
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ccp()
{
VER="0.0.4"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Copia ficheros o carpetas en cluster arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : ccp SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : ccp light                                      "
echo "Example : ccp mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE=${1}
TARGET=${2}

FOLDER_SRC=$(dirname ${SOURCE})
FOLDER_TAR=$(dirname ${TARGET})

if [ "${FOLDER_SRC}" != "${PWD}" ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

if [ "${FOLDER_TAR}" != "${PWD}" ] ; then
#- Is a new folder with relative path
TARGET="${PWD}/${TARGET}"
cmk_OUT="CH"
cmk_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

COMMAND="cp -Rf ${SOURCE} ${TARGET} "

cop "${COMMAND}"

cch 

SOURCE=""
fi
}
