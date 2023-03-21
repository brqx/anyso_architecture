#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- mycpr 
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
#E mycpr rct_p50main rcabello_d51_tot 	-- Mueve bbdd cambiando el nombre
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
mycpr()
{
VER="0.0.8"
FUNC="mycpr"

mycpr_NFO="Mueve|Renombra una base de datos en base a patrones de entrada [$VER]"
mycpr_FMT="mycpr FILTER COMMON TARGET"
mycpr_EXA="mycpr rct main rcabello"

if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mycpr_NFO}" "${mycpr_FMT}" "${mycpr_EXA}"
#--------------------------------------------------------------------------------

else

DB_SOURCE=$1
DB_TARGET=$2

mycp ${DB_SOURCE} ${DB_TARGET}

#-Ahora vamos a reemplazar

#-Todo esto esta pendiente. No funciona y aun no tengo decidido como hacerlo

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


