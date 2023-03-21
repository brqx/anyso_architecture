#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- wsdsl_multi_lang
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wcds (cluster) - wsds_nocluster (server)
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS Subdomain multi lang en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T drop virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID SUBD_ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wscdl_multi_lang ID SUBD_ID -- Borra el VS multi lenguage para el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdsl_multi_lang()
{
VER="0.0.4"
DEP="01"		# Depth script

wsdsl_multi_lang_FUN="wsdsl_multi_lang"
wsdsl_multi_lang_NFO="Elimina un VS subdominio multi idioma [$VER]($DEP)@${QP}"
wsdsl_multi_lang_FMT="wsdsl_multi_lang LINE SITE_LANG SITE_DOMAIN"
wsdsl_multi_lang_EXA="wsdsl_multi_lang espalillos"

wsdsl_multi_lang_OUT=0
wsdsl_multi_lang_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdsl_multi_lang_NFO}" "${wsdsl_multi_lang_FMT}" "${wsdsl_multi_lang_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_gsdrop
wsdsl_multi_lang_OUT=$(expr  ${wsdsl_multi_lang_OUT} + ${ws_gsdrop_OUT})
wsdsl_multi_lang_ERR="${wsdsl_multi_lang_ERR}${ws_gsdrop_ERR}"

if [ "${ws_gsdrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF DOMAIN_EXIST] ----------------------------------------------

#-Dual check for Multi language
if [ "${MODE}" != "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------

wsds_nocluster ${IDSITE} 

wsdsl_multi_lang_OUT=$(expr  ${wsdsl_multi_lang_OUT} + ${wsds_nocluster_OUT})
wsdsl_multi_lang_ERR="${wsdsl_multi_lang_ERR}${wsds_nocluster_ERR}"


else
#-- ONLY MULTI LANGUAGE SITES

for language in AA ES FR IT DE EN RU PT ; do

DOMAIN=$(         cat  ${SUBD_LINE} | grep "^${language}="  | head -1  | cut -d "=" -f2                       )

if [ "${DOMAIN}" != "" ] ; then
LANGUAGE=$(echo $language |  tr '[:upper:]' '[:lower:]' )

wsdr_subdomain ${SUBD_LINE} ${MAIN_LINE}   ${LANGUAGE} ${DOMAIN}

wsdsl_multi_lang_OUT=$(expr  ${wsdsl_multi_lang_OUT} + ${wsdr_subdomain_OUT})
wsdsl_multi_lang_ERR="${wsdsl_multi_lang_ERR}${wsdr_subdomain_ERR}"


fi

done

#- Ahora debe borrar el site
ws_subdline ${SUBD_LINE} ${MAIN_LINE}

VS_FILE="/host/${MODE}/${DIVISION}/${PROJECT}/z${MAINPROJECT}_${MAINSITE}_${SITE}"
LOGS_FILE="/logs/${MODE}/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/"
FINAL_HOME_PATH="${MAINHOME_PATH}zdom/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/"

rmrf  ${VS_PATH}	${HOME_PATH}	${LOGS_PATH}
rmf "${VS_FILE}*"

#--END_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------
fi

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

if [ "${wsdsl_multi_lang_OUT}" != "0" ] ; then
wsdsl_multi_lang_ERR="#+${wsdsl_multi_lang_FUN}::##${wsdsl_multi_lang_ERR}"
footer_error "${wsdsl_multi_lang_NFO}" "${wsdsl_multi_lang_ERR}"
fi

fi
}
