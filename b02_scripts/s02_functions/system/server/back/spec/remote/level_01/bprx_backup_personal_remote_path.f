#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bprx
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
#E bprx /abc/dd -- Realiza un backup remoto de una ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
bprx()
{
VER="0.0.2"                                           ;QP="Brqx Agile Architecture 2016"

bprx_FUN="bprx"
bprx_NFO="Realiza un backup remoto de una ruta [$VER]($DEP) @${QP}"
bprx_FMT="bprx [PATH]"
bprx_EXA="bprx --> Sync current folder if is SSD folder"

bprx_OUT=0
bprx_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA""
#--------------------------------------------------------------------------------
header_full "${bprx_NFO}" "${bprx_FMT}" "${bprx_EXA}"
#--------------------------------------------------------------------------------
else

#-Backup personal local folder
#-Las rutas para cosas personales son distintas a los sites. Requieren su propia funcion
#-Esta pendiende de crear....
 
PATH_TO_BK=${1}
SERVER=${2}

if [ "${PATH_TO_BK}"  == ""     ] ; then
PATH_TO_BK=$PWD
fi

if [ "${SERVER}"      == ""     ] ; then
SERVER=tbrqx.com
fi

ELEMENT_TO_BK=$( basename ${PATH_TO_BK}  )


#-Get Backup Server Data
#-Obetnemos la ruta de backup : BK_PATH_SPEC
get_backup_personal_server_data
bprx_OUT=$(expr  ${bprx_OUT} + ${get_backup_personal_server_data_OUT})
bprx_ERR="${bprx_ERR}${get_backup_server_data_ERR}"



if [ "${get_backup_personal_server_data_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------

BK_PATH_SPEC="${BK_PATH_SPEC}/${ELEMENT_TO_BK}"

#Debe hacer backup de la ruta indicada
srxto ${SERVER} ${PATH_TO_BK} ${BK_PATH_SPEC}
bprx_OUT=$(expr  ${bprx_OUT} + ${srxto_OUT})
bprx_ERR="${bprx_ERR}${sxto_ERR}"

TARGET=${BK_PATH_SPEC}

CMD_OWN="chown -R apache:apache ${TARGET} && chmod -R 775 ${TARGET} "
ssh -oPasswordAuthentication=no -oPort=${PORT} ${TARGET_USR} "${CMD_OWN}"  &> /dev/null
ssh_OUT=$?


#--END_IF_[01] - START [IF gsd_CORRECT] -----------------------------------------
fi

if [ "${bprx_OUT}" != "0" ] ; then
bprx="+${bprx_FUN}::##${bprx_ERR}"
footer_error "${bprx_ERR}"
fi


fi

}
