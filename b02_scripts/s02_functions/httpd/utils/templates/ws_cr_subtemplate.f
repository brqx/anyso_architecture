#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ws_subtemplate_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- ws_getline
#-- sed
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera ficheros de configuracion en base a plantillas para servidores web
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T generate setup files template web server
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_subtemplate_create LINE TEMPLATE_PATH es brqx.es nginx -- Genera plantilla
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_subtemplate_create()
{
VER="0.0.5"

ws_subtemplate_create_FUN="ws_subtemplate_create"
ws_subtemplate_create_NFO="Genera ficheros de configuracion en base a plantillas para servidores web en subdominios [$VER]"
ws_subtemplate_create_FMT="ws_subtemplate_create LINE TEMPLATE_PATH [SITE_LANG] [SITE_DOMAIN] {WS_TYPE]"
ws_subtemplate_create_EXA="ws_subtemplate_create LINE TEMPLATE_PATH es brqx.es nginx"

ws_subtemplate_create_OUT=0
ws_subtemplate_create_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_subtemplate_create_NFO}" "${ws_subtemplate_create_FMT}" "${ws_subtemplate_create_EXA}"
#--------------------------------------------------------------------------------
else

MAIN_LINE=${1}
INTERNAL_TEMPLATE_PATH=${2}

ws_mainline ${MAIN_LINE}

TEMPLATE_MODE=modo_template
TEMPLATE_MODEVS=modo_vstemplate
TEMPLATE_DIVISION=division_template
TEMPLATE_PROJECT=proyecto_template
TEMPLATE_SITE=site_template
TEMPLATE_LANG=idioma_template
TEMPLATE_IP=ip_template


sed -i "s/${TEMPLATE_MODE}/${MAINMODE}/g"               ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_MODEVS}/${MAINMODEVS}/g"           ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_DIVISION}/${MAINDIVISION}/g"       ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PROJECT}/${MAINPROJECT}/g"         ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_SITE}/${MAINSITE}/g"               ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_LANG}/${MAINLANGUAGE}/g"           ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_IP}/${IP_SERVER}/g"            	${INTERNAL_TEMPLATE_PATH}

fi
}
