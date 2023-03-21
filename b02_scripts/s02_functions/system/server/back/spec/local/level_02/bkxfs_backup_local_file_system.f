#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkxfs
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Estrutura Drupal Info para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E sxram LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
bkxfs()
{
VER="0.0.2"

bkxfs_FUN="bkxfs"
bkxfs_NFO="Realiza un backup del la ruta actual [$VER]($DEP) @${QP}"
bkxfs_FMT="bkxfs [PATH]"
bkxfs_EXA="bkxfs --> Sync current folder if is SSD folder"

bkxfs_OUT=0
bkxfs_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${bkxfs_NFO}" "${bkxfs_FMT}" "${bkxfs_EXA}"
#--------------------------------------------------------------------------------
else
#-Tenemos dos casos
#-BK_TYPE: fs | ff | db | ch | se | nf

BK_TYPE=$1

if 		[ "${BK_TYPE}" == "" -o "${BK_TYPE}" == "fs" ] ; then 
#-Por defecto hace Backup del File System
BK_TYPE=fs
PATH_PASSED=${PWD}
elif 	[ "${BK_TYPE}" == "ff" ] ; then 
FILES_FOLDER_BASE=${FILES_FOLDER_BASE}/${LANGUAGE}
PATH_PASSED=${FILES_FOLDER_BASE}
elif 	[ "${BK_TYPE}" == "ch" ] ; then 
PATH_PASSED=${CACHE_FOLDER_BASE}
elif	[ "${BK_TYPE}" == "db" ] ; then
echo "Call to DB backup"
#-Debe generar la BD y preparar el path
PATH_PASSED=${DB_PATH_PASSED}
fi

#-Backup Local Path
bkx ${PATH_PASSED}
bkxfs_OUT=$(expr  ${bkxfs_OUT} + ${bkx_OUT})
bkxfs_ERR="${bkxfs_ERR}${bkx_ERR}"


if [ "${bkxfs_OUT}" != "0" ] ; then
bkxfs="+${bkxfs_FUN}::##${bkxfs_ERR}"
footer_error "${bkxfs_ERR}"
fi


fi

}
