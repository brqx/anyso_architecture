#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- letc
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#-------------------------------------------------------------------
#-- cert
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Creacion certificado Letsncrypt
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create ssl cert
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P DOMAIN [PWD] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E letc brqx.es 	-- Genera certificado letsncrypt para el dominio 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F 
#-------------------------------------------------------------------
letc()
{
VER="0.0.1"

letc_FUN="letc"
letc_NFO="Generacion de certificados SSL con LetsEncrypt [$VER]"
letc_FMT="letc DOMAIN [PWD]"
letc_EXA="letc pbrqx.com"

letc_OUT=0
letc_MSG_CLEAN="cert_KO"
letc_ERR=""
F=${letc_FUN}

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${letc_NFO}" "${letc_FMT}" "${letc_EXA}"
#--------------------------------------------------------------------------------
else

DOMAIN_CERT=${1}
SITE_HOME=${2}

CERT_SW=$(		which certbot 	2> /dev/null		| wc -l )

if [ "${SITE_HOME}" == ""           ] ; then
#--STA_IF_[00] - [ SITE HOME READY ] -------------------------------------------
SITE_HOME="$PWD"
fi

if [ "${CERT_SW}" 			== "1" 			] ; then
#--STA_IF_[02] - [ CERT INSTALLED ] ---------------------------------------------

LETS_PATH=/etc/letsencrypt/live/${DOMAIN_CERT}

if [ ! -d ${LETS_PATH} ] ; then
#--STA_IF_[03] - [ CERT ALREADY EXIST ] ---------------------------------------------
#Si ya existe el certificado no lo creamos de nuevo

#certbot certonly -a webroot --webroot-path=$PWD -d ${DOM} -d www.${DOM}

#Hay que parar el ssl un momento
#certbot renew

echp "certbot certonly -a webroot --webroot-path=${SITE_HOME} -d ${DOMAIN_CERT} -d www.${DOMAIN_CERT} "
certbot certonly -a webroot --webroot-path=${SITE_HOME} -d ${DOMAIN_CERT} -d www.${DOMAIN_CERT} 2> /dev/null   

letc_COD=$?  

letc_OUT=$(expr  ${letc_OUT} + ${letc_COD})

if [ "${letc_OUT}"       == "0"      ] ; then
#--STA_IF_[04] - [ CERT RUNNED CORRECTLY ] ---------------------------------------------

#Lo copiamos a haproxy
CLEAN_DOMAIN=$(echo ${DOMAIN_CERT} | tr "." "_" )
cat /etc/letsencrypt/live/${DOMAIN_CERT}/fullchain.pem /etc/letsencrypt/live/${DOMAIN_CERT}/privkey.pem >  /etc/haproxy/certs/${CLEAN_DOMAIN}.pem

chow /etc/haproxy/certs/${CLEAN_DOMAIN}.pem

#-Recargarmos haproxy
service haproxy_ssl_01 reload

letc_MSG_CLEAN="LetScrypt Cert Create_OK"
letc_TXT="-[${FUNC}] Orden cert lanzada de forma correcta contra el dominio ${DOMAIN_CERT}"

else
letc_COD=10
letc_EER="#-Error - Cert no ha funcionado correctamente [ ${letc_OUT} ] en dominio ${DOMAIN_CERT} ##"
letc_OUT=$(expr  ${letc_OUT} + ${letc_COD})
letc_ERR="${letc_ERR}${letc_EER}"


#--END_IF_[04] - [ CERT RUNNED CORRECTLY ] ---------------------------------------------
fi
else

letc_COD=20
letc_EER="#-Error - Cert ya existe en el sistema [ ${letc_OUT} ] en dominio ${DOMAIN_CERT} ##"
letc_OUT=$(expr  ${letc_OUT} + ${letc_COD})
letc_ERR="${letc_ERR}${letc_EER}"


#--END_IF_[03] - [ CERT ALREADY EXIST ] ---------------------------------------------
fi
else

letc_COD=40
letc_EER="#-No se ha detectado cert instalado en el servidor ##"
letc_OUT=$(expr  ${letc_OUT} + ${letc_COD})
letc_ERR="${letc_ERR}${letc_EER}"

#--STA_IF_[02] - [ CERT INSTALLED ] ---------------------------------------------
fi

letc_MSG="-[${FUNC}] ${letc_MSG_CLEAN}"

#-SHOW es una varible general para activar o desactivar mensajes
if [ ${SHOW} -a  "${letc_OUT}" != "0" ] ; then
letc_ERR="#+${letc_FUN}::##${letc_ERR}"
footer_error "${letc_NFO}" "${letc_ERR}"
fi


fi
}
