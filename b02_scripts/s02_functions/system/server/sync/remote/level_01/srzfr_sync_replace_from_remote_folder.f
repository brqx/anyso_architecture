#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- srzfr
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- sync_set_target
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T sync folders delete from
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH1 [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E srzfr PATH1 PATH2 -- Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
srzfr()
{
VER="0.0.2"

srzfr_FUN="srzfr"
srzfr_NFO="Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
srzfr_FMT="srzfr [VERSION] [PATH]"
srzfr_EXA="srzfr 50 PATH"

srzfr_OUT=0
srzfr_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${srzfr_NFO}" "${srzfr_FMT}" "${srzfr_EXA}"
#--------------------------------------------------------------------------------
else
#-Si solo se pasa una ruta la otra es la ruta actual
#-Es Una sincronizacion sin borrar contenido sx (sincroniza) srz (sincroniza y borra) 

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
#--STA_IF_[01] - [IF sync_set_target_CORRECT] -----------------------------------

#-Destino tiene el significado / idea de remoto

rsync -av --delete --recursive --force -e "ssh -oPort=${PORT}" ${TARGET_STR} ${SOURCE} &> /dev/null  
rsync_OUT=$?

srzfr_OUT=$(expr  ${srzfr_OUT} + ${rsync_OUT})

chown -R apache:apache ${SOURCE} && chmod -R 775 ${SOURCE} &> /dev/null

#--END_IF_[01] - [IF sync_set_target_CORRECT] -----------------------------------
fi


if [ "${srzfr_OUT}" != "0" ] ; then
srzfr_ERR="+${srzfr_FUN}::##${srzfr_ERR}"
footer_error "${srzfr_ERR}"
fi

fi
}
