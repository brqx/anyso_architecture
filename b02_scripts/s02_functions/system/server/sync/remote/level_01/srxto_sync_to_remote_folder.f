#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- srxto
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I  
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E srxto SERVER PATH [PATH2] Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
srxto()
{
VER="0.0.2"

srxto_FUN="srxto"
srxto_NFO="Sincronismo remoto unidireccional [TO] con rsync [$VER]($DEP) @${QP}"
srxto_FMT="srxto SERVER [PATH]"
srxto_EXA="srxto 50 PATH"

srxto_OUT=0
srxto_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${srxto_NFO}" "${srxto_FMT}" "${srxto_EXA}"
#--------------------------------------------------------------------------------
else
#-Si solo se pasa una ruta la otra es la ruta actual
#-Es Una sincronizacion sin borrar contenido sx (sincroniza) sz (sincroniza y borra) 

SERVER=${1}
SOURCE=${2}
TARGET=${3}
PORT=${4}
USER=${5}

#-Prepara el servidor remoto

sync_set_target
srxto_OUT=$(expr  ${srxto_OUT} + ${sync_set_target_OUT})
srxto_ERR="${srxto_ERR}${sync_set_target_ERR}"

if [ "${sync_set_target_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF srxto_CORRECT] ----------------------------

rsync -av --append -e "ssh -oPort=${PORT}" ${SOURCE}  ${TARGET_STR}  		&> /dev/null  
rsync_OUT=$?

srxto_OUT=$(expr  ${srxto_OUT} + ${rsync_OUT})

CMD_OWN="chown -R apache:apache ${TARGET} && chmod -R 775 ${TARGET} "
ssh -oPasswordAuthentication=no -oPort=${PORT} ${TARGET_USR} "${CMD_OWN}"  &> /dev/null
ssh_OUT=$?


#--END_IF_[01] - START [IF srxto_CORRECT] ----------------------------
fi

if [ "${srxto_OUT}" != "0" ] ; then
srxto_ERR="+${srxto_FUN}::##${srxto_ERR}"
footer_error "${srxto_ERR}"
fi

fi
}
