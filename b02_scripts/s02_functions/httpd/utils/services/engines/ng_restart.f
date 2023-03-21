#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- ng_restart_engines 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I ReInicia engines php en servidor en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T restart engines php server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ng_restart_engines -- Reinicia engines php
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ng_restart_engines()
{
VER="0.0.5"
FUNC="ng_restart_engines"

ng_restart_engines_FUN="ng_restart_engines"
ng_restart_engines_NFO="ReInicia engines php en servidor [$VER]"
ng_restart_engines_FMT="ng_restart_engines"
ng_restart_engines_EXA="ng_restart_engines"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ng_restart_engines_NFO}" "${ng_restart_engines_FMT}" "${ng_restart_engines_EXA}"
#--------------------------------------------------------------------------------
else

ng_stop_engines

ng_start_engines

fi
}
