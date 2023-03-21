#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ha_stop_proxy (alias hap)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#--
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Detiene servicios en servidor en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T stop proxy ha
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ha_stop_proxy -- Detiene proxy inverso
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ha_stop_proxy()
{
VER="0.0.5"

ha_stop_proxy_fun="ha_stop_proxy"
ha_stop_proxy_NFO="Detiene los proxy inversos del servidor [$VER]"
ha_stop_proxy_FMT="ha_stop_proxy LINE"
ha_stop_proxy_EXA="ha_stop_proxy LINE"

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ha_stop_proxy_NFO}" "${ha_stop_proxy_FMT}" "${ha_stop_proxy_EXA}"
#--------------------------------------------------------------------------------
else


SERVER_NFO_FILE=/brqi/zzc/server.nfo
NODE_TYPE=$( cat  ${SERVER_NFO_FILE} | grep -v "^#" | grep "^NODE_TYPE="   | head -1  | cut -d "=" -f2    )

if [ "${NODE_TYPE}" == "standalone_server" ] ; then


service haproxy_50 stop       &> /dev/null
ha_stop_50=$?

service haproxy_51 stop				&> /dev/null
ha_stop_51=$?

service haproxy_52 stop				&> /dev/null
ha_stop_52=$?

service haproxy_53 stop       &> /dev/null
ha_stop_53=$?

service haproxy_54 stop       &> /dev/null
ha_stop_54=$?

service haproxy_55 stop       &> /dev/null
ha_stop_55=$?

service haproxy_56 stop				&> /dev/null
ha_stop_56=$?

service haproxy_57 stop       &> /dev/null
ha_stop_57=$?

service haproxy_58 stop       &> /dev/null
ha_stop_58=$?

service haproxy_59 stop				&> /dev/null
ha_stop_59=$?

service haproxy_60 stop       &> /dev/null
ha_stop_60=$?

service haproxy_61 stop       &> /dev/null
ha_stop_61=$?

service haproxy_62 stop       &> /dev/null
ha_stop_62=$?

service haproxy_63 stop       &> /dev/null
ha_stop_63=$?

#-Servicio de test
service haproxy_tt stop				&> /dev/null
ha_stop_tt=$?

#-Funcion general
service haproxy_01 stop				&> /dev/null
ha_stop_01=$?

service haproxy_ssl_01 stop       &> /dev/null
ha_stop_ssl_01=$?

fi

fi
}
