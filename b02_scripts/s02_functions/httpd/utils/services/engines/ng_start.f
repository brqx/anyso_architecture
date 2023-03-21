#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2019
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- ng_start_engines 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia engines php en servidor en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T start engines php server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ng_start_engines -- Inicia engines php
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ng_start_engines()
{
VER="0.0.7"

ng_start_engines_FUN="ng_start_engines"
ng_start_engines_NFO="Inicia engines php en servidor [$VER]"
ng_start_engines_FMT="ng_start_engines"
ng_start_engines_EXA="ng_start_engines"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ng_start_engines_NFO}" "${ng_start_engines_FMT}" "${ng_start_engines_EXA}"
#--------------------------------------------------------------------------------
else

#-Ruta services Centos7 : /usr/lib/systemd/system
#-Php52
php-fpm52 start
php_fpm52_OUT=$?

#-Php56
service php-fpm56 start
php_fpm56_OUT=$?

#-Php7
service php-fpm70 start
php_fpm70_OUT=$?

service php-fpm71 start
php_fpm71_OUT=$?

service php-fpm72 start
php_fpm72_OUT=$?

service php-fpm73 start
php_fpm73_OUT=$?


service php-fpm74 start
php_fpm74_OUT=$?

service php-fpm80 start
php_fpm74_OUT=$?

# Adjust perms

chown -R apache. /var/run/php-fpm/
chmod -R 775 /var/run/php-fpm/

#-HipHop
service hhvm start
hhvm_OUT=$?


#-Httpd

service apache2 start
apache_OUT=$?

service httpd56 start
httpd_OUT=$?

service httpd7 start
httpd_OUT=$?



fi
}
