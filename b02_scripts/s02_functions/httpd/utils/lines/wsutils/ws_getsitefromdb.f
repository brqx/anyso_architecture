#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getsitefromdb
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si un site existe en el sistema
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
#E ws_getsitefromdb [ID] -- Comprueba si un site existe en el sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getsitefromdb()
{
VER="0.0.3"

ws_getsitefromdb_FUN="ws_getsitefromdb"
ws_getsitefromdb_NFO="Obtiene informacion del site en razon a la BD indicada [$VER]($DEP)@${QP}"
ws_getsitefromdb_FMT="ws_getsitefromdb IDSITE"
ws_getsitefromdb_EXA="ws_getsitefromdb espalillos"

ws_getsitefromdb_OUT=0
ws_getsitefromdb_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getsitefromdb_NFO}" "${ws_getsitefromdb_FMT}" "${ws_getsitefromdb_EXA}"
#--------------------------------------------------------------------------------
else
DB_PASED=${1}
#-La idea es obtener los datos del site tambien a partir del nombre de bd
#-Todo esto esta pendiente. No funciona y aun no tengo decidido como hacerlo
#zd_p50comandos-main-sphinx_n_es_001
#zd_p50comandosEmainEsphinx_n_esV001

NUM_SLASH=$( 		echo "${DB_PASED}" | tr "_" "\n" | wc -l	)

if [ "${NUM_SLASH}" == "4" ] ; then
#--STA_IF_[01] - START [ NUMSLASH DATABASE CORRECT ] ----------------------------

#-Devuelve 0 o 1 dependiendo de si es subdominio o dominio
IS_SUBDOMAIN=$( 	echo "${DB_PASED}" | grep E | wc -l	)

if [ "${IS_SUBDOMAIN}" == "0" ] ; then
#--STA_IF_[02] - START [ IS DOMAIN ] --------------------------------------------
#zd_p50main_n_esV001


PROJECT=$(	echo "${DB_PASED}" | cut -d "_" -f1 )
SITE=$(			echo "${DB_PASED}" | cut -d "_" -f2 | cut -c4- )
LANG=$(			echo "${DB_PASED}" | cut -d "_" -f4 | cut -c1-2 )
VER=$(			echo "${DB_PASED}" | cut -d "_" -f4 | cut -c4- )

LINE=$(			find "/brqi/*/${PROJECT}" -type f -name "*.pj" | xargs grep -l "SITE=${SITE}" | head -1 )

echo "DOMAIN LINE: ${LINE}"

else
#--ELS_IF_[02] - START [ IS SUBDOMAIN ] -----------------------------------------
#zd_p50comandosEmainEsphinx_n_esV001

MAINPROJECT=$(	echo "${DB_PASED}" | cut -d "_" -f1 )
LANG=$(			echo "${DB_PASED}" | cut -d "_" -f4 | cut -c1-2 )
VER=$(			echo "${DB_PASED}" | cut -d "_" -f4 | cut -c4- )

PROJECT=$(		echo "${DB_PASED}" | cut -d "_" -f2 | cut -c4- | cut -d "E" -f1	)
MAINSITE=$(		echo "${DB_PASED}" | cut -d "_" -f2 | cut -c4- | cut -d "E" -f2	)
SITE=$(			echo "${DB_PASED}" | cut -d "_" -f2 | cut -c4- | cut -d "E" -f3	)

MAINLINE=$(			find /brqi/*/${MAINPROJECT} -type f -name "*.pj"  | xargs grep -l "SITE=${MAINSITE}" | head -1)

SUBD_LINE=$(		find /brqi/*/${PROJECT} -type f -name "*.spj"  | xargs grep -l "SITE=${SITE}" | head -1)

echo "MAINL: ${MAINLINE}"
echo "SUBD : ${SUBD_LINE}"


#--END_IF_[02] - START [ IS DOMAIN ] --------------------------------------------
fi
else

ws_getsitefromdb_EER="#-Name not correct for a database (${NUM_SLASH}) : ${DB_PASED} ##"
ws_getsitefromdb_COD=12
ws_getsitefromdb_OUT=$(expr  ${ws_getsitefromdb_OUT} + ${ws_getsitefromdb_COD})
ws_getsitefromdb_ERR="${ws_getsitefromdb_ERR}${ws_getsitefromdb_EER}"


#--END_IF_[01] - START [ NUMSLASH DATABASE CORRECT ] ----------------------------
fi

if [ "${ws_getsitefromdb_OUT}" != "0" ] ; then
wscd_ERR="#+${ws_getsitefromdb_FUN}::##${ws_getsitefromdb_ERR}"
footer_error "${ws_getsitefromdb_NFO}" "${ws_getsitefromdb_ERR}"
fi

fi
}
