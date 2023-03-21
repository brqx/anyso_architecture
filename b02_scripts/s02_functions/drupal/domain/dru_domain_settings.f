#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_settings_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Estrutura Drupal Settings para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create site drupal settings
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E dru_domain_settings LINE fr -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_domain_settings()
{
VER="0.0.5"

dru_domain_settings_FUN="dru_domain_settings"
dru_domain_settings_NFO="Crea estructura Site Drupal Settings [$VER]($DEP) @${QP}"
dru_domain_settings_FMT="dru_domain_settings LINE [SITE_LANG] [SITE_DOMAIN]"
dru_domain_settings_EXA="dru_domain_settings LINE es"

dru_domain_settings_OUT=0
dru_domain_settings_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_domain_settings_NFO}" "${dru_domain_settings_FMT}" "${dru_domain_settings_EXA}"
#--------------------------------------------------------------------------------

else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

TEMPLATE_NAME="settings_${DRUPAL_VERSION}.tplt"

DEFAULT_TEMPLATE_NAME="default.settings.php"

TEMPLATE_PATH="/host/tplt/drupal/"

WS_TYPE=drupal

LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}"
HOME_PATH="${HOME_PATH}${LANGUAGE}/"

FULL_VS_DOMAIN_DEFAULT_PATH="${HOME_PATH}sites/default/"

FULL_VS_DOMAIN_FILE_PATH="${FULL_VS_DOMAIN_DEFAULT_PATH}settings.php"
FULL_VS_DOMAIN_DEFAULT_FILE_PATH="${FULL_VS_DOMAIN_DEFAULT_PATH}default.settings.php"

FULL_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"
FULL_DEFAULT_TEMPLATE_PATH="${TEMPLATE_PATH}${DEFAULT_TEMPLATE_NAME}"


TEMPLATE_DOMAIN=dominio_template
TEMPLATE_ESCAPED_DOMAIN=escaped_dominio
TEMPLATE_DCLEAN=dominio_clean
TEMPLATE_MODE=modo_template
TEMPLATE_MODEVS=modo_vstemplate
TEMPLATE_DIVISION=division_template
TEMPLATE_PROJECT=proyecto_template
TEMPLATE_SITE=site_template
TEMPLATE_ENV=entorno_template
TEMPLATE_VER=version_template
TEMPLATE_LANG=idioma_template
TEMPLATE_IP=ip_template
TEMPLATE_REP=rep_template


#- Copiamos la plantilla en el archivo

#Create config VS PATH

mkc ${LOGS_PATH} ${HOME_PATH}	


if [ -f ${FULL_VS_DOMAIN_FILE_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_FILE_PATH}
fi


if [ "${DRUPAL_VERSION}" == "80" ]	; then 
#-Compiamos el fichero por defecto si es 80
echo "Drupal 80"
cp -f ${FULL_DEFAULT_TEMPLATE_PATH} ${FULL_VS_DOMAIN_DEFAULT_FILE_PATH}_ideal  2> /dev/null
#cp -f ${FULL_DEFAULT_TEMPLATE_PATH} ${FULL_VS_DOMAIN_FILE_PATH}  2> /dev/null

fi

if [ "${DRUPAL_VERSION}" == "50" -o "${DRUPAL_VERSION}" == "70" ]	; then 

mkc ${FULL_VS_DOMAIN_DEFAULT_PATH}


#-Para las demas versiones podemos copiar el fichero de plantilla y hacer cambios
cp -f ${FULL_TEMPLATE_PATH} ${FULL_VS_DOMAIN_FILE_PATH}  2> /dev/null

#-DRUPAL STRUCTURE

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"       ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_ESCAPED_DOMAIN}/${ESCAPED_DOMAIN}/g"       ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_DIVISION}/${DIVISION}/g"   ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_PROJECT}/${PROJECT}/g"     ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_ENV}/${ENVIRONMENT}/g"     ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_VER}/${DRUPAL_VERSION}/g"  ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_SITE}/${SITE}/g"           ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_LANG}/${LANGUAGE}/g"       ${FULL_VS_DOMAIN_FILE_PATH}

sed -i "s/${TEMPLATE_REP}/${REPLICATION_TAG}/g" ${FULL_VS_DOMAIN_FILE_PATH}

fi

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
