#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ws_sync_ram_folder_folder
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- sxto - szfr
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
#P ssd ram
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_sync_ram_folder ssd ram -- Realiza sincronismos contra RAM comprobando previamente
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_sync_ram_folder()
{
VER="0.0.6"

ws_sync_ram_folder_FUN="ws_sync_ram_folder"
ws_sync_ram_folder_NFO="Realiza sincronismos contra RAM comprobando previamente [$VER]($DEP) @${QP}"
ws_sync_ram_folder_FMT="ws_sync_ram_folder SRC TAR"
ws_sync_ram_folder_EXA="ws_sync_ram_folder ssd_path ram_path"

F=${ws_sync_ram_folder_FUN}

ws_sync_ram_folder_OUT=0
ws_sync_ram_folder_ERR=""

if [ "${1}" == "-?"  -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_domain_NFO}" "${webserv_drop_domain_FMT}" "${webserv_drop_domain_EXA}"
#--------------------------------------------------------------------------------
else

FOLDER_SRC=${1}
FOLDER_TAR=${2}

HAVE_RAM_CONTENTS=$(ls -1 ${FOLDER_TAR} | wc -l)

if [ "${HAVE_RAM_CONTENTS}" == "0" ] ; then
#No hay contenido en la ram podemos subir
sxto ${FOLDER_SRC} ${FOLDER_SRC}
ws_sync_ram_folder_OUT=$(expr  ${ws_sync_ram_folder_OUT} + ${sxto_OUT})
ws_sync_ram_folder_ERR="${ws_sync_ram_folder_ERR}${sxto_ERR}"
else
#-Hay contenido en ram, vamos a obtenerlo
szfr ${FOLDER_SRC} ${FOLDER_TAR}
ws_sync_ram_folder_OUT=$(expr  ${ws_sync_ram_folder_OUT} + ${szfr_OUT})
ws_sync_ram_folder_ERR="${ws_sync_ram_folder_ERR}${szfr_ERR}"
fi

fi
}
