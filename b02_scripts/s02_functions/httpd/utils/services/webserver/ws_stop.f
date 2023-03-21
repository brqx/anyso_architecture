#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- ws_stop_services
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
#T start services httpd
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ws_start_services -- Inicia servicios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
ws_stop_services()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Detiene los servicios web del servidor Brqx [$VER]"
echo "=========================================================="
echo "Format  : ws_stop_services                               "
echo "----------------------------------------------------------"
echo "Example : ws_stop_services                               "
echo "Example : ws_stop_services                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

service apache2 stop			&> /dev/null

service httpd56 stop			&> /dev/null

service httpd7 stop			&> /dev/null

service lighttpd stop		&> /dev/null

service nginx stop		&> /dev/null

service gwan stop    &> /dev/null

# /usr/bin/kwan.x & 			&> /dev/null

fi
}
