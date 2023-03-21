#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_subdomain_settings
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea estructura Site Drupal Settings para subdominio
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
#E dru_subdomain_settings LINE PATH LANG -- Crea estructura Site Drupal Settings para subdominio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_subdomain_settings()
{
VER="0.0.6"

dru_subdomain_settings_FUN="dru_subdomain_settings"
dru_subdomain_settings_NFO="Crea estructura Site Drupal Settings para subdominio [$VER]($DEP) @${QP}"
dru_subdomain_settings_FMT="dru_subdomain_settings LINE [SITE_LANG] [SITE_DOMAIN]"
dru_subdomain_settings_EXA="dru_subdomain_settings LINE es"

dru_subdomain_settings_OUT=0
dru_subdomain_settings_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_subdomain_settings_NFO}" "${dru_subdomain_settings_FMT}" "${dru_subdomain_settings_EXA}"
#--------------------------------------------------------------------------------
else

SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

TEMPLATE_NAME="subsettings_${DRUPAL_VERSION}.tplt"
TEMPLATE_PATH="/host/tplt/drupal/"

WS_TYPE=drupal

LOGS_PATH="${LAN_LOGS_PATH}/${WS_TYPE}"


FULL_VS_DOMAIN_DEFAULT_PATH="${LAN_HOME_PATH}sites/default/"

FULL_VS_DOMAIN_FILE_PATH="${FULL_VS_DOMAIN_DEFAULT_PATH}settings.php"

FULL_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"

TEMPLATE_DOMAIN=dominio_template
TEMPLATE_DCLEAN=dominio_clean
TEMPLATE_ESCAPED_DOMAIN=escaped_dominio
TEMPLATE_MODE=modo_template
TEMPLATE_MODEVS=modo_vstemplate
TEMPLATE_DIVISION=division_template
TEMPLATE_PROJECT=proyecto_template
TEMPLATE_SUBPROJECT=subyecto_template
TEMPLATE_SITE=site_template
TEMPLATE_SUBSITE=site_subtemplate

#-Template Main Site
TEMPLATE_MITE=mite_template
TEMPLATE_ENV=entorno_template
TEMPLATE_VER=version_template
TEMPLATE_LANG=idioma_template
TEMPLATE_IP=ip_template
TEMPLATE_REP=rep_template


#- Copiamos la plantilla en el archivo

#Create config VS PATH

mkc ${LAN_LOGS_PATH} ${LAN_HOME_PATH}   


if [ -f ${FULL_VS_DOMAIN_FILE_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_FILE_PATH}
fi

if [ "${DRUPAL_VERSION}" == "80" ]	; then 
#-Compiamos el fichero por defecto si es 80
cp -f ${FULL_DEFAULT_TEMPLATE_PATH} ${FULL_VS_DOMAIN_DEFAULT_FILE_PATH}_ideal  2> /dev/null

fi


if [ "${DRUPAL_VERSION}" == "50" -o "${DRUPAL_VERSION}" == "70" ]	; then 

mkc ${FULL_VS_DOMAIN_DEFAULT_PATH}

cp -f ${FULL_TEMPLATE_PATH} ${FULL_VS_DOMAIN_FILE_PATH}  2> /dev/null

#-DRUPAL STRUCTURE

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"       	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_ESCAPED_DOMAIN}/${ESCAPED_DOMAIN}/g"       ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_DIVISION}/${DIVISION}/g"   	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_PROJECT}/${MAINPROJECT}/g"     ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_SUBPROJECT}/${PROJECT}/g"     	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_ENV}/${ENVIRONMENT}/g"     	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_VER}/${DRUPAL_VERSION}/g"  	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_SUBSITE}/${SITE}/g"            ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_SITE}/${MAINSITE}/g"           ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_LANG}/${LANGUAGE}/g"       	${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_REP}/${REPLICATION_TAG}/g" 	${FULL_VS_DOMAIN_FILE_PATH}

fi

fi
}
