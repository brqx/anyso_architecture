#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- srxfr
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- sync_set_target
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional [FROM] a nivel remoto dos rutas con rsync 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E srxfr dbrqx.com PATH1 PATH2 -- Sincroniza unidireccional [FROM] a nivel remoto dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
srxfr()
{
VER="0.0.2"

srxfr_FUN="srxfr"
srxfr_NFO="Sincroniza unidireccional [FROM] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
srxfr_FMT="srxfr [VERSION] [PATH]"
srxfr_EXA="srxfr 50 PATH"

srxfr_OUT=0
srxfr_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${srxfr_NFO}" "${srxfr_FMT}" "${srxfr_EXA}"
#--------------------------------------------------------------------------------
else
 #-Si solo se pasa una ruta la otra es la ruta actual

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

##rsync -av $/var/ramdisk-backup/ /mnt/ramdisk/

rsync -av -e "ssh -oPort=${PORT}" ${TARGET_STR} ${SOURCE}  &> /dev/null
rsync_OUT=$?

srxfr_OUT=$(expr  ${srxfr_OUT} + ${rsync_OUT})

chown -R apache:apache ${SOURCE} && chmod -R 775 ${SOURCE} &> /dev/null
chown_OUT=$?


#--END_IF_[01] - START [IF srxfr_CORRECT] ----------------------------
fi


if [ "${srxfr_OUT}" != "0" ] ; then
srxfr_ERR="+${srxfr_FUN}::##${srxfr_ERR}"
footer_error "${srxfr_ERR}"
fi

fi
}
