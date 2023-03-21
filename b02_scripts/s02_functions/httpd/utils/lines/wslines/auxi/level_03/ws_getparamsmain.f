#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getparamsmain
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_getparamsmain [FINDLINE] -- ObtiEne valores para la MainLine del subdominio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getparamsmain()
{
VER="0.0.7"

ws_getparamsmain_FUN="ws_getparamsmain"
ws_getparamsmain_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_getparamsmain_FMT="ws_getparamsmain LINE"
ws_getparamsmain_EXA="ws_getparamsmain LINE"

ws_getparamsmain_OUT=0
ws_getparamsmain_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o  "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getparamsmain_NFO}" "${ws_getparamsmain_FMT}" "${ws_getparamsmain_EXA}"
#--------------------------------------------------------------------------------
else

PARAMS_MIND_MAIN="${1}"
PARAMS_MIND_TMP="${PARAMS_MIND_MAIN}_tmp"

if [ -f "${PARAMS_MIND_MAIN}" ] ; then

cat  ${PARAMS_MIND_MAIN} | grep -v "^#" > ${PARAMS_MIND_TMP}


MAINMODE=$(             cat  ${PARAMS_MIND_TMP} 	| grep "^MODE="   | head -1           	| cut -d "=" -f2    )
MAINSITE=$(             cat  ${PARAMS_MIND_TMP} 	| grep "^SITE="   | head -1           	| cut -d "=" -f2    )
MAINLANGUAGE=$(         cat  ${PARAMS_MIND_TMP} 	| grep "^LANG="   | head -1           	| cut -d "=" -f2    )
MAINENVIRONMENT=$(      cat  ${PARAMS_MIND_TMP} 	| grep "^ENV="    | head -1   			| cut -d "=" -f2    )
MAINDRUPAL_VERSION=$(   cat  ${PARAMS_MIND_TMP} 	| grep "^VER"     | head -1  			| cut -d "=" -f2    )
MAINREPLICATION=$(      cat  ${PARAMS_MIND_TMP} 	| grep "^REP="    | head -1           	| cut -d "=" -f2    )
MAINDIVISION=$(         echo ${PARAMS_MIND_MAIN} 	| cut -d "/" -f3                                          	)
MAINPROJECT=$(          echo ${PARAMS_MIND_MAIN} 	| cut -d "/" -f4                                          	)
MAINCLEAN_DOMAIN=$(     echo ${PARAMS_MIND_MAIN} 	| cut -d "/" -f5  | cut -d "_" -f2-   	| cut -d "." -f1    )
MAINDOMAIN=$(           echo ${MAINCLEAN_DOMAIN}    | tr "_" "."                            					)
MAINESCAPED_DOMAIN=$(   echo ${MAINCLEAN_DOMAIN}	| tr "_" "\."                            					)


rm -f ${PARAMS_MIND_TMP}


#-Comprueba valores. No hay posibilidad de error de funcionameinto
ws_ckparamsmain

if [ -d "/host" ] ; then
MAINDOMAIN_EXIST=$( find /host -type f -name ${MAINCLEAN_DOMAIN}.conf  | grep "/${MAINCLEAN_DOMAIN}.conf" | grep -v "${MAINVS_PATH}"  | wc -l )
fi

MAINVS_DOMAIN=${MAINCLEAN_DOMAIN}.conf


else

ws_getparamsmain_COD=30
ws_getparamsmain_EER="#-Error en el fichero de parametros : ${PARAMS_MIND_MAIN} ##"

ws_getparamsmain_OUT=$(expr  ${ws_getparamsmain_OUT} + ${ws_getparamsmain_COD})
ws_getparamsmain_ERR="${ws_getparamsmain_ERR}${ws_getparamsmain_EER}"

fi

if [ "${ws_getparamsmain_OUT}" != "0" ] ; then
ws_getparamsmain_ERR="+${ws_getparamsmain_FUN}::##${ws_getparamsmain_ERR}"
footer_error "${ws_getparamsmain_ERR}"
fi



fi
}
