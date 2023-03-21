#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- mymvr - mymvr_slow
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Ficheros
#--------------------------------------------------------------------------------
#-- mycpin - mydr  
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Mueve| Renombra una bases de datos en base a los filtros de entrada
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T move rename database changing name
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FILTER COMMON TARGET
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E mymvr rct_p50main rcabello_d51_tot 	-- Mueve bbdd cambiando el nombre
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
mymvr()
{
VER="0.0.8"
FUNC="mymvr"

mymvr_NFO="Mueve|Renombra una base de datos en base a patrones de entrada [$VER]"
mymvr_FMT="mymvr FILTER COMMON TARGET"
mymvr_EXA="mymvr rct main rcabello"

if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mymvr_NFO}" "${mymvr_FMT}" "${mymvr_EXA}"
#--------------------------------------------------------------------------------

else

DB_SOURCE=$1
DB_TARGET=$2

mymv ${DB_SOURCE} ${DB_TARGET}

#-Ahora vamos a reemplazar

#-Todo esto esta pendiente. No funciona y aun no tengo decidido como hacerlo

##ws_getsitefromdb ${DB_SOURCE}

##ws_getsitefromdb ${DB_TARGET}

USERDB_SOURCE=$(echo ${DB_SOURCE} | cut -d "_" -f1 )
USERDB_TARGET=$(echo ${DB_TARGET} | cut -d "_" -f1 )

ws_getdomain_from_user ${USERDB_SOURCE} 
DOMAIN_SOURCE=${ws_getdomain_from_user_OUT}

ws_getdomain_from_user ${USERDB_TARGET} 
DOMAIN_TARGET=${ws_getdomain_from_user_OUT}

#-No consigo el dominio partiendo de la BD
echo "myrp ${DB_TARGET} ${DOMAIN_SOURCE} ${DOMAIN_TARGET}"
myrp ${DB_TARGET} ${DOMAIN_SOURCE} ${DOMAIN_TARGET}

fi
}


ws_getdomain_from_user()
{


if [ "${1}" == "-?" -o  "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mymvr_slow_NFO}" "${mymvr_slow_FMT}" "${mymvr_slow_EXA}"
#--------------------------------------------------------------------------------
else
DOMAIN_ID=${1}
#-Obtenemos el dominio en razon al idsite pasado

PROJECT_PATH="/brqi/"

#Hay que obtener el servidor

DOMAINS_FILE=$(   find ${PROJECT_PATH} -type f -name "brqx.fulldom"           | head -1                 )

DOMAIN=$(         cat ${DOMAINS_FILE} | grep ":${DOMAIN_ID}" | cut -d ":" -f1                           )

ws_getdomain_from_user_OUT="${DOMAIN}"

fi
}

