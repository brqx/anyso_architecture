#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- cch
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia permisos en carpetas y ficheros en arquitectura de cluster
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ch chown chmod cluster folder file
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cch files/ppp -- Cambia permisos, usuario y grupo para esa ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
cch()
{
VER="0.0.5"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Cambia permisos en cluster arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : cch SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : cch light                                      "
echo "Example : cch mainwar                                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

SOURCE="${1}"

if [  "${SOURCE}" == "" ] ; then
SOURCE="${PWD}/*"
else
FOLDER=$(dirname ${SOURCE})

if [ "${FOLDER}" != "${PWD}" ] ; then
#- Is a new folder with relative path
SOURCE="${PWD}/${SOURCE}"
cch_OUT="CH"
cch_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

fi

COMMAND="chmod -R 775 ${SOURCE} && chown -R apache:apache ${SOURCE}"

cop "${COMMAND}"
cch_OUT=${cop_OUT}

fi
}
