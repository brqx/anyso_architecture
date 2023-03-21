#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ]
#--------------------------------------------------------------------------------
#-- csd
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- sync_set_path - gsd
#--------------------------------------------------------------------------------
#+ Informacion :
#--------------------------------------------------------------------------------
#I Retorna la informacion del sevidor actual - Nombre IP y demas
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get server data ip name letter
#--------------------------------------------------------------------------------
#+ Parametros :
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo :
#--------------------------------------------------------------------------------
#E csd -- Comprueba el servidor actual y el remoto antes de hacer el sincronismo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
csd()
{
VER="0.0.1"							;QP="Brqx Agile Architecture 2016"

csd_FUN="csd"
csd_NFO="Comprueba el servidor actual y el remoto antes de hacer el sincronismo [$VER]($DEP) @${QP}"
csd_FMT="csd"
csd_EXA="csd"

csd_OUT=0
csd_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${csd_NFO}" "${csd_FMT}" "${csd_EXA}"
#--------------------------------------------------------------------------------
else

#-Obtenemos informacion del servidor - No hay opcion de error
gsd

if [ "${SERVER}" != "" ] ; then
#--STA_IF_[01] - START [ REMOTE SERVER IS PASED ] -------------------------------

##echo "12.44.55.66" | grep "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$"

#-Tiene valor booleano 1 o 0 dependiendo de si es una IP bien formada o un dominio
IS_IP_SERVER=$(echo "${SERVER}" | grep "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$" | wc -l )

if [ "${IS_IP_SERVER}" == "1" ] ; then
#--STA_IF_[02] - START [ REMOTE SERVER IS AN IP ] -------------------------------

#-El servidor remoto se ha indicado como IP

if [ "${SERVER_IP}" == "${SERVER}" ] ; then
#--STA_IF_[03] - [ REMOTE SERVER IS THE SAME THAN CURRENT IP ] ------------------

#-Es el mismo servidor que el actual - No hacemos sync
csd_EER="#-E21:Remote server is the same than Local server. Please use local command instead : ${SERVER} ##"
csd_COD=21
csd_OUT=$(expr  ${csd_OUT} + ${csd_COD})
csd_ERR="${csd_ERR}${csd_EER}"

#--END_IF_[03] - [ REMOTE SERVER IS THE SAME THAN CURRENT IP ] ------------------
fi

else
#--STA_IF_[02] - [ REMOTE SERVER IS A DOMAIN ] ----------------------------------

#-Suponemos que el servidor remoto se ha indicado como dominio

if [ "${SERVER_NAME}" == "${SERVER}" ] ; then
#--STA_IF_[02] - [ REMOTE SERVER IS THE SAME THAN CURRENT NAME ] ----------------

#-Es el mismo servidor que el actual - No hacemos sync
csd_EER="#-E22:Remote server is the same than Local server. Please use local command instead : ${SERVER} ##"
csd_COD=22
csd_OUT=$(expr  ${csd_OUT} + ${csd_COD})
csd_ERR="${csd_ERR}${csd_EER}"

#--END_IF_[02] - [ REMOTE SERVER IS THE SAME THAN CURRENT NAME ] ----------------
fi

#--END_IF_[01] - [ REMOTE SERVER IS AN IP ] -------------------------------------
fi

if [ "${csd_OUT}" == "0" ] ; then
#-En este caso intentamos crear la carpeta remota

sync_set_path
csd_OUT=$(expr  ${csd_OUT} + ${sync_set_path_OUT})
csd_ERR="${csd_ERR}${sync_set_path_ERR}"

fi


else

csd_EER="#-E21:Remote server is not indicated ##"
csd_COD=21
csd_OUT=$(expr  ${csd_OUT} + ${csd_COD})
csd_ERR="${csd_ERR}${csd_EER}"
  
#--END_IF_[01] - REMOTE SERVER IS PASED ] ---------------------------------------
 
fi  




if [ "${csd_OUT}" != "0" ] ; then
csd_ERR="+${csd_FUN}::##${csd_ERR}"
footer_error "${csd_ERR}"
fi


fi
}

