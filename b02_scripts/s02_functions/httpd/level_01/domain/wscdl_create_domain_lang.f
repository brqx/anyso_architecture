#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- wscdl_multi_lang
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wccd (cluster) - wscd_nocluster (server)
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
wscdl_multi_lang()
{
VER="0.1.0"
DEP="01"		# Depth script

wscdl_multi_lang_FUN="wscdl_multi_lang"
wscdl_multi_lang_NFO="Crea un VS dominio multi idioma cluster en arquitectura Brqx [$VER]($DEP)"
wscdl_multi_lang_FMT="wscdl_multi_lang IDSITE"
wscdl_multi_lang_EXA="wscdl_multi_lang mainwar"

wscdl_multi_lang_OUT=0
wscdl_multi_lang_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscdl_multi_lang_NFO}" "${wscdl_multi_lang_FMT}" "${wscdl_multi_lang_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_gdcreate
wscdl_multi_lang_OUT=$(expr  ${wscdl_multi_lang_OUT} + ${ws_gdcreate_OUT})
wscdl_multi_lang_ERR="${wscdl_multi_lang_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

#-Dual check for Multi language
if [ "${MODE}" != "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANGUAGE ] -------------------------------------------
#-- NO MULTI LANGUAGE SITE - MAYBE CLUSTER OR SERVER SITE

wscd_nocluster ${IDSITE} ${PROJECT_PATH}

else
#-- ONLY MULTI LANGUAGE SITES

#-Aqui habria que obtener la cadena de idiomas de un fichero

PROJECT_LINE=${FIND_LINE}

for language in AA AR DE EN ES FR HI IN IT PT RU ZH  ESP FRA ITA ENG ALE POR RUS ; do

DOMAIN=$( cat  ${PROJECT_LINE} | grep "^${language}="  | head -1  | cut -d "=" -f2  )

if [ "${DOMAIN}" != "" ] ; then
LANGUAGE=$(echo $language |  tr '[:upper:]' '[:lower:]' )

#-Print current lang
echo "#-wscr_domain ${LANGUAGE} ${DOMAIN}"
wscr_domain ${FIND_LINE}   ${LANGUAGE} ${DOMAIN} 

fi

done

#--[02] - END IF MULTI LANGUAGE -------------------------------------------------
fi

#--END_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------
fi

if [ "${wscdl_multi_lang_OUT}" != "0" ] ; then
wscdl_multi_lang_ERR="# ${wscdl_multi_lang_FUN}::##${wscdl_multi_lang_ERR}"
footer_error "${wscdl_multi_lang_ERR}"
fi



fi
}
