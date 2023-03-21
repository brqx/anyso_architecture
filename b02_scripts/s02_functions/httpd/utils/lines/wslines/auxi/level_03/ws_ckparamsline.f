#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2020
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.2.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_ckparamsline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wdom
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba los parametros de la linea y actualiza valores por defecto
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check parameters line
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckparamsline()
{
VER="0.1.9"

ws_ckparamsline_OUT=0
ws_ckparamsline_ERR=""
ws_ckparamsline_MSG=""

ws_ckparamsline_FUN="ws_ckparamsline"
ws_ckparamsline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_ckparamsline_FMT="ws_ckparamsline"
ws_ckparamsline_EXA="ws_ckparamsline"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckparamsline_NFO}" "${ws_ckparamsline_FMT}" "${ws_ckparamsline_EXA}"
#--------------------------------------------------------------------------------
else


if [ "${HA_LOCAL_BACKEND}" == "" ] ; then
#-El Backend por defecto sera 56
HA_LOCAL_BACKEND=locphp70
fi

#-Tipo de servidor
#Enabled Values : standalone_server:proxy_server|proxy_node

if [ "${LANGUAGE}" == "" -o "${LANGUAGE}" == "multi" ] ; then 
LANGUAGE="aa"
fi

if [ "${SITE_LANGUAGE}" != "" ] ; then
LANGUAGE=${SITE_LANGUAGE}
fi

if [ "${SITE_DOMAIN}" 	!= "" ] ; then
#- I dont remember why I put this
DOMAIN=${SITE_DOMAIN}
CLEAN_DOMAIN=$( echo "${SITE_DOMAIN}"  | tr "." "_" )
fi


if [ "${ENVIRONMENT}" == "" ] ; then
#Por defecto el entorno de BBDD es produccion
ENVIRONMENT="p"
fi

if [ "${DIVISION}" == "" ] ; then
#-Profesional - Defecto
DIVISION="pro"
fi

if [ "${REPLICATION}" == "" -o "${REPLICATION}" == "n" ] ; then
#Por defecto el entorno de BBDD es produccion
REPLICATION_TAG="_n"
REPLICATION="n"
fi

if [ "${DRUPAL_VERSION}" == "" ] ; then
#Por defecto el entorno de BBDD es produccion
DRUPAL_VERSION="50"
fi

if [ "${SITE}" == "" ] ; then
#-Idimoa - Defecto es - spanish
SITE=${PROJECT}
fi

if [ "${MODE}" == "serv" ] ; then
#-Profesional - Defecto
MODEVS="home"
else
MODEVS=${MODE}
fi

#---------------------------------------------------
#-SOCK AND DOMAIN FILES ADJUST
#---------------------------------------------------

#-Fastcgi files - hh HipHop virtual machine


#-Proxy Change - Node Knowledge action

# PENDIENTE DE REVISAR
IP_DOMAIN_EBRQX="78.46.58.130"
IP_DOMAIN_FBRQX="88.198.7.135"

if 	[ "${IP_SERVER}" == "${IP_DOMAIN_FBRQX}" -o "${IP_SERVER}" == "${IP_DOMAIN_EBRQX}" 	] ; then
#-El servidor es un proxy
SERVER_TYPE="proxy"
else
SERVER_TYPE="node"
fi

if [ "${DOMAIN}" != "" ] ; then
#-Accedemos a los datos del dominio pasado
wdom ${DOMAIN}
ws_ckparamsline_OUT=$( expr ${ws_ckparamsline_OUT} + ${wdom_OUT} )
ws_ckparamsline_ERR="${ws_ckparamsline_ERR}${wdom_ERR}"
ws_ckparamsline_MSG="${ws_ckparamsline_MSG}${wdom_MSG}"

fi

if 	[ "${IP_DOMAIN}" == "${IP_DOMAIN_FBRQX}" -o "${IP_DOMAIN}" == "${IP_DOMAIN_EBRQX}" 	] ; then
#-El dominio a chequear apunta a un proxy
DOMAIN_TYPE="proxy"
else
DOMAIN_TYPE="node"
fi

#-Nueva variante - Opcion de cachear en ram
#-Debe sincronizar el contenido primero. La idea es que la cache pueda estar en mm ram o en SATA

ws_ckstorageline

#--Ajuste de la ruta de Files y Cache - Ojo que podra ser RAM

#-GESTION DE PRODUCTOS (ANGULAR - REACT - RUBY)

MAIN_PRODUCT="${PRODUCT}"

if 		[ "${PRODUCT}" == "drupal" ] ; then
PRODUCT_BASE="pers/${PRODUCT}/v${DRUPAL_VERSION}/"
PRODUCT_VERSION=${DRUPAL_VERSION}
elif 	[ "${PRODUCT}" == "magento" -o "${PRODUCT}" == "magento21" -o "${PRODUCT}" == "magento22" ] ; then
PRODUCT_BASE="pers/magento/v${MAGENTO_VERSION}/"
PRODUCT_VERSION=${MAGENTO_VERSION}
MAIN_PRODUCT="magento"
elif 	[ "${PRODUCT}" == "nodejs" ] ; then
# Esta parte esta pendiente
#PRODUCT_BASE="pers/${PRODUCT}/v${NODE_VERSION}/"
PRODUCT_VERSION=${NODEJS_VERSION}
elif 	[ "${PRODUCT}" == "none" ] ; then
PRODUCT_VERSION=10
else
PRODUCT=undefined
PRODUCT_VERSION=nover
fi

##echp "Checking CLEAN_DOMAIN : ${CLEAN_DOMAIN}"

VS_DOMAIN=${CLEAN_DOMAIN}.conf
VS_FCGI=${CLEAN_DOMAIN}.cong
VS_MAGENTO=${CLEAN_DOMAIN}.shop
VS_NODEJS=${CLEAN_DOMAIN}.page


VS_LETSNCRYPT=${CLEAN_DOMAIN}.letsncrypt

# Necesitamos truck_dbrqx_ssl_com
BAR_DOMAIN=$( echo "${CLEAN_DOMAIN}" | tr "_" "/" )

DIR_DOMAIN=$( dirname ${BAR_DOMAIN}   ) 
EXT_DOMAIN=$( basename ${BAR_DOMAIN}  )

CLEAN_SSL_DOMAIN=$( echo "${DIR_DOMAIN}_ssl_${EXT_DOMAIN}" | tr "/" "_"  )

#ssl
VS_SSL_DOMAIN=${CLEAN_SSL_DOMAIN}.conf

VS_SSL_NODEJS=${CLEAN_SSL_DOMAIN}.page


RAM_FOLDER_BASE="${RAM_STORAGE_BASE}${PRODUCT_BASE}"

FOLDER_BASE="${STORAGE_BASE}${PRODUCT_BASE}"
OLD_FOLDER_BASE="${OLD_STORAGE_BASE}${PRODUCT_BASE}"

# echp "Folder Base ${FOLDER_BASE}"
#-Debemos insertar las estrategias de backup de los sites y de los servidores
#-Pendiente ---

if [ "${ws_ckparamsline_OUT}" != "0" ] ; then
ws_ckparamsline_ERR="# ${ws_ckparamsline_FUN}::##${ws_ckparamsline_ERR}"
footer_error "${ws_ckparamsline_ERR}"
fi


fi
}
