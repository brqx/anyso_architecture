#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ws_subtemplate_update
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- ws_getline - ws_cktemplateports
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
#E ws_subtemplate_update LINE TEMPLATE_PATH es brqx.es nginx -- Genera plantilla
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_subtemplate_update()
{
VER="0.0.9"

ws_subtemplate_update_FUN="ws_subtemplate_update"
ws_subtemplate_update_NFO="Actualiza ficheros de configuracion en base a plantillas para servidores web en subdominios [$VER]"
ws_subtemplate_update_FMT="ws_subtemplate_update LINES TEMPLATE_PATH [SITE_LANG] [SITE_DOMAIN] {WS_TYPE]"
ws_subtemplate_update_EXA="ws_subtemplate_update LINES TEMPLATE_PATH es main "

ws_subtemplate_update_OUT=0
ws_subtemplate_update_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_subtemplate_update_NFO}" "${ws_subtemplate_update_FMT}" "${ws_subtemplate_update_EXA}"
#--------------------------------------------------------------------------------
else

SUBD_LINE=${1}
MAIN_LINE=${2}
INTERNAL_TEMPLATE_PATH=${3}
WS_TYPE=${4}
SITE_LANGUAGE=${5}


ws_subdline ${SUBD_LINE} ${MAIN_LINE}
ws_subtemplate_update_OUT=$(expr  ${ws_subtemplate_update_OUT} + ${ws_subdline_OUT})
ws_subtemplate_update_ERR="${ws_subtemplate_update_ERR}${ws_subdline_ERR}"


ws_cktemplateports

TEMPLATE_MODE=modo_template
SUBTEMPLATE_MODE=modo_subtemplate
TEMPLATE_MODEVS=modo_subvstemplate
TEMPLATE_DOMAIN=dominio_subtemplate
TEMPLATE_DOBAR=dominio_barsubtemplate

TEMPLATE_DCLEAN=dominio_subclean
TEMPLATE_DOBAR=dominio_bartemplate
TEMPLATE_DIVISION=division_subtemplate
TEMPLATE_PROJECT=proyecto_subtemplate
TEMPLATE_SUBSITE=site_subtemplate
TEMPLATE_SITE=site_template

TEMPLATE_PRODUCT=producto_template
TEMPLATE_VERSION=version_template

TEMPLATE_LANG=idioma_subtemplate
TEMPLATE_PORT=puerto_subtemplate

TEMPLATE_PORT_01_SSL=puerto_temssl_01
TEMPLATE_PORT_02_SSL=puerto_temssl_02
TEMPLATE_PORT_03_SSL=puerto_temssl_03


TEMPLATE_SOCK=servidor_socket_template
TEMPLATE_FILEPDO=servidor_pdo_template
TEMPLATE_PHPPDO=php_pdo_version_template
TEMPLATE_WSTYPE=wstype_template

##echo "Antes de fallar :${WS_TYPE} MAINMODE -${MAINMODE}"

sed -i "s/${TEMPLATE_MODE}/${MAINMODE}/g"           ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} MODE -${MODE}"

sed -i "s/${SUBTEMPLATE_MODE}/${MODE}/g"            ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} DOMAINBAR -${DOMAINBAR}"

sed -i "s/${TEMPLATE_DOBAR}/${DOMAINBAR}/g"         ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} DOMAINBAR -${DOMAINBAR}"

sed -i "s/${TEMPLATE_MODEVS}/${MODEVS}/g"           ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} DOMAINBAR -${DOMAINBAR}"

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"           ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} DOMAINBAR -${DOMAINBAR}"

sed -i "s/${TEMPLATE_DOBAR}/${DOMAINBAR}/g"         ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} CLEAN_DOMAIN -${CLEAN_DOMAIN}"

sed -i "s/${TEMPLATE_DCLEAN}/${CLEAN_DOMAIN}/g"     ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} DIVISION -${DIVISION}"

sed -i "s/${TEMPLATE_DIVISION}/${DIVISION}/g"       ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} PROJECT -${PROJECT}"

sed -i "s/${TEMPLATE_PROJECT}/${PROJECT}/g"         ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} SITE -${SITE}"

sed -i "s/${TEMPLATE_SUBSITE}/${SITE}/g"            ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} PRODUCT -${PRODUCT}"

sed -i "s/${TEMPLATE_PRODUCT}/${PRODUCT}/g"            ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} VERSION -${PRODUCT_VERSION}"

sed -i "s/${TEMPLATE_VERSION}/${PRODUCT_VERSION}/g"            ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} MAINSITE -${MAINSITE}"

sed -i "s/${TEMPLATE_SITE}/${MAINSITE}/g"           ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} LANGUAGE -${LANGUAGE}"

sed -i "s/${TEMPLATE_LANG}/${LANGUAGE}/g"           ${INTERNAL_TEMPLATE_PATH}

##echo "Antes de fallar :${WS_TYPE} PORT_SERVER -${PORT_SERVER}"

sed -i "s/${TEMPLATE_PORT}/${PORT_SERVER}/g"        ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_01_SSL}/${PORT_SERSSL_01}/g"  ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_02_SSL}/${PORT_SERSSL_02}/g"  ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_03_SSL}/${PORT_SERSSL_03}/g"  ${INTERNAL_TEMPLATE_PATH}

## echo "Antes de fallar :${WS_TYPE} SOCK_SERVER -${SOCK_SERVER}"

## \/var\/run\/php-fpm\/php-fpm71.sock

##echo sed -i s/${TEMPLATE_SOCK}/${SOCK_SERVER}/g   PATH:     ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_SOCK}/${SOCK_SERVER}/g"        ${INTERNAL_TEMPLATE_PATH}

##echo "Despues de fallar"

sed -i "s/${TEMPLATE_FILEPDO}/${FILEPDO_SERVER}/g" 	${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PHPPDO}/${PHPVERSIONPDO_SERVER}/g" 	${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_WSTYPE}/${WS_TYPE}/g" 			${INTERNAL_TEMPLATE_PATH}
fi
}
