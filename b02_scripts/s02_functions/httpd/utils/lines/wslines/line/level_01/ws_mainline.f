#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_mainline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getparamsmain
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_mainline [FINDLINE] -- ObtiEne valores para la MainLine del subdominio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_mainline()
{
VER="0.1.0"

ws_mainline_FUN="ws_mainline"
ws_mainline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_mainline_FMT="ws_mainline LINE"
ws_mainline_EXA="ws_mainline LINE"

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_mainline_NFO}" "${ws_mainline_FMT}" "${ws_mainline_EXA}"
#--------------------------------------------------------------------------------
else

MAIN_LINE_INT=${1}

#-No hay opcion de fallo en la llamada a los valores del dominio
ws_getparamsmain "${MAIN_LINE_INT}"

MAINSITE_PATH="${MAINDIVISION}/${MAINPROJECT}/${MAINSITE}/${MAINLANGUAGE}/"
MAINBK_PATH="${MAINMODE}/${MAINSITE_PATH}"

MAINVS_PATH="/host/${MAINBK_PATH}"

MAINHOME_PATH="/${MAINMODEVS}/${MAINSITE_PATH}"
MAINDATABASE="${MAINPROJECT}_${MAINENVIRONMENT}${MAINDRUPAL_VERSION}${MAINPROJECT}${MAINSITE}${MAINREPLICATION_TAG}_${MAINLANGUAGE}V${SITE_VERSION}"

MAINLOGS_PATH="/logs/${MAINBK_PATH}"
MAINTEMPLATE_FOLDER_LEVEL="/host/${MAINBK_PATH}"

fi
}
