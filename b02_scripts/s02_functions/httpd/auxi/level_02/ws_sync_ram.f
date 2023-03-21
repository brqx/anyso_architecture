#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ws_sync_ram
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_sync_ram_folder
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
#E ws_sync_ram cache home -- Crea las caches para los parametros
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_sync_ram()
{
VER="0.0.6"

ws_sync_ram_FUN="ws_sync_ram"
ws_sync_ram_NFO="Genera estructura de cache para multiples webservers [$VER]($DEP) @${QP}"
ws_sync_ram_FMT="ws_sync_ram CACHE_PATH HOME_PATH"
ws_sync_ram_EXA="ws_sync_ram CACHE_PATH HOME_PATH"

F=${ws_sync_ram_FUN}

ws_sync_ram_OUT=0
ws_sync_ram_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_domain_NFO}" "${webserv_drop_domain_FMT}" "${webserv_drop_domain_EXA}"
#--------------------------------------------------------------------------------
else

##echo "${F}::Antes de mirar el tipo de almacenamiento : ${MAIN_STORAGE_TYPE}"

if [ "${MAIN_STORAGE_TYPE}" == "RAM" ] ; then 
 
#-Si es memoria ram debera sincronizar
#-En este punto siempre va a existir la carpeta, entonces para ver si tiene contenido

ws_sync_ram_folder ${OLD_LAN_FILES_PATH} ${LAN_FILES_PATH}
ws_sync_ram_OUT=$(expr  ${ws_sync_ram_OUT} + ${ws_sync_ram_folder_OUT})
ws_sync_ram_ERR="${ws_sync_ram_ERR}${ws_sync_ram_folder_ERR}"


ws_sync_ram_folder ${OLD_LAN_CACHE_PATH} ${LAN_CACHE_PATH}
ws_sync_ram_OUT=$(expr  ${ws_sync_ram_OUT} + ${ws_sync_ram_folder_OUT})
ws_sync_ram_ERR="${ws_sync_ram_ERR}${ws_sync_ram_folder_ERR}"


fi


fi
}
