#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ha_start_proxy (alias has)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#--
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Inicia servicios en servidor en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T start services httpd
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ha_start_proxy -- Inicia servicios haproxy en servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ha_start_proxy()
{
VER="0.0.5"

ha_start_proxy_FUN="ha_start_proxy"
ha_start_proxy_NFO="Inicia los proxy inversodel servidor [$VER]"
ha_start_proxy_FMT="ha_start_proxy LINE"
ha_start_proxy_EXA="ha_start_proxy LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ha_start_proxy_NFO}" "${ha_start_proxy_FMT}" "${ha_start_proxy_EXA}"
#--------------------------------------------------------------------------------
else

SERVER_NFO_FILE=/brqi/zzc/server.nfo
NODE_TYPE=$(             cat  ${SERVER_NFO_FILE} | grep -v "^#" | grep "^NODE_TYPE="   | head -1           	| cut -d "=" -f2    )

if [ "${NODE_TYPE}" == "standalone_server" ] ; then

#-Debemos tener una listado de servidores haproxy disponibles

service haproxy_50 start        &> /dev/null
ha_start_50_OUT=$?

service haproxy_51 start				&> /dev/null
ha_start_51_OUT=$?

service haproxy_52 start				&> /dev/null
ha_start_52_OUT=$?

service haproxy_53 start        &> /dev/null
ha_start_53_OUT=$?

service haproxy_54 start        &> /dev/null
ha_start_54_OUT=$?

service haproxy_55 start        &> /dev/null
ha_start_55_OUT=$?

service haproxy_56 start				&> /dev/null
ha_start_56_OUT=$?

service haproxy_57 start        &> /dev/null
ha_start_57_OUT=$?

service haproxy_58 start        &> /dev/null
ha_start_58_OUT=$?

service haproxy_59 start				&> /dev/null
ha_start_59_OUT=$?

service haproxy_60 start        &> /dev/null
ha_start_60_OUT=$?

service haproxy_61 start        &> /dev/null
ha_start_61_OUT=$?

service haproxy_62 start        &> /dev/null
ha_start_62_OUT=$?

service haproxy_63 start        &> /dev/null
ha_start_63_OUT=$?

service haproxy_tt start				&> /dev/null
ha_start_tt_OUT=$?

service haproxy_01 start				&> /dev/null
ha_start_01_OUT=$?

service haproxy_ssl_01 start        &> /dev/null
ha_start_ssl_01_OUT=$?

fi


fi
}
