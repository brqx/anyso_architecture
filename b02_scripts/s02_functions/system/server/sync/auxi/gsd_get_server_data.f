#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- gsd
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- hostname - uname
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Retorna la informacion del sevidor actual - Nombre IP y demas
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get server data ip name letter
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E gsd -- Retorna la informacion del sevidor actual - Nombre IP y demas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
gsd()
{
VER="0.0.2"								;QP="Brqx Agile Architecture 2018"
DEP=0

gsd_FUN="gsd"
gsd_NFO="Retorna la informacion del sevidor actual - Nombre IP y demas [$VER]($DEP) @${QP}"
gsd_FMT="gsd"
gsd_EXA="gsd"

gsd_OUT=0
gsd_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${gsd_NFO}" "${gsd_FMT}" "${gsd_EXA}"
#--------------------------------------------------------------------------------
else
#-La funcion tiene dos variantes:
#-a.normal: No require ningun valor configurado y devuelve los valores normales del servidor
#-b.backup: Requiere que se hayan definido BK_TYPE - BK_STRATEGY - BK_SUBTYPE

SERVER_IP=$( 			hostname -I 2> /dev/null | cut -d " " -f1  	)

if [ "${?}" != "0" -o "${SERVER_IP}" ==  "127.0.0.1" ] ; then
SERVER_IP=$( 			hostname -i	| cut -d " " -f1 				  2> /dev/null	)
fi

SERVER_NAME=$(  		uname -n 	| cut -d "." -f2- )

#-Return server_com
CLEAN_SERVER_NAME=$(  	echo ${SERVER_NAME} | tr "." "_" )

SERVER_LETTER=$( 		echo ${SERVER_NAME} 		| cut -c1 												)

#-Data for Backups
MONTH_NUMBER=$(	date '+%m'	)
MONTH_LETTER=$(	date '+%b'	)
YEAR_BK=$(		date '+%Y'	)


fi
}
