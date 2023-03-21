#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkrx
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- gsd - srxto
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Realiza un backup remoto de una ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T make remote backup path
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E bkrx /abc/dd -- Realiza un backup remoto de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
bkrx()
{
VER="0.0.2"                                           ;QP="Brqx Agile Architecture 2016"

bkrx_FUN="bkrx"
bkrx_NFO="Realiza un backup remoto de una ruta [$VER]($DEP) @${QP}"
bkrx_FMT="bkrx [PATH]"
bkrx_EXA="bkrx --> Sync current folder if is SSD folder"

bkrx_OUT=0
bkrx_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${bkrx_NFO}" "${bkrx_FMT}" "${bkrx_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup local folder 
PATH_TO_BK=${1}
SERVER=${2}

#-Get Backup Server Data
get_backup_server_data
bkrx_OUT=$(expr  ${bkrx_OUT} + ${get_backup_server_data_OUT})
bkrx_ERR="${bkrx_ERR}${get_backup_server_data_ERR}"

if [ "${get_backup_server_data_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------


#Debe hacer backup de la ruta indicada
echo "srxto ${SERVER} ${PATH_TO_BK} ${BK_PATH_SPEC}"
bkrx_OUT=$(expr  ${bkrx_OUT} + ${srxto_OUT})
bkrx_ERR="${bkrx_ERR}${sxto_ERR}"


#--END_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------
fi

if [ "${bkrx_OUT}" != "0" ] ; then
bkrx="+${bkrx_FUN}::##${bkrx_ERR}"
footer_error "${bkrx_ERR}"
fi


fi

}
