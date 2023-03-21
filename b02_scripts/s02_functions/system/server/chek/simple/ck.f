#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- ck
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprueba puertos en el dominio indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T check domain ports
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cko brqx.es 22 	-- Comprueba puertos contra el dominio 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F shell
#-------------------------------------------------------------------

ck()
{
VER="0.0.8"
FUNC="ck"

ck_NFO="Chequeo puerto en servidor [$VER]"
ck_FMT="ck [DOMAIN|IP] [PORT]"
ck_EXA="ck pbrqx.com 22"

ck_OUT=0
ck_TXT=""   # Text information for Success
ck_ERR=""   # Test details for wrong
ck_MSG=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ck_NFO}" "${ck_FMT}" "${ck_EXA}"
#--------------------------------------------------------------------------------
else

SERVER=$1
PORT=$2

if [ "${SERVER}" == "" ] ; then
SERVER=hbrqx.com
fi

if [ "${PORT}" == "" ] ; then
PORT=60022
fi

PERL_CK="/root/scripts/arq/libs/perl/cport.pl"

#-Si da un 0 esta abierto - 1 esta cerrado - si es aix es distinta
perl_OUT=$( ${PERL_CK} ${SERVER} ${PORT} | grep Closed | wc -l)

if  [ "${perl_OUT}" == "0"	 ] ; then
#--[03] - START [IF PERL OPEN PORT] ---------------------------------------------------------------------
ck_OUT=0
ck_MSG="-[${FUNC}] Ok"
ck_TXT="-[${FUNC}] Connection on port ${PORT} Ok"
else
ck_OUT=1
ck_MSG="-[${FUNC}] KO"
ck_ERR="-[${FUNC}] Error. Connection on port ${PORT} failed"
fi


fi

}
