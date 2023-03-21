#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ws_template_create
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
#E ws_template_create LINE TEMPLATE_PATH es brqx.es nginx -- Genera plantilla
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_template_create()
{
VER="0.0.9"

ws_template_create_FUN="ws_template_create"
ws_template_create_NFO="Genera ficheros de configuracion en base a plantillas para servidores web en dominios [$VER]"
ws_template_create_FMT="ws_template_create LINE TEMPLATE_PATH [SITE_LANG] [SITE_DOMAIN] {WS_TYPE]"
ws_template_create_EXA="ws_template_create LINE TEMPLATE_PATH es brqx.es nginx"


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_template_create_NFO}" "${ws_template_create_FMT}" "${ws_template_create_EXA}"
#--------------------------------------------------------------------------------
else

FIND_LINE=${1}
INTERNAL_TEMPLATE_PATH=${2}
WS_TYPE=${3}
SITE_LANGUAGE=${4}
SITE_DOMAIN=${5}

ws_getline ${FIND_LINE}

ws_cktemplateports

TEMPLATE_DOMAIN=dominio_template
TEMPLATE_DOBAR=dominio_bartemplate
TEMPLATE_DCLEAN=dominio_clean
TEMPLATE_MODE=modo_template
TEMPLATE_MODEVS=modo_vstemplate
TEMPLATE_DIVISION=division_template
TEMPLATE_PROJECT=proyecto_template
TEMPLATE_SITE=site_template
TEMPLATE_PRODUCT=producto_template
TEMPLATE_VERSION=version_template

TEMPLATE_LANG=idioma_template
TEMPLATE_IP=ip_template
TEMPLATE_PORT=puerto_template

TEMPLATE_PORT_01_SSL=puerto_temssl_01
TEMPLATE_PORT_02_SSL=puerto_temssl_02
TEMPLATE_PORT_03_SSL=puerto_temssl_03

TEMPLATE_SOCK=servidor_socket_template
TEMPLATE_FILEPDO=servidor_pdo_template
TEMPLATE_PHPPDO=php_pdo_version_template
TEMPLATE_WSTYPE=wstype_template

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"           ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_DOBAR}/${DOMAINBAR}/g"         ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_DCLEAN}/${CLEAN_DOMAIN}/g"     ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_MODE}/${MODE}/g"               ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_MODEVS}/${MODEVS}/g"           ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_DIVISION}/${DIVISION}/g"       ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PROJECT}/${PROJECT}/g"         ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_SITE}/${SITE}/g"               ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PRODUCT}/${PRODUCT}/g"         ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_VERSION}/${PRODUCT_VERSION}/g" ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_LANG}/${LANGUAGE}/g"           ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_IP}/${IP_SERVER}/g"            ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT}/${PORT_SERVER}/g"        ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_01_SSL}/${PORT_SERSSL_01}/g"  ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_02_SSL}/${PORT_SERSSL_02}/g"  ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PORT_03_SSL}/${PORT_SERSSL_03}/g"  ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_SOCK}/${SOCK_SERVER}/g"        ${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_FILEPDO}/${FILEPDO_SERVER}/g" 	${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_PHPPDO}/${PHPVERSIONPDO_SERVER}/g" 	${INTERNAL_TEMPLATE_PATH}

sed -i "s/${TEMPLATE_WSTYPE}/${WS_TYPE}/g" 			${INTERNAL_TEMPLATE_PATH}

fi
}
