#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_getsiteline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_gdcreate - ws_gscreate
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si un site existe en el sistema
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_getsiteline [ID] -- Comprueba si un site existe en el sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getsiteline()
{
VER="0.0.3"

ws_getsiteline_FUN="ws_getsiteline"
ws_getsiteline_NFO="Obtiene informacion del site en razon a la ruta del mismo [$VER]($DEP)@${QP}"
ws_getsiteline_FMT="ws_getsiteline IDSITE"
ws_getsiteline_EXA="ws_getsiteline espalillos"

ws_getsiteline_OUT=0
ws_getsiteline_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getsiteline_NFO}" "${ws_getsiteline_FMT}" "${ws_getsiteline_EXA}"
#--------------------------------------------------------------------------------
else
#Debe obtener informacion del site ya sea domino o subdominio al estilo ws_getsiteline
#-Su objetivo es devolver HOME_PATH entre otros


#-Suponemos que el proyecto es un dominio

ws_gdcreate
ws_getsiteline_OUT=$(expr  ${ws_getsiteline_OUT} + ${ws_gdcreate_OUT})
ws_getsiteline_ERR="${ws_getsiteline_ERR}${ws_gdcreate_ERR}"

if 	[ "${PROJECT_TYPE}" == "subdomain" 	] ; then 
#--STA_IF_[01] - [IF PROJECT TYPE SUBDOMAIN ] -----------------------------------

#-Al ser un subdominio reseteamos los codigos de error
ws_getsiteline_OUT=0
ws_getsiteline_ERR=""

ws_gscreate
ws_getsiteline_OUT=$(expr  ${ws_getsiteline_OUT} + ${ws_gscreate_OUT})
ws_getsiteline_ERR="${ws_getsiteline_ERR}${ws_gscreate_ERR}"

# Call to ws_getdomainline

fi

if 	[ "${PROJECT_TYPE}" != "domain" 	-a  "${PROJECT_TYPE}" 	!= "subdomain" ] ; then 

ws_getsiteline_EER="#-Wrong Project : ${IDSITE} ${SUBD} DONT EXIST IN CLUSTER STRUCTURE ##"
ws_getsiteline_COD=20

ws_getsiteline_OUT=$(expr  ${ws_getsiteline_OUT} + ${ws_getsiteline_COD})
ws_getsiteline_ERR="${ws_getsiteline_ERR}${ws_getsiteline_EER}"

fi


if [ "${ws_getsiteline_OUT}" != "0" ] ; then
if [ -d ${HOME_PATH} ] ; then
#--END_IF_[01] - [IF HOME PATH EXIST ] ------------------------------------------

ws_getsiteline_MSG="#-OK : STRUCTURE: ${HOME_PATH} EXIST IN SERVER ##"			  

else
ws_getsiteline_ERR="#-WARNING : STRUCTURE: ${HOME_PATH} DONT EXIST IN SERVER ##"			  
ws_getsiteline_OUT=20
	
#--END_IF_[01] - [IF HOME PATH EXIST ] ------------------------------------------
fi
fi


if [ "${ws_getsiteline_OUT}" != "0" ] ; then
ws_getsiteline_ERR="# ${ws_getsiteline_FUN}::##${ws_getsiteline_ERR}"
footer_error "${ws_getsiteline_ERR}"
fi

fi
}
