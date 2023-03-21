#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- mletr
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#-------------------------------------------------------------------
#-- letr
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Renovacion multiple certificados Letsncrypt en Haproxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T renew multiple ssl cert haproxy
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mletr 	-- Renueva todo los certificados que esten en fecha 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F 
#-------------------------------------------------------------------
mletr()
{
VER="0.0.1"

mletr_FUN="mletr"
mletr_NFO="Renovacio multiple de certificados SSL con LetsEncrypt [$VER]"
mletr_FMT="mletr"
mletr_EXA="mletr"

mletr_OUT=0
mletr_MSG_CLEAN="cert_KO"
mletr_ERR=""
F=${mletr_FUN}

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mletr_NFO}" "${mletr_FMT}" "${mletr_EXA}"
#--------------------------------------------------------------------------------
else

PROJECT_PATH="/brqi/"

DOMAIN_LIST=$(ls -1 /etc/letsencrypt/live/ | grep -v 001 | tr "\n" " " )

#-Iteramos todos los dominios de la lista
for IDSITE in $(echo ${DOMAIN_LIST}) ;do


SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_getsiteline 
mletr_OUT=$(expr  ${mletr_OUT} + ${ws_getsiteline_OUT})
mletr_ERR="${mletr_ERR}${ws_getsiteline_ERR}"

if    [ "${ws_getsiteline_OUT}"     == "0"      ] ; then
#--STA_IF_[01] - [IF CHECK IDSITE ] ---------------------------------------------

echo "renewing ${IDSITE} PATH:  ${LAN_HOME_PATH}"

#IDSITE -- zg 
#DOMAIN -- gbrqx.com
letr ${DOMAIN} ${LAN_HOME_PATH}
#--STA_IF_[01] - [IF CHECK IDSITE ] ---------------------------------------------
fi


#--END_IF_[02] - [ LETENCRYPT PATH EXIST] ---------------------------------------------
done

mletr_MSG="-[${FUNC}] ${letr_MSG_CLEAN}"

#-SHOW es una varible general para activar o desactivar mensajes
if [ ${SHOW} -a  "${mletr_OUT}" != "0" ] ; then
mletr_ERR="#+${mletr_FUN}::##${mletr_ERR}"
footer_error "${mletr_NFO}" "${mletr_ERR}"
fi


fi
}
