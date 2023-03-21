#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- wsddl_multi_lang
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wcdd (cluster) - wsdd_nocluster (server)
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS Domain en arquitectura Brqx en todos los idiomas
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T drop delete virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsddl_multi_lang [ID] -- Elimina el VS multi lenguage para el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsddl_multi_lang()
{
VER="0.0.6"
DEP="01"		# Depth script

wsddl_multi_lang_FUN="wsddl_multi_lang"
wsddl_multi_lang_NFO="Borra un VS dominio multi idioma en arquitectura Brqx [$VER]($DEP)@{QP}"
wsddl_multi_lang_FMT="wsddl_multi_lang IDSITE"
wsddl_multi_lang_EXA="wsddl_multi_lang espalillos"

wsddl_multi_lang_OUT=0
wsddl_multi_lang_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsddl_multi_lang_NFO}" "${wsddl_multi_lang_FMT}" "${wsddl_multi_lang_EXA}"
#--------------------------------------------------------------------------------
else
IDSITE=${1}

SITE_LANGUAGE=""
SITE_DOMAIN=""

ws_gddrop
wsddl_multi_lang_OUT=$(expr  ${wsddl_multi_lang_OUT} + ${ws_gddrop_OUT})
wsddl_multi_lang_ERR="${wsddl_multi_lang_ERR}${ws_gddrop_ERR}"

if [ "${ws_gddrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

#-Dual check for Multi language
if [ "${MODE}" != "lang" ] ; then
#- 03 - START IF MULTI LANGUAGE

wsdd_nocluster ${IDSITE} 

else
#-- ONLY MULTI LANGUAGE SITES

PROJECT_LINE=${FIND_LINE}

for language in AA ES FR IT DE EN RU PT ZH HI ESP FRA ITA ENG ALE POR RUS   ; do

DOMAIN=$(  cat  ${PROJECT_LINE} | grep "^${language}="  | head -1  | cut -d "=" -f2  )

if [ "${DOMAIN}" != "" ] ; then
LANGUAGE=$(echo $language |  tr '[:upper:]' '[:lower:]' )

echo "#-wsdr_domain ${LANGUAGE} 		${DOMAIN}"
wsdr_domain ${FIND_LINE}   ${LANGUAGE} 		${DOMAIN}  
fi

done
#- Ahora debe borrar el site
ws_getline ${FIND_LINE}
VS_FILES="/host/${MODE}/${DIVISION}/${PROJECT}/z${SITE}"

rm -rf  ${VS_PATH}									2>	/dev/null
echo "rm -rf ${VS_FILES}*"


#--[02] - END IF MULTI LANGUAGE -------------------------------------------------
fi

#--[01] - END [IF FINDLINE] -----------------------------------------------------
fi


if [ "${wsddl_multi_lang_OUT}" != "0" ] ; then
wsddl_multi_lang_ERR="# ${FUNC}::##${wsddl_multi_lang_ERR}"
footer_error "${wsddl_multi_lang_ERR}"
fi


fi
}
