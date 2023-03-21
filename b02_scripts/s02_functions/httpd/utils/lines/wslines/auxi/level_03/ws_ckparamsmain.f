#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckparamsmain
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba los parametros de la linea de entrada y gestiona los valores por defecto
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
#E ws_ckparamsmain [FINDLINE] -- ObtiEne valores para la MainLine del subdominio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckparamsmain()
{
VER="0.0.7"

ws_ckparamsmain_FUN="ws_ckparamsmain"
ws_ckparamsmain_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_ckparamsmain_FMT="ws_ckparamsmain LINE"
ws_ckparamsmain_EXA="ws_ckparamsmain LINE"

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckparamsmain_NFO}" "${ws_ckparamsmain_FMT}" "${ws_ckparamsmain_EXA}"
#--------------------------------------------------------------------------------
else

if [ "${MAINLANGUAGE}" == "" -o "${MAINLANGUAGE}" == "multi" ] ; then 
MAINLANGUAGE="aa"
fi

if [ "${MAINENVIRONMENT}" == "" ] ; then
#Por defecto el entorno de BBDD es produccion
MAINENVIRONMENT="p"
fi

if [ "${MAINDIVISION}" == "" ] ; then
#-Profesional - Defecto
MAINDIVISION="pro"
fi

if [ "${MAINREPLICATION}" == "" -o "${MAINREPLICATION}" == "n" ] ; then
#Por defecto el entorno de BBDD es produccion
MAINREPLICATION_TAG="_n"
MAINREPLICATION="n"
fi

if [ "${MAINDRUPAL_VERSION}" == "" ] ; then
#Por defecto el entorno de BBDD es produccion
MAINDRUPAL_VERSION="50"
fi

if [ "${MAINSITE}" == "" ] ; then
#-Idimoa - Defecto es - spanish
MAINSITE=${MAINPROJECT}
fi

if [ "${MAINMODE}" == "serv" ] ; then
#-Profesional - Defecto
MAINMODEVS="home"
else
MAINMODEVS=${MAINMODE}
fi


fi
}
