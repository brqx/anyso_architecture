#!/bin/bash
##-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- mkc
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- mkp
#-- chow
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea las carpetas con los permisos adecuados
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
#E mkc aa bb c -- Crea las carpetas con permisos y grupo adecuado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
mkc()
{
VER="0.0.4"

mkc_FUN="mkc"
mkc_NFO="Crea directorios y cambia permisos de forma absoluta en la cadena de entrada en servidor [$VER]($DEP) @${QP}"
mkc_FMT="mkc ARGS_LINE"
mkc_EXA="mkc aaa bbb"

mkc_OUT=0
mkc_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mkc_NFO}" "${mkc_FMT}" "${mkc_EXA}"
#--------------------------------------------------------------------------------
else

LINE_CONTENTS_01="${@}"

mkp "${LINE_CONTENTS_01}"
mkc_OUT=$(expr  ${mkc_OUT} + ${mkp_OUT})
mkc_ERR="${mkc_ERR}${mkp_ERR}"


chow "${LINE_CONTENTS_01}"
mkc_OUT=$(expr  ${mkc_OUT} + ${chow_OUT})
mkc_ERR="${mkc_ERR}${chow_ERR}"

fi

}
