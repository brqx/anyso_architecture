#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getbkparamsline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getbkparamsline
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
#E ws_getbkparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getbkparamsline()
{
VER="0.1.1"

ws_getbkparamsline_OUT=0
ws_getbkparamsline_ERR=""
ws_getbkparamsline_MSG=""

ws_getbkparamsline_FUN="ws_getbkparamsline"
ws_getbkparamsline_NFO="Define las variables relacionadas con backup [$VER]"
ws_getbkparamsline_FMT="ws_getbkparamsline LINE"
ws_getbkparamsline_EXA="ws_getbkparamsline LINE"


if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------

else

#---------------------------------------------------
#-BACKUP PARAMS
#---------------------------------------------------

#-Indica si esta activado o no el backup para el site
BACKUP_ENABLED=$( 	cat  ${PARAMS_FIND_TMP} 	| grep "^BACKUP_ENABLED="	| head -1   | cut -d "=" -f2    )

#-Podemos especificar servidores de backup tanto por site como por servidor
BACKUP_SERVERS=$( 	cat  ${PARAMS_FIND_TMP} 	| grep "^BACKUP_SERVERS="	| head -1   | cut -d "=" -f2    )

#-Numero de copias mensuales que guardamos (siempre guardamos una actual)
BACKUP_NUM_COPIES=$( cat ${PARAMS_FIND_TMP} 	| grep "^BACKUP_NUM_COPIES="	| head -1   | cut -d "=" -f2    )


if [ "${ws_getbkparamsline_OUT}" != "0" ] ; then
ws_getbkparamsline_ERR="+${ws_getbkparamsline_FUN}::##${ws_getbkparamsline_ERR}"
footer_error "${ws_getbkparamsline_ERR}"
fi


fi
}
