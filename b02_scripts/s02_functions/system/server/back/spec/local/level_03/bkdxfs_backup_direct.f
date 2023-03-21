#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- bkdxfs
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
bkdxfs()
{
VER="0.0.2"

bkdxfs_FUN="bkdxfs"
bkdxfs_NFO="Sincroniza contenido desde memoria ram a un soport ssd [$VER]($DEP) @${QP}"
bkdxfs_FMT="bkdxfs [PATH]"
bkdxfs_EXA="bkdxfs --> Sync current folder if is SSD folder"

bkdxfs_OUT=0
bkdxfs_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${bkdxfs_NFO}" "${bkdxfs_FMT}" "${bkdxfs_EXA}"
#--------------------------------------------------------------------------------
else
PATH_PASSED=${1}


#-Aqui implementamos el primer caso
#
#-1.Se lanza desde el path de un site
#--a.Obtener los datos del site en base al path

ws_getpathline ${PATH_PASSED}

ws_getdomainline_OUT=$(expr  ${ws_getdomainline_OUT} + ${ws_getpathline_OUT})
ws_getdomainline_ERR="${ws_getdomainline_ERR}${ws_ckidsite_ERR}"

if [ "${ws_ckidsite_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

#-Quiero hacer un backup de sphinx.dbrqx.com (DOMAIN - PROJECT - DIVISION - SITE) --> SITE_PATH


# /zback/spec/${BK_TYPE}/${BK_STRATEGY}/${BK_SUBTYPE}/z${SERVER_LETTER}/
# ---- ${SITE_PATH}/${CLEAN_DOMAIN}/${SITE_VERSION}/t${YEAR_BK}/${MONTH_LETTER}_${MONTH_NUMBER}
# /zback/spec/fs/mm/drup/zd/
# ---- arq/comandos/sphinx/sphinx_dbrqx_com/v_0_0_1/t2016/ago_08/

#-2.Se lanza desde otra funcion con los datos ya del site

#-Aqui se supone que ya tenemos los datos del dominio o subdominio

#-Backup Local Path - Igual no es necesaria y se puede usar la otra
bkxfs ${PATH_SITE}
bkdxfs_OUT=$(expr  ${bkdxfs_OUT} + ${bkx_OUT})
bkdxfs_ERR="${bkdxfs_ERR}${bkx_ERR}"

fi

if [ "${bkdxfs_OUT}" != "0" ] ; then
bkdxfs="+${bkdxfs_FUN}::##${bkdxfs_ERR}"
footer_error "${bkdxfs_ERR}"
fi


fi

}
