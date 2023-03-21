#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ha_restart_proxy (alias har)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#--
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I ReInicia servicios HaProxy en servidor en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T restart services haproxy proxy
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ha_restart_proxy -- ReInicia servicios haproxy
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ha_restart_proxy()
{
VER="0.0.5"

ha_restart_proxy_FUN="ha_restart_proxy"
ha_restart_proxy_NFO="ReInicia los proxy inversodel servidor [$VER]"
ha_restart_proxy_FMT="ha_restart_proxy LINE"
ha_restart_proxy_EXA="ha_restart_proxy LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ha_restart_proxy_NFO}" "${ha_restart_proxy_FMT}" "${ha_restart_proxy_EXA}"
#--------------------------------------------------------------------------------
else

#-Hay que considerar el tipo de servicio haproxy : standalone_server|proxy_server|proxy_node


SERVER_NFO_FILE=/brqi/zzc/server.nfo
NODE_TYPE=$(  cat  ${SERVER_NFO_FILE} | grep -v "^#" | grep "^NODE_TYPE="   | head -1   | cut -d "=" -f2    )

if [ "${NODE_TYPE}" == "standalone_server" ] ; then

service haproxy_50 restart				&> /dev/null
ha_restart_50_OUT=$?

service haproxy_51 restart				&> /dev/null
ha_restart_51_OUT=$?

service haproxy_52 restart        &> /dev/null
ha_restart_52_OUT=$?

service haproxy_53 restart        &> /dev/null
ha_restart_53_OUT=$?

service haproxy_54 restart        &> /dev/null
ha_restart_54_OUT=$?

service haproxy_55 restart        &> /dev/null
ha_restart_55_OUT=$?

service haproxy_56 restart        &> /dev/null
ha_restart_56_OUT=$?

service haproxy_57 restart				&> /dev/null
ha_restart_57_OUT=$?

service haproxy_58 restart        &> /dev/null
ha_restart_58_OUT=$?

service haproxy_59 restart				&> /dev/null
ha_restart_59_OUT=$?

service haproxy_60 restart				&> /dev/null
ha_restart_0_OUT=$?

service haproxy_61 restart				&> /dev/null
ha_restart_61_OUT=$?

service haproxy_62 restart        &> /dev/null
ha_restart_62_OUT=$?

service haproxy_63 restart        &> /dev/null
ha_restart_63_OUT=$?


service haproxy_tt restart				&> /dev/null
ha_restart_tt_OUT=$?

service haproxy_01 restart				&> /dev/null
ha_restart_01_OUT=$?

#SSL
service haproxy_ssl_01 restart        &> /dev/null
ha_restart_ssl_01_OUT=$?

fi


fi
}
