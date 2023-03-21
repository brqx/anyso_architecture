#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- leth
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Renovacion certificado Letsncrypt en Haproxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create ssl cert haproxy
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P DOMAIN 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E leth brqx.es 	-- Renueva certificado para el dominio en haproxy 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F 
#-------------------------------------------------------------------
leth()
{
VER="0.0.1"

letr_FUN="letr"
letr_NFO="Generacion de certificados SSL con LetsEncrypt para HaProxy [$VER]"
letr_FMT="letr DOMAIN"
letr_EXA="letr pbrqx.com"

letr_OUT=0
letr_MSG_CLEAN="cert_KO"
letr_ERR=""
F=${letr_FUN}

if [ "${1}" == "-?"  -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${letr_NFO}" "${letr_FMT}" "${letr_EXA}"
#--------------------------------------------------------------------------------
else

DOMAIN_CERT=${1}

LETS_PATH=/etc/letsencrypt/live/

LETS_DOMAIN=${LETS_PATH}${DOMAIN_CERT}
HAPROXY_PATH=/etc/haproxy/certs

if [ -d ${LETS_DOMAIN} -a -d ${HAPROXY_PATH} ] ; then
#--STA_IF_[02] - [ LETENCRYPT PATH EXIST ] ---------------------------------------------


# Ahora hay que copiarlo al haproxy

#Lo copiamos a haproxy
CLEAN_DOMAIN=$(echo ${DOMAIN_CERT} | tr "." "_" )
cat ${LETS_DOMAIN}/fullchain.pem ${LETS_DOMAIN}/privkey.pem >  ${HAPROXY_PATH}/${CLEAN_DOMAIN}.pem
chow ${HAPROXY_PATH}/${CLEAN_DOMAIN}.pem


#-3.Recargar Haproxy SSL

service haproxy_ssl_01 reload 2> /dev/null
ha_OUT=$?
letc_OUT=$(expr  ${letc_OUT} + ${ha_OUT})


if [ "${ha_OUT}"       == "0"      ] ; then
#--STA_IF_[03] - [ HA RELOAD CORRECTLY ] ---------------------------------------------

letc_MSG_CLEAN="LetScrypt Haproxy Reload OK"
letc_TXT="-[${FUNC}] Orden cert lanzada de forma correcta contra el dominio ${DOMAIN_CERT}"

else
letc_COD=10
letc_OUT=$(expr  ${letc_OUT} + ${letc_COD})
letc_EER="#-Error - Haproxy Reload no ha funcionado correctamente [ ${letc_OUT} ] en dominio ${DOMAIN_CERT} ##"
letc_ERR="${letc_ERR}${letc_EER}"


#--END_IF_[03] - [ HA RELOAD CORRECTLY ] ---------------------------------------------
fi
else

letr_COD=30
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_EER="#-Error - Cert no existe en el sistema [ ${letr_OUT} ] para el dominio ${DOMAIN_CERT} ##"
letr_ERR="${letr_ERR}${letr_EER}"

#--END_IF_[02] - [ LETENCRYPT PATH EXIST] ---------------------------------------------
fi

letr_MSG="-[${FUNC}] ${letr_MSG_CLEAN}"

#-SHOW es una varible general para activar o desactivar mensajes
if [ ${SHOW} -a  "${letr_OUT}" != "0" ] ; then
letr_ERR="#+${letr_FUN}::##${letr_ERR}"
footer_error "${letr_NFO}" "${letr_ERR}"
fi


fi
}
