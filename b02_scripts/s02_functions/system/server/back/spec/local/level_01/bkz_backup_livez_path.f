#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkz
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- gsd - szto
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
#E bkz /abc/dd -- Realiza un backup local de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
bkz()
{
VER="0.0.2"

bkz_FUN="bkz"
bkz_NFO="Realiza un backup local de una ruta [$VER]($DEP) @${QP}"
bkz_FMT="bkz [PATH]"
bkz_EXA="bkz --> Sync current folder if is SSD folder"

bkz_OUT=0
bkz_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${bkz_NFO}" "${bkz_FMT}" "${bkz_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup local folder 
PATH_TO_BK=${1}

#-Get Backup Server Data
get_backup_server_data
bkz_OUT=$(expr  ${bkz_OUT} + ${get_backup_server_data_OUT})
bkz_ERR="${bkz_ERR}${get_backup_server_data_ERR}"

if [ "${get_backup_server_data_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------

#-First Create BK Path

mkp ${BK_PATH_SPEC}
bkz_OUT=$(expr  ${bkz_OUT} + ${mkp_OUT})
bkz_ERR="${bkz_ERR}${mkp_ERR}"

if [ "${mkp_OUT}" == "0" ] ; then
#--STA_IF_[02] - START [IF mkp_CORRECT] -----------------------------------------

#Debe hacer backup de la ruta indicada
szto ${PATH_TO_BK} ${BK_PATH_SPEC}
bkz_OUT=$(expr  ${bkz_OUT} + ${szto_OUT})
bkz_ERR="${bkz_ERR}${szto_ERR}"

#--END_IF_[02] - START [IF mkp_CORRECT] -----------------------------------------
fi

#--END_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------
fi

if [ "${bkz_OUT}" != "0" ] ; then
bkz="+${bkz_FUN}::##${bkz_ERR}"
footer_error "${bkz_ERR}"
fi


fi

}
