#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkx
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- gsd - sxto
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Realiza un backup local de una ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T make local backup path
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E bkx /abc/dd -- Realiza un backup local de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
bkx()
{
VER="0.0.2"

bkx_FUN="bkx"
bkx_NFO="Realiza un backup local de una ruta [$VER]($DEP) @${QP}"
bkx_FMT="bkx [PATH]"
bkx_EXA="bkx --> Sync current folder if is SSD folder"

bkx_OUT=0
bkx_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${bkx_NFO}" "${bkx_FMT}" "${bkx_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup local folder 
PATH_TO_BK=${1}

#-Get Backup Server Data
get_backup_server_data
bkx_OUT=$(expr  ${bkx_OUT} + ${get_backup_server_data_OUT})
bkx_ERR="${bkx_ERR}${get_backup_server_data_ERR}"

if [ "${get_backup_server_data_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------

#-First Create BK Path

mkp ${BK_PATH_SPEC}
bkx_OUT=$(expr  ${bkx_OUT} + ${mkp_OUT})
bkx_ERR="${bkx_ERR}${mkp_ERR}"

if [ "${mkp_OUT}" == "0" ] ; then
#--STA_IF_[02] - START [IF mkp_CORRECT] -----------------------------------------

#Debe hacer backup de la ruta indicada
sxto ${PATH_TO_BK} ${BK_PATH_SPEC}
bkx_OUT=$(expr  ${bkx_OUT} + ${sxto_OUT})
bkx_ERR="${bkx_ERR}${sxto_ERR}"

#--END_IF_[02] - START [IF mkp_CORRECT] -----------------------------------------
fi

#--END_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------
fi

if [ "${bkx_OUT}" != "0" ] ; then
bkx="+${bkx_FUN}::##${bkx_ERR}"
footer_error "${bkx_ERR}"
fi


fi

}
