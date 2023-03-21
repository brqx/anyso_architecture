#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- crm
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Borra carpetas y ficheros en arquitectura de cluster
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
#E crm files/ppp -- Cambia permisos, usuario y grupo para esa ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
crm()
{
VER="0.0.5"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Borra ficheros y carpetas en cluster arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : crm SITE_ID                                    "
echo "----------------------------------------------------------"
echo "Example : crm                                       		"
echo "Example : crm mainwar                                    	"
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
crm_OUT="CH"
crm_MSG="Cambio de ruta ajustando path absoluto ${SOURCE}"
fi

fi

COMMAND="rm -rf ${SOURCE} "

cop "${COMMAND}"
cch_OUT=${cop_OUT}

fi
}
