#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [FUNC_NAME]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_infoline mi_func -- Presenta los valores ya obtenidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_infoline()
{
VER="0.0.3"

ws_infoline_FUN="ws_infoline"
ws_infoline_NFO="Informa una linea de valores de un fichero de configuracion [$VER]($DEP)@${QP}"
ws_infoline_FMT="ws_infoline IDSITE"
ws_infoline_EXA="ws_infoline espalillos"

ws_infoline_OUT=0
ws_infoline_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_infoline_NFO}" "${ws_infoline_FMT}" "${ws_infoline_EXA}"
#--------------------------------------------------------------------------------
else
FUN=${1}

#-Fun es un parametro informativo pero no tiene funcionalidad
#-Esta funcion solo muestra valores. Por tanto dichos valores deberan ya estar definidos

# Cadenas de busqueda y reemplazo
if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Estructura apache Brqx : Function ${FUN}-  [$VER] "
echo "--------------------------------------------------"
echo "Site           :  ${SITE} [${IDSITE}] (${EXIST_PATH}) "
echo "Domain         :  ${DOMAIN}					    "
echo "Clean Domain   :  ${CLEAN_DOMAIN}					"
echo "Product        :  ${PRODUCT}                          "
echo "Database       :  ${DATABASE}					                "
echo "Project        :  ${PROJECT}                      "
echo "Division       :  ${DIVISION}                     "
echo "Site           :  ${SITE}                         "
echo "Language       :  ${LANGUAGE}                     "
echo "Mode           :  ${MODE}                         "
echo "Replication    :  ${REPLICATION}					"
echo "IP             :  ${IP_SERVER}                    "
echo "Environment    :  ${ENVIRONMENT}                  "

if    [ "${PRODUCT}" == "drupal"  ] ; then
echo "Drupal Version :  ${DRUPAL_VERSION}               "

elif  [ "${PRODUCT}" == "magento" ] ; then

echo "Magento Version :  ${MAGENTO_VERSION}               "

fi

echo "--------------------------------------------------"
echo "Home           :  ${HOME_PATH}                    "
echo "BBDD:          :  ${DATABASE}                     "
echo "Virtual Server :  ${VS_PATH}                      "
echo "Logs           :  ${LOGS_PATH}                    "
echo "--------------------------------------------------"
echo "Project        :  ${FIND_LINE}                    "
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
fi

fi
}
