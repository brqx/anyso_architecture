#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- wsempty
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Vacia las variables definidas y usadas en funciones sin parametros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T report domain information lite
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsliteinfo brqx.es	-- Informa del dominio actual [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
wsempty()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Vacia las variables definidas y usadas en funciones sin parametros en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsempty											"
echo "----------------------------------------------------------"
echo "Example : wsempty				                            "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else


#-Vaciado variables
DOMAIN=""
CLEAN_DOMAIN=""
CLEAN_DOMAIN_PASSED=""
DOMAIN_IP=""
HOST_SERVER=""
DIVISION=""
PROJECT=""
SITE=""

WAF_LINE=""
WAF_TYPE=""
LOADSUBD=""   				# Variable usada para saber si debemos mostrar los subdominios
LOADLANGS=""  				# Variable usada para determinar si informamos de los idiomas
HEAD_LINE_INFORMATION=""	# Cabecera de informacion para el dominio no util en HaProxy
SHOW_WWW_DOMAIN=""			# SubDominios www


fi
}
