#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2019
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ws_cache_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Estrutura Drupal Cache para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [cache] [home]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_cache_create cache home -- Crea las caches para los parametros
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_cache_create()
{
VER="0.0.6"

ws_cache_create_FUN="ws_cache_create"
ws_cache_create_NFO="Genera estructura de cache para multiples webservers [$VER]($DEP) @${QP}"
ws_cache_create_FMT="ws_cache_create CACHE_PATH HOME_PATH"
ws_cache_create_EXA="ws_cache_create CACHE_PATH HOME_PATH"


ws_cache_create_OUT=0
ws_cache_create_ERR=""

if [ "${1}" == "-?"   ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_domain_NFO}" "${webserv_drop_domain_FMT}" "${webserv_drop_domain_EXA}"
#--------------------------------------------------------------------------------
else

#-Cache for Lighttpd - Removed

FIRAM_FOLDER_PATH="${LAN_CACHE_PATH}firam"

#-Cache for Nginx
NCACHE_FOLDER_BASE="${LAN_CACHE_PATH}nginx"

mkc 	${NCACHE_FOLDER_BASE} ${NCACHE_FOLDER_BASE}_www	

#-Creamos la carpeta base por si el almacenamiento es ram
#mkc 	${OLD_LAN_CACHE_PATH}  ${FIRAM_FOLDER_PATH}

#-Cache For Lighttp Direct
#lnk ${LCACHE_FOLDER_BASE} 		${LAN_HOME_PATH}lcache

#-Cache for Lighttp Port
#lnk ${LCACHE_FOLDER_PORT} 		${LAN_HOME_PATH}lport

#-Cache for Nginx
lnk ${NCACHE_FOLDER_BASE} 		${LAN_HOME_PATH}cginx

#-Cache for Nginx
lnk ${NCACHE_FOLDER_BASE}_www 	${LAN_HOME_PATH}cginx_www


#Disabled files and firam
# lnk ${RAM_LAN_FILES_PATH}   ${LAN_HOME_PATH}firam

# lnk ${MAIN_LAN_FILES_PATH}       ${LAN_HOME_PATH}files



fi
}
