#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- ws_cktemplateports
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- sed
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera ficheros de configuracion en base a plantillas para servidores web
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T generate setup files template web server
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_cktemplateports LINE TEMPLATE_PATH es brqx.es nginx -- Genera plantilla
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_cktemplateports()
{
VER="0.1.1"

ws_cktemplateports_FUN="ws_cktemplateports"
ws_cktemplateports_NFO="Define sockets y puertos para el webserver de entrada [$VER]"
ws_cktemplateports_FMT="ws_cktemplateports LINE TEMPLATE_PATH [SITE_LANG] [SITE_DOMAIN] {WS_TYPE]"
ws_cktemplateports_EXA="ws_cktemplateports LINE TEMPLATE_PATH es brqx.es nginx"

ws_cktemplateports_OUT=0
ws_cktemplateports_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_cktemplateports_NFO}" "${ws_cktemplateports_FMT}" "${ws_cktemplateports_EXA}"
#--------------------------------------------------------------------------------
else

#-Ejemplo de sock
#--------------------------------------------------------------------------------
#fpm52:/var/run/php-fpm/php-fpm52.sock
#php70:var/run/php-fpm/php-fpm70.sock
#remi56:/var/run/php-fpm/remi56.sock
#remi70:/var/run/php-fpm/remi70.sock
#hiphop:/var/run/hhvm/sock
#--------------------------------------------------------------------------------

FILEPDO_SERVER="SIN_FILE"
SOCK_SERVER="SIN_SOCK"


# Necesitamos saber para que webservers se debe crear el subdominio
if 		[ "${WS_TYPE}" == "lighttp" ] ; then
#--------------------------------------------------------------------------------
#-[LIGHTTP] Transformacion a formato de barras (php52 php56 php7 hiphop)
	DOMAINBAR=$( 		echo ${DOMAIN}| sed "s/\\./\\\\\\\./g"	)
	PORT_SERVER=60083

	if [ "${ENGINE_LIGHTTP}" != "" ] ; then 
	SOCK_SERVER=$(		cat ${ENGINES_FILE} | grep "^${ENGINE_LIGHTTP}" | cut -d ":" -f2 |  sed "s/\//\\\\\//g"	)
	fi
#--------------------------------------------------------------------------------
elif 	[ "${WS_TYPE}" == "apache" 	] ; then
#--------------------------------------------------------------------------------
	#-[APACHE] php 52 - hiphop 
	DOMAINBAR=${DOMAIN}
	PORT_SERVER=60082

	FILEPDO_SERVER=$(	cat ${ENGINES_FILE} | grep "^FILEPDO_APACHE" | cut -d ":" -f2 						)

	if [ "${FILEPDO_SERVER}" == "" ] ; then 
	FILEPDO_SERVER=libphp52.so
	fi
#--------------------------------------------------------------------------------
elif 	[ "${WS_TYPE}" == "httpd56" 	] ; then
#--------------------------------------------------------------------------------
#-[HTTPD] php56  
	DOMAINBAR=${DOMAIN}
	PORT_SERVER=60084

	FILEPDO_SERVER=$(	cat ${ENGINES_FILE} | grep "^FILEPDO_HTTPD57:" | cut -d ":" -f2 						)

	if [ "${FILEPDO_SERVER}" == "" ] ; then 
	FILEPDO_SERVER=libphp56.so
	fi

#--------------------------------------------------------------------------------
elif 	[ "${WS_TYPE}" == "httpd7" 	] ; then
#--------------------------------------------------------------------------------
#-[HTTPD] php7 (libphp70.so - libphp71.so) 
	DOMAINBAR=${DOMAIN}
	PORT_SERVER=60087

	FILEPDO_SERVER=$(	cat ${ENGINES_FILE} | grep "^FILEPDO_HTTPD7:" | cut -d ":" -f2 						)

	if [ "${FILEPDO_SERVER}" == "" ] ; then 
	FILEPDO_SERVER=libphp71.so
	fi
	
#--------------------------------------------------------------------------------
elif 	[ "${WS_TYPE}" == "nginx" 	] ; then
#--------------------------------------------------------------------------------
	#-[NGINX] php52 - php56 - php7 - hiphop 
	DOMAINBAR=${DOMAIN}
	PORT_SERVER=60081
	PORT_SERSSL_01=60441
  PORT_SERSSL_02=61441
  PORT_SERSSL_03=62441
	
	if [ "${ENGINE_NGINX}" != "" ] ; then 
	SOCK_SERVER=$(cat ${ENGINES_FILE} | grep "^${ENGINE_NGINX}" | cut -d ":" -f2  | sed "s/\//\\\\\//g"	)
	fi
fi



if [ "${FILEPDO_SERVER}" 	== "" ] ; then 
FILEPDO_SERVER="SIN_FILE"
fi

if [ "${SOCK_SERVER}" 		== "" ] ; then 
SOCK_SERVER="SIN_SOCK"
fi

PHPVERSIONPDO_SERVER=$(echo ${FILEPDO_SERVER} | cut -c7-8)


fi
}
