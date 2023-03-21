#!/bin/bash
##-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- mkp
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea las carpetas sin los permisos adecuados
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create folder change perms
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mkp aa bb c -- Crea las carpetas 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
mkp()
{
VER="0.0.8"	

mkp_FUN="mkp"
mkp_NFO="Crea directorios de forma absoluta en la cadena de entrada en servidor [$VER]($DEP) @${QP}"
mkp_FMT="mkc ARGS_LINE"
mkp_EXA="mkc aaa bbb"

mkp_OUT=0
mkp_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mkp_NFO}" "${mkp_FMT}" "${mkp_EXA}"
#--------------------------------------------------------------------------------
else

for ruta in "${@}" ; do
##echo ${ruta}
mkdir -p ${ruta}						&> /dev/null
mkp_COD=$?
mkp_OUT=$(expr  ${mkp_OUT} + ${mkp_COD})

if [ "${mkp_COD}" != "0" ] ; then
mkp_EER="#-E${mkp_COD}:Problem creating folder : ${ruta}  ##"
mkp_ERR="${mkp_ERR}${mkp_ERR}"
fi

done


fi

}
