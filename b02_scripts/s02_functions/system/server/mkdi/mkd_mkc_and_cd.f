#!/bin/bash
##-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- mkd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- mkd
#-- cd
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
#E mkd aa -- Crea las carpetas con permisos y accede a la misma
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
mkd()
{
VER="0.0.3"

mkd_FUN="mkd"
mkd_NFO="Crea directorios ,cambia permisos y accede a la primera ruta indicada [$VER]($DEP) @${QP}"
mkd_FMT="mkd ARGS_LINE"
mkd_EXA="mkd aaa bbb"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mkd_NFO}" "${mkd_FMT}" "${mkd_EXA}"
#--------------------------------------------------------------------------------
else

LINE_CONTENTS_01="${@}"

mkc "${LINE_CONTENTS_01}"
mkd_OUT=$(expr  ${mkd_OUT} + ${mkc_OUT})
mkd_ERR="${mkd_ERR}${mkc_ERR}"


#-Access to first folder
cd "${LINE_CONTENTS_01}"
mkd_COD=$?
mkd_OUT=$(expr  ${mkp_OUT} + ${mkd_COD})

mkd_EER="#-E${mkd_COD}:Problem accessing folder : ${LINE_CONTENTS_01}  ##"
mkd_ERR="${mkd_ERR}${mkd_ERR}"



fi

}
