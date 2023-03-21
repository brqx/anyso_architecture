#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- sync_set_path
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- SOURCE - TARGET / ssh
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba ruta origen y crea ruta destino 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check sync source target params make folder
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E sync_set_path -- Analiza parametros SOURCE y TARGET y define TARGET_STR
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
sync_set_path()
{
VER="0.0.4"							;QP="Brqx Agile Architecture 2016"
DEP="01"

sync_set_path_FUN="sync_set_path"
sync_set_path_NFO="Comprueba ruta origen y crea ruta destino [$VER]($DEP) @${QP}"
sync_set_path_FMT="sync_set_path [VERSION] [PATH]"
sync_set_path_EXA="sync_set_path 50 PATH"

sync_set_path_OUT=0
sync_set_path_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${sync_set_path_NFO}" "${sync_set_path_FMT}" "${sync_set_path_EXA}"
#--------------------------------------------------------------------------------
else
 #-Comprueba ruta origen y crea ruta destino - Requiere que se hayan definido SOURCE y TARGET

if [ "${SOURCE}" != "" -a "${TARGET}" != "" ] ; then 
#--STA_IF_[01] -- [ CHECKING SOURCE AND TARGET PARAMS ] -------------------------

if [  "${SERVER}" != "" -a "${PORT}" != "" -a "${USER}" != ""  ] ; then
#--STA_IF_[02] -- [ CHECKING SERVER PORT AND USER ] -----------------------------

if [ -d "${SOURCE}" ] ; then
#--STA_IF_[03] -- [ CHECKING SOURCE ] -------------------------------------------

CMD="mkdir -p ${TARGET}"
ssh -oPasswordAuthentication=no -oPort=${PORT} ${TARGET_USR} "${CMD}"  &> /dev/null
ssh_OUT=$?

if [ "${ssh_OUT}" != "0" ] ; then
#--STA_IF_[04] -- [ CHECKING MAKING FOLDER TARGET ] -----------------------------

sync_set_path_EER="#-E412:Can not create remote target folder : ${TARGET_STR} : ${ssh_OUT} ##"
sync_set_path_COD=32

sync_set_path_OUT=$(expr  ${sync_set_path_OUT} + ${sync_set_path_COD})
sync_set_path_ERR="${sync_set_path_ERR}${sync_set_path_EER}"

else
#-La conexion SSH ha sido correcta - Cambiamos tambien usuario y permisos

#-Ajustamos para que la carpeta remota tambien pertenezca a apache
CMD_OWN="chown -R apache:apache ${TARGET} && chmod -R 775 ${TARGET} "
ssh -oPasswordAuthentication=no -oPort=${PORT} ${TARGET_USR} "${CMD_OWN}"  &> /dev/null
ssh_OUT=$?

#--END_IF_[04] -- [ CHECKING MAKING FOLDER TARGET ] -----------------------------
fi
else
#--ELS_IF_[03] -- [ CHECKING SOURCE ] -------------------------------------------


sync_set_path_EER="#-E34:Source is not folder : ${SOURCE} ##"
sync_set_path_COD=34

sync_set_path_OUT=$(expr  ${sync_set_path_OUT} + ${sync_set_path_COD})
sync_set_path_ERR="${sync_set_path_ERR}${sync_set_path_EER}"

#--END_IF_[03] -- [ CHECKING SOURCE ] -------------------------------------------
fi
else

sync_set_path_EER="#-E35:Server or Port or User are null Server : ${SERVER} - Port : ${PORT} - User : ${USER} ##"
sync_set_path_COD=35

sync_set_path_OUT=$(expr  ${sync_set_path_OUT} + ${sync_set_path_COD})
sync_set_path_ERR="${sync_set_path_ERR}${sync_set_path_EER}"

#--END_IF_[02] -- [ CHECKING SERVER PORT AND USER ] -----------------------------
fi
else

sync_set_path_EER="#-E33:Source or Target are nulls Source: ${SOURCE} - Target : ${TARGET} ##"
sync_set_path_COD=33

sync_set_path_OUT=$(expr  ${sync_set_path_OUT} + ${sync_set_path_COD})
sync_set_path_ERR="${sync_set_path_ERR}${sync_set_path_EER}"

#--END_IF_[01] -- [ CHECKING SOURCE AND TARGET PARAMS ] -------------------------
fi

if [ "${sync_set_path_OUT}" != "0" ] ; then
sync_set_path_ERR="+${sync_set_path_FUN}::##${sync_set_path_ERR}"
footer_error "${sync_set_path_ERR}"
fi

fi
}
