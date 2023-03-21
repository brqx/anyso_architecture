#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- srzto
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- sync_set_target
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T sync folders delete to
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E srzto PATH [PATH2] Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
srzto()
{
VER="0.0.2"

srzto_FUN="srzto"
srzto_NFO="Sincroniza unidireccional force delete [TO] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
srzto_FMT="srzto [VERSION] [PATH]"
srzto_EXA="srzto 50 PATH"

srzto_OUT=0
srzto_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${srzto_NFO}" "${srzto_FMT}" "${srzto_EXA}"
#--------------------------------------------------------------------------------
else
#-Si solo se pasa una ruta la otra es la ruta actual
#-Es Una sincronizacion borrando contenido si procede sx (sincroniza) srz (sincroniza y borra) 

SERVER=${1}
SOURCE=${2}
TARGET=${3}
PORT=${4}
USER=${5}

#-Vamos a crear una funcion que sea get_server_data

sync_set_target
srxfr_OUT=$(expr  ${srxfr_OUT} + ${sync_set_target_OUT})
srxfr_ERR="${srxfr_ERR}${sync_set_target_ERR}"

if [ "${sync_set_target_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF srxfr_CORRECT] ----------------------------

if [ "${TARGET}" == "" ] ; then
#-Solo se ha pasado una ruta
TARGET=${SOURCE}
SOURCE=${PWD}
fi

#-Path always with BAR ending
#-Always absolute paths

SOURCE=$(fix_bar_path ${SOURCE} )
TARGET=$(fix_bar_path ${TARGET} )

##rsync -av --delete --recursive --force -e "ssh -oPort=${PORT}" ${SOURCE} ${TARGET_STR} &> /dev/null  
rsync -av --delete --recursive -e "ssh -oPort=${PORT}" ${SOURCE} ${TARGET_STR} &> /dev/null  
rsync_OUT=$?

srxfr_OUT=$(expr  ${srxfr_OUT} + ${rsync_OUT})

CMD_OWN="chown -R apache:apache ${TARGET} && chmod -R 775 ${TARGET} "
ssh -oPasswordAuthentication=no -oPort=${PORT} ${TARGET_USR} "${CMD_OWN}"  &> /dev/null
ssh_OUT=$?


#--END_IF_[01] - START [IF srxfr_CORRECT] ----------------------------
fi



if [ "${srzto_OUT}" != "0" ] ; then
srzto_ERR="+${srzto_FUN}::##${srzto_ERR}"
footer_error "${srzto_ERR}"
fi



fi

}
