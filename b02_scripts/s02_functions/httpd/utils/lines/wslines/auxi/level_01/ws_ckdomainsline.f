 #!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_ckdomainsline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckdomainsline -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckdomainsline()
{
VER="0.1.3"

ws_ckdomainsline_OUT=0
ws_ckdomainsline_ERR=""
ws_ckdomainsline_MSG=""

ws_ckdomainsline_FUN="ws_ckdomainsline"
ws_ckdomainsline_NFO="Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida [$VER]"
ws_ckdomainsline_FMT="ws_ckdomainsline"
ws_ckdomainsline_EXA="ws_ckdomainsline"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------

else
#-Tambien va a definir valores comunes de dominio y subdominio
#-Requiere que se haya definido correctamente SITE_PATH

BK_PATH="${MODE}/${SITE_PATH}"

VS_PATH="/host/${BK_PATH}"
LOGS_PATH="/logs/${BK_PATH}"
TEMPLATE_FOLDER_LEVEL="/host/${BK_PATH}"

DESIGN_PATH=/brqx/base/html/designs/
FULL_DESIGN_PATH="${DESIGN_PATH}${UPROJECT}"

ANGULAR_PATH=/brqx/base/angular/
REACT_PATH=/brqx/base/react/

FULL_ANGULAR_PATH="${ANGULAR_PATH}${UPROJECT}"
FULL_REACT_PATH="${REACT_PATH}${UPROJECT}"


#-Home patgxh to create cache image sites
MAIN_LAN_HOME_PATH=${MAIN_HOME_PATH}${LANGUAGE}/

LAN_HOME_PATH=${HOME_PATH}${LANGUAGE}/

LAN_VS_PATH=${VS_PATH}${LANGUAGE}/
LAN_LOGS_PATH=${LOGS_PATH}${LANGUAGE}/

#-Index1 path - Page for static design
# By default what be linkded to v01
LAN_PAGE_PATH_FOR_LINK=${LAN_HOME_PATH}
LAN_PAGE_PATH=${LAN_PAGE_PATH_FOR_LINK}

#echo "Lan Path : ${LAN_PAGE_PATH}"
 
#-Require que se hayan obtenido CLEAN_DOMAIN y VS_PATH previamente

# Aqui hay que diferenciar el comando o no
# Puesto que detecta incoherencias en la estructura


if [ "${VS_PATH}" != "" -a "${CLEAN_DOMAIN}" != "" ] ; then

if [ -d "/host" ] ; then
#-Comprobacion en alta de dominios. Chequea que no exista otro en otra ruta
DOMAIN_EXIST_IN_DIFFERENT_PATH=$( find /host -type f -name ${CLEAN_DOMAIN}.conf  | grep "/${CLEAN_DOMAIN}.conf" | grep -v "${VS_PATH}"  | wc -l )

#-Comprobacion en baja de dominios. Chequea que exista el site a borrar o a generar con haproxy
DOMAIN_EXIST=$( find /host -type f -name ${CLEAN_DOMAIN}.conf  | grep "/${CLEAN_DOMAIN}.conf"  | wc -l )

else

ws_ckdomainsline_OUT=40
ws_ckdomainsline_ERR="#E40-Error en estructura de configuracion /host ##"

fi
else
ws_ckdomainsline_OUT=50
ws_ckdomainsline_ERR="#E50-Error en parametros requeridos VS_PATH :${VS_PATH} - CLEAN_DOMAIN : ${CLEAN_DOMAIN} ##"

fi


if [ "${ws_ckdomainsline_OUT}" != "0" ] ; then
ws_ckdomainsline_ERR="+${ws_ckdomainsline_FUN}::##${ws_ckdomainsline_ERR}"
footer_error "${ws_ckdomainsline_ERR}"
fi


fi
}
