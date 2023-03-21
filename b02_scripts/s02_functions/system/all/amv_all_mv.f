#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- amv
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
echo "Format  : amv SOURCE TARGET                               "
echo "----------------------------------------------------------"
echo "Example : amv light  log                                  "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"
TARGET="${2}"
FOLDER_SRC=$(dirname ${SOURCE})
FOLDER_TAR=$(dirname ${TARGET})

if [ "${FOLDER_SRC}" != "${PWD}" ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
amv_OUT="CH"
amv_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

if [ "${FOLDER_TAR}" != "${PWD}" ] ; then
#- Is a new folder with relative path
TARGET="${PWD}/${TARGET}"
amv_OUT="CH"
amv_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

COMMAND="if [ -d ${SOURCE} -o -f ${SOURCE} ] ; then mv -f ${SOURCE} ${TARGET}"

#--Command for all servers
aop "${COMMAND}"

fi
}
