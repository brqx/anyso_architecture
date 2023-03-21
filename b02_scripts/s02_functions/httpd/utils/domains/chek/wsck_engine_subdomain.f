#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsck_engine_subdomain
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Ficheros
#--------------------------------------------------------------------------------
#--  
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si hay patrones definidos para subdominio para usar una engine especifica
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check engine php patterns
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsck_engine_subdomain 	-- Genera estructuras de ficheros a usar en el proceso
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsck_engine_subdomain()
{
VER="0.1.0"

wsck_engine_subdomain_FUN="wsck_engine_subdomain"
wsck_engine_subdomain_NFO="Comprueba si hay patrones definidos para subdominio para usar una engine especifica [$VER]"
wsck_engine_subdomain_FMT="wsck_engine_subdomain"
wsck_engine_subdomain_EXA="wsck_engine_subdomain"

wsck_engine_subdomain_OUT=0
wsck_engine_subdomain_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsck_engine_subdomain_NFO}" "${wsck_engine_subdomain_FMT}" "${wsck_engine_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
#La idea es alterar el backend de ejecucion del subdomino predeterminado por la configuracion del dominio
#-Tenemos dos formas de hacerlo:

#-A En base a la url del subdominio 
#
#-- d5 --> Drupal 5
#-- d7 --> Drupal 7
#-- d8 --> Drupal 8

#-B En base a la configuracion spj del subdominio cuando exista. 
# NOTA: En la arquitectura todo es independiente, por tanto es viable que haya subdominios creados 
#       para haproxy y que aun no se hayan desplegado como site. 
# Cada dominio tiene su propia lista de subdominios, los cuales pueden tener su propia engine predefinida

SUBDOMAIN_PASED="${1}"
PHP_ENGINE_PASED="${2}"
DOMAIN_PASED="${3}"

if [ "${DOMAIN_PASED}" == "" ] ; then
DOMAIN_PASED=${DOMAIN}
fi

#-Conocemos
#-Debe siempre cambiar por cada dominio
#WAF_LINE="${DOMAIN} ${WAF_TYPE}"
WAF_TYPE_INT=${WAF_TYPE}

if 			[ "${PHP_ENGINE_PASED}"		!= "" 	]  ; then
WAF_TYPE_INT=${PHP_ENGINE_PASED}

else

	if 		[ "${SUBDOMAIN_PASED}" 		== "d5" ] ; then
	#-Queremos ejecutar drupal 5
	WAF_TYPE_INT="locphp52"
	elif	[ "${SUBDOMAIN_PASED}" 		== "d7" ] ; then
	#-Queremos ejecutar drupal 5
	WAF_TYPE_INT="locphp70"
	elif	[ "${SUBDOMAIN_PASED}" 		== "d8" ] ; then
	#-Queremos ejecutar drupal 5
	WAF_TYPE_INT="locphp56"
	elif	[ "${SUBDOMAIN_PASED}" 		== "hh" ] ; then
	#-Queremos ejecutar drupal 5
	WAF_TYPE_INT="lochiphop"
	fi
fi

SUBD_LINE="${SUBDOMAIN_PASED}.${DOMAIN_PASED} ${WAF_TYPE_INT}"
fi
}
