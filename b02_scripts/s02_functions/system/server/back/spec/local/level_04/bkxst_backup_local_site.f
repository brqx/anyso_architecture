#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkxst
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
bkxst()
{
VER="0.0.2"

bkxst_FUN="bkxst"
bkxst_NFO="Realiza un backup del la ruta actual [$VER]($DEP) @${QP}"
bkxst_FMT="bkxst [PATH]"
bkxst_EXA="bkxst --> Sync current folder if is SSD folder"

bkxst_OUT=0
bkxst_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${bkxst_NFO}" "${bkxst_FMT}" "${bkxst_EXA}"
#--------------------------------------------------------------------------------
else
SITEID=$1
SUBS_ID=${2}


#-Backup local del site. Debe actuar con FS - FF - DB y demas
#-BK_TYPE: fs | ff | db | ch | se | nf

#-Formas de llamarlo:
#-Dominio o id
#-Desde la ruta actual


BK_TYPE=$1

bkxfs


if [ "${bkxst_OUT}" != "0" ] ; then
bkxst="+${bkxst_FUN}::##${bkxst_ERR}"
footer_error "${bkxst_ERR}"
fi


fi

}
