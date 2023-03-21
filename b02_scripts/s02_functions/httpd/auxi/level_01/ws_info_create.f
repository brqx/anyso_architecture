#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ws_info_create
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
#E ws_info_create cache home -- Crea las caches para los parametros
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_info_create()
{
VER="0.0.7"

ws_info_create_FUN="ws_info_create"
ws_info_create_NFO="Genera estructura de cache para multiples webservers [$VER]($DEP) @${QP}"
ws_info_create_FMT="ws_info_create CACHE_PATH HOME_PATH"
ws_info_create_EXA="ws_info_create CACHE_PATH HOME_PATH"


ws_info_create_OUT=0
ws_info_create_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_domain_NFO}" "${webserv_drop_domain_FMT}" "${webserv_drop_domain_EXA}"
#--------------------------------------------------------------------------------
else

if [ "${PRODUCT_VERSION}" == "" ] ; then
PRODUCT_VERSION="50"
fi

#Aqui si es un dominio tenemos el problema ya que lo va a buscar al anagrama del dominio
# /brqx/pers/drupal/v50/phpfiles/ser/kb/info.php
# Solucion puntual con aa pero require hacer el link
FOLDER_PHP_BASE="/brqx/pers/${MAIN_PRODUCT}/v${PRODUCT_VERSION}/phpfiles/ser/aa/"

if [ "${PRODUCT}" == "drupal" -o  "${PRODUCT}" == "magento19"  -o "${PRODUCT}" == "magento21" -o "${PRODUCT}" == "magento22" ] ; then
  if [ "${VARIANT}" != "image_cache" ] ; then

lnk ${FOLDER_PHP_BASE}server.php 	${LAN_HOME_PATH}server.php  

lnk ${FOLDER_PHP_BASE}info.php 		${LAN_HOME_PATH}info.php

lnk ${FOLDER_PHP_BASE}time.php 		${LAN_HOME_PATH}time.php

lnk ${FOLDER_PHP_BASE}rotate.php 	${LAN_HOME_PATH}rotate.php
  fi
fi

#-Error pages link

lnk /host/page/error 			${LAN_HOME_PATH}ErrorPages

fi
}
