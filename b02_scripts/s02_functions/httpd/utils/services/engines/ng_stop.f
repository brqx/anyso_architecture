#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- ng_stop_engines
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Detiene entinges en servidor en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T stop engines php server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ng_stop_engines -- Detiene engines php - transparent admin project
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ng_stop_engines()
{
VER="0.0.5"

ng_stop_engines_FUN="ng_stop_engines"
ng_stop_engines_NFO="Detiene engines php en servidor [$VER]"
ng_stop_engines_FMT="ng_stop_engines"
ng_stop_engines_EXA="ng_stop_engines"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ng_stop_engines_NFO}" "${ng_stop_engines_FMT}" "${ng_stop_engines_EXA}"
#--------------------------------------------------------------------------------
else

#-Php52
php-fpm52 stop

#-Php56
service php-fpm56 stop

#-Php7
service php-fpm70 stop


service php-fpm71 stop


service php-fpm72 stop

service php-fpm73 stop

service php-fpm74 stop

service php-fpm80 stop


#-HipHop
service hhvm stop

service apache2 stop

service httpd56 stop

service httpd7 stop

fi
}
