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
ws_reload_services()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Recarga las configuraciones de los serviciosdel servidor Brqx [$VER]"
echo "=========================================================="
echo "Format  : ws_reload_services                               "
echo "----------------------------------------------------------"
echo "Example : ws_reload_services                               "
echo "Example : ws_reload_services                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

service apache2 reload					&> /dev/null

service httpd56 reload					&> /dev/null

service httpd7 reload					&> /dev/null

service lighttpd reload				&> /dev/null

service nginx reload				&> /dev/null

service gwan reload 

## /usr/bin/kwan.x &> /dev/null && /usr/bin/gwan.x &	&> /dev/null

#service varnish3 restart

fi
}
