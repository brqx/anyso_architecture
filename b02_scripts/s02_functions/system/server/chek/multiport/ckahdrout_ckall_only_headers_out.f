#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- ckahdrout
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Generacion de cabeceras para la comprobacion de puertos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T check domain ports header generation
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ckahdrout 	 	-- Genera cabeceras para los puertos 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F shell
#-------------------------------------------------------------------

ckahdrout()
{
VER="0.0.8"
FUNC="ckahdrout"

ckahdrout_NFO="Comprobacion puertos dominio [$VER]"
ckahdrout_FMT="ckahdrout [DOMAIN]"
ckahdrout_EXA="ckahdrout pbrqx.com"

ckahdrout_OUT=0
ckahdrout_ERR=""
ckahdrout_MSG=""


if [ "${1}" == "-?" ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ckahdrout_NFO}" "${ckahdrout_FMT}" "${ckahdrout_EXA}"
#--------------------------------------------------------------------------------

else

ckahdr 

echo "${ckahdr_HDR}"

fi

}
