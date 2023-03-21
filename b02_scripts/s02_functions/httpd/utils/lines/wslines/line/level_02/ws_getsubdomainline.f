#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getsubdomainline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_fullsubdomain - ws_subdline
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
#E ws_getsubdomainline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getsubdomainline()
{
VER="0.1.0"

ws_getsubdomainline_OUT=0
ws_getsubdomainline_ERR=""

ws_getsubdomainline_FUN="ws_getsubdomainline"
ws_getsubdomainline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_getsubdomainline_FMT="ws_getsubdomainline LINE"
ws_getsubdomainline_EXA="ws_getsubdomainline LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getsubdomainline_NFO}" "${ws_getsubdomainline_FMT}" "${ws_getsubdomainline_EXA}"
#--------------------------------------------------------------------------------
else
#-Requiere IDSITE e IDSUBD

ws_ckidsite
ws_getsubdomainline_OUT=$(expr  ${ws_getsubdomainline_OUT} + ${ws_ckidsite_OUT})
ws_getsubdomainline_ERR="${ws_getsubdomainline_ERR}${ws_ckidsite_ERR}"

if [ "${ws_ckidsite_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
ws_getsubdomainline_OUT=$(expr  ${ws_getsubdomainline_OUT} + ${ws_subdline_OUT})
ws_getsubdomainline_ERR="${ws_getsubdomainline_ERR}${ws_subdline_ERR}"

#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${ws_getsubdomainline_OUT}" != "0" ] ; then
ws_getsubdomainline_ERR="#+${ws_getsubdomainline_FUN}::##${ws_getsubdomainline_ERR}"
footer_error "${ws_getsubdomainline_NFO}" "${ws_getsubdomainline_ERR}"
fi


fi
}
