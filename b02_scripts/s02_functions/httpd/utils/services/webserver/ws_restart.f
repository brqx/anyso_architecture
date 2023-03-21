#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- ws_restart_services (alias wscdn)
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia servicios en servidor en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T restart services httpd
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ws_restart_services -- Inicia servicios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ws_restart_services()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Inicia los servicios web del servidor Brqx [$VER]"
echo "=========================================================="
echo "Format  : ws_start_services                               "
echo "----------------------------------------------------------"
echo "Example : ws_start_services                               "
echo "Example : ws_start_services                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

service apache2 restart					&> /dev/null

service httpd7 restart					&> /dev/null

service httpd56 restart					&> /dev/null

service lighttpd restart				&> /dev/null
service nginx restart					  &> /dev/null

service gwan restart            &> /dev/null
##/usr/bin/kwan.x &> /dev/null && /usr/bin/gwan.x &	&> /dev/null
#service varnish3 restart

fi
}
