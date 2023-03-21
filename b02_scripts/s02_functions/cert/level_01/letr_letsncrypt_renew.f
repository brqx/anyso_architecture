#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- letr
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#-------------------------------------------------------------------
#-- certbot - openssl
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Renovacion certificado Letsncrypt
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create ssl cert
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P DOMAIN 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E letr brqx.es 	-- Renueva certificado para el dominio 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F 
#-------------------------------------------------------------------
letr()
{
VER="0.0.1"

letr_FUN="letr"
letr_NFO="Generacion de certificados SSL con LetsEncrypt [$VER]"
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

CERT_SW=$(		which certbot 	2> /dev/null		| wc -l )


if [ "${CERT_SW}" 			== "1" 			] ; then
#--STA_IF_[02] - [ CERT INSTALLED ] ---------------------------------------------

SSL_SW=$(   which openssl   2> /dev/null    | wc -l )

if [ "${SSL_SW}"       == "1"      ] ; then
#--STA_IF_[03] - [ OPENSSL INSTALLED ] ---------------------------------------------

LETS_PATH=/etc/letsencrypt/live/${DOMAIN_CERT}

if [ -d ${LETS_PATH} ] ; then
#--STA_IF_[04] - [ LETENCRYPT PATH EXIST ] ---------------------------------------------

# Jan  7 11:44:14 2018 GMT
afterSTR=$(openssl x509 -noout -dates -in /etc/letsencrypt/live/${DOMAIN_CERT}/cert.pem  | grep After | cut -d "=" -f2 )

monSTR=$(echo ${afterSTR} | cut -d " " -f1 |  tr "[A-Z]" "[a-z]" )
daySTR=$(echo ${afterSTR} | cut -d " " -f2                       ) 

realMONTH=$(  date '+%b'  )
realDAY=$(    date '+%d'  )

#Renovamos , al menos ,  5 dias antes
five_less=$(expr ${daySTR} - ${realDAY} 2> /dev/null )


if [ "${monSTR}" == "${realMONTH}" -a "${five_less}" -lt 5 ] ; then
#--STA_IF_[05] - [ UPDATE PERIOD ] ---------------------------------------------
#same_month and 5 days less

#-1.Parar Haproxy SSL

service haproxy_ssl_01 stop

#-2.Renovar certificados

echo "Renewing ${DOMAIN_CERT}"
certbot renew 2> /dev/null 
letr_COD=$?  
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})


if [ "${letr_OUT}"       == "0"      ] ; then
#--STA_IF_[06] - [ CERT RENEWED CORRECTLY ] ---------------------------------------------

letr_MSG_CLEAN="LetScrypt Cert Renew_OK"
letr_TXT="-[${FUNC}] Orden cert lanzada de forma correcta contra el dominio ${DOMAIN_CERT}"

# Ahora hay que copiarlo al haproxy

#Lo copiamos a haproxy
CLEAN_DOMAIN=$(echo ${DOMAIN_CERT} | tr "." "_" )
cat /etc/letsencrypt/live/${DOMAIN_CERT}/fullchain.pem /etc/letsencrypt/live/${DOMAIN_CERT}/privkey.pem >  ${CLEAN_DOMAIN}.pem

else
letr_COD=10
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_EER="#-Error - Cert no ha funcionado correctamente [ ${letr_OUT} ] en dominio ${DOMAIN_CERT} ##"
letr_ERR="${letr_ERR}${letr_EER}"

#--END_IF_[06] - [ CERT RENEWED CORRECTLY ] ---------------------------------------------
fi

#-3.Iniciar Haproxy SSL

service haproxy_ssl_01 start

else

letr_COD=20
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_EER="#-Error - Cert no esta en el periodo para renovar [cod: ${letr_OUT} - month: ${monSTR} - days : ${five_less} ] para el dominio ${DOMAIN_CERT} ##"
letr_ERR="${letr_ERR}${letr_EER}"

#--END_IF_[05] - [ UPDATE PERIOD ] ---------------------------------------------
fi
else

letr_COD=30
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_EER="#-Error - Cert no existe en el sistema [ ${letr_OUT} ] para el dominio ${DOMAIN_CERT} ##"
letr_ERR="${letr_ERR}${letr_EER}"

#--END_IF_[04] - [ LETENCRYPT PATH EXIST] ---------------------------------------------
fi
else

letr_COD=40
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_EER="#-Error - Openssl no existe en el sistema [ ${letr_OUT} ]  ##"
letr_ERR="${letr_ERR}${letr_EER}"

#--END_IF_[03] - [ OPENSSL INSTALLEDT ] ---------------------------------------------
fi
else

letr_COD=50
letr_EER="#-No se ha detectado certbot instalado en el servidor ##"
letr_OUT=$(expr  ${letr_OUT} + ${letr_COD})
letr_ERR="${letr_ERR}${letr_EER}"

#--STA_IF_[02] - [ CERT INSTALLED ] ---------------------------------------------
fi

letr_MSG="-[${FUNC}] ${letr_MSG_CLEAN}"

#-SHOW es una varible general para activar o desactivar mensajes
if [ ${SHOW} -a  "${letr_OUT}" != "0" ] ; then
letr_ERR="#+${letr_FUN}::##${letr_ERR}"
footer_error "${letr_NFO}" "${letr_ERR}"
fi


fi
}
