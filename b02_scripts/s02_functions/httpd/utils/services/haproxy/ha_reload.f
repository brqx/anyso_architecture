#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ha_reload_proxy (alias har)
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
#T reload services haproxy proxy
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ha_reload_proxy -- ReInicia servicios haproxy
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ha_reload_proxy()
{
VER="0.0.5"

ha_reload_proxy_FUN="ha_reload_proxy"
ha_reload_proxy_NFO="ReInicia los proxy inversodel servidor [$VER]"
ha_reload_proxy_FMT="ha_reload_proxy LINE"
ha_reload_proxy_EXA="ha_reload_proxy LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ha_reload_proxy_NFO}" "${ha_reload_proxy_FMT}" "${ha_reload_proxy_EXA}"
#--------------------------------------------------------------------------------
else

#-Hay que considerar el tipo de servicio haproxy : standalone_server|proxy_server|proxy_node


SERVER_NFO_FILE=/brqi/zzc/server.nfo
NODE_TYPE=$(  cat  ${SERVER_NFO_FILE} | grep -v "^#" | grep "^NODE_TYPE="   | head -1   | cut -d "=" -f2    )

if [ "${NODE_TYPE}" == "standalone_server" ] ; then

service haproxy_50 reload				&> /dev/null
ha_reload_50_OUT=$?

service haproxy_51 reload				&> /dev/null
ha_reload_51_OUT=$?

service haproxy_52 reload        &> /dev/null
ha_reload_52_OUT=$?

service haproxy_53 reload        &> /dev/null
ha_reload_53_OUT=$?

service haproxy_54 reload        &> /dev/null
ha_reload_54_OUT=$?

service haproxy_55 reload        &> /dev/null
ha_reload_55_OUT=$?

service haproxy_56 reload        &> /dev/null
ha_reload_56_OUT=$?

service haproxy_57 reload				&> /dev/null
ha_reload_57_OUT=$?

service haproxy_58 reload        &> /dev/null
ha_reload_58_OUT=$?

service haproxy_59 reload				&> /dev/null
ha_reload_59_OUT=$?

service haproxy_60 reload				&> /dev/null
ha_reload_0_OUT=$?

service haproxy_61 reload				&> /dev/null
ha_reload_61_OUT=$?

service haproxy_62 reload        &> /dev/null
ha_reload_62_OUT=$?

service haproxy_63 reload        &> /dev/null
ha_reload_63_OUT=$?


service haproxy_tt reload				&> /dev/null
ha_reload_tt_OUT=$?

service haproxy_01 reload				&> /dev/null
ha_reload_01_OUT=$?

#SSL
service haproxy_ssl_01 reload        &> /dev/null
ha_reload_ssl_01_OUT=$?

fi


fi
}
