#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckstorageline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba los parametros de la linea y actualiza valores por defecto
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check parameters line
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckstorageline  -- Obtiene valores de almacenamiento
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckstorageline()
{
VER="0.1.3"

ws_ckstorageline_OUT=0
ws_ckstorageline_ERR=""
ws_ckstorageline_MSG=""

ws_ckstorageline_FUN="ws_ckstorageline"
ws_ckstorageline_NFO="Obtiene una linea de valores de un fichero de configuracion de almacenamiento [$VER]"
ws_ckstorageline_FMT="ws_ckstorageline"
ws_ckstorageline_EXA="ws_ckstorageline"

F=${ws_ckstorageline_FUN}

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckstorageline_NFO}" "${ws_ckstorageline_FMT}" "${ws_ckstorageline_EXA}"
#--------------------------------------------------------------------------------
else

#-Proxy Change - Node Knowledge action
#-Nueva variante - Opcion de cachear en ram
#-Debe sincronizar el contenido primero. La idea es que la cache pueda estar en mm ram o en SATA

##echo "${F}::Antes de mirar el tipo de almacenamiento : ${MAIN_STORAGE_TYPE}"

RAM_STORAGE_BASE=/zram/
SATA_STORAGE_BASE=/zsata/
SSD_STORAGE_BASE=/zssd/

# 4 veces SSD
#echp "MAIN : ${MAIN_STORAGE_TYPE}"

if    [ "${MAIN_STORAGE_TYPE}" == "SSD" ] ; then
CACHE_STORAGE_BASE=${SSD_STORAGE_BASE}
STORAGE_BASE=${SSD_STORAGE_BASE}
elif  [ "${MAIN_STORAGE_TYPE}" == "RAM" ] ; then
STORAGE_BASE=${RAM_STORAGE_BASE}
CACHE_STORAGE_BASE=${RAM_STORAGE_BASE}
elif  [ "${MAIN_STORAGE_TYPE}" == "SATA" ] ; then
STORAGE_BASE=${SATA_STORAGE_BASE}
CACHE_STORAGE_BASE=${SATA_STORAGE_BASE}
else
CACHE_STORAGE_BASE=/zcache/
STORAGE_BASE=/brqx/
fi

if    [ "${OLD_STORAGE_TYPE}" == "SSD" ] ; then
OLD_CACHE_STORAGE_BASE=/zcache/
OLD_STORAGE_BASE=/zssd/
elif  [ "${OLD_STORAGE_TYPE}" == "SATA" ] ; then
OLD_CACHE_STORAGE_BASE=/zcache/
OLD_STORAGE_BASE=/zsata/
else
OLD_CACHE_STORAGE_BASE=/zcache/
OLD_STORAGE_BASE=/brqx/
fi

# SSD
#echp "MAIN : ${MAIN_STORAGE_TYPE} CACHE ${CACHE_STORAGE_BASE}"


if [ "${ws_ckstorageline_OUT}" != "0" ] ; then
ws_ckstorageline_ERR="# ${ws_ckstorageline_FUN}::##${ws_ckstorageline_ERR}"
footer_error "${ws_ckstorageline_ERR}"
fi


fi
}
