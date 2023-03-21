#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- wscsl_multi_lang
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wccs (cluster) - wscs_nocluster (server)
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Virtual server en arquitectura Brqx en todos los idioma
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wscdl_multi_lang [ID] -- Crea el VS multi lenguage para el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscsl_multi_lang()
{
VER="0.0.3"
DEP="01"		# Depth script

wscsl_multi_lang_FUN="wscsl_multi_lang"
wscsl_multi_lang_NFO="Crea un VS SUBdominio multi idioma en arquitectura Brqx [$VER]($DEP)@${QP}"
wscsl_multi_lang_FMT="wscsl_multi_lang LINE SITE_LANG SITE_DOMAIN"
wscsl_multi_lang_EXA="wscsl_multi_lang espalillos"

wscsl_multi_lang_OUT=0
wscsl_multi_lang_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscsl_multi_lang_NFO}" "${wscsl_multi_lang_FMT}" "${wscsl_multi_lang_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_gscreate
wscsl_multi_lang_OUT=$(expr  ${wscsl_multi_lang_OUT} + ${ws_gscreate_OUT})
wscsl_multi_lang_ERR="${wscsl_multi_lang_ERR}${ws_gscreate_ERR}"

if [ "${ws_gscreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF DOMAIN_EXIST] ----------------------------------------------


#-Dual check for Multi language
if [ "${MODE}" != "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANGUAGE ] -------------------------------------------

wscs_nocluster ${IDSITE}  

wscsl_multi_lang_OUT=$(expr  ${wscsl_multi_lang_OUT} + ${wscs_nocluster_OUT})
wscsl_multi_lang_ERR="${wscsl_multi_lang_ERR}${wscs_nocluster_ERR}"

else
#-- ONLY MULTI LANGUAGE SITES

##ws_infoline wscl

for language in AA ES FR IT DE EN RU PT ; do

DOMAIN=$( cat  ${SUBD_LINE} | grep "^${language}="  | head -1  | cut -d "=" -f2 )

if [ "${DOMAIN}" != "" ] ; then
LANGUAGE=$(echo $language |  tr '[:upper:]' '[:lower:]' )

wscr_subdomain ${SUBD_LINE} ${MAIN_LINE}   ${LANGUAGE} ${DOMAIN}

wscsl_multi_lang_OUT=$(expr  ${wscsl_multi_lang_OUT} + ${wscr_subdomain_OUT})
wscsl_multi_lang_ERR="${wscsl_multi_lang_ERR}${wscr_subdomain_ERR}"

fi

done

#- Ahora debe ajustar el site - pENDIENTE De revisar
ws_subdline ${SUBD_LINE} ${MAIN_LINE}
FULL_HOME_FILE="${MAINHOME_PATH}zdom/${DIVISION}/${PROJECT}/z${MAINSITE}_${SITE}"

VS_FILE="/host/${MODE}/${DIVISION}/${PROJECT}/z${MAINSITE}_${SITE}"

chow 	${VS_PATH}	 ${HOME_PATH}	${FULL_HOME_FILE}	"${VS_FILE}*"		

#- Reiniciar servicios
ws_restart_services


#--END_IF_[02] - [IF MULTI LANGUAGE ] -------------------------------------------fi
fi

#--END_IF_[01] - [IF FINDLINE] --------------------------------------------------
fi

if [ "${wscsl_multi_lang_OUT}" != "0" ] ; then
wscsl_multi_lang_ERR="#+${wscsl_multi_lang_FUN}::##${wscsl_multi_lang_ERR}"
footer_error "${wscsl_multi_lang_NFO}" "${wscsl_multi_lang_ERR}"
fi


fi
}
