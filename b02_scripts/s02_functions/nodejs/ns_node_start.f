#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nodejs_start_site
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Inicia un Site con NodeJS
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create theme modules contemplates links
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E nodejs_start_site -- Genera enlaces a themes modules y contemplates en base a parametros definidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nodejs_start_site()
{
VER="0.0.6"

nodejs_start_site_FUN="nodejs_start_site"
nodejs_start_site_NFO="Inicia un site con Node JS [$VER]($DEP) @${QP}"
nodejs_start_site_FMT="nodejs_start_site DIVISION PROJECT SITE"
nodejs_start_site_EXA="nodejs_start_site per rct garlrct"

nodejs_start_site_OUT=0
nodejs_start_site_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nodejs_start_site_NFO}" "${nodejs_start_site_FMT}" "${nodejs_start_site_EXA}"
#--------------------------------------------------------------------------------

else

#- Requiere que se ejecute con el usuario composer

MYUID=$(whoami)

if [ "${MYUID}" == "composer" ] ; then
#-STA_IF_001 [COMPOSER]

DIV=${1}
PRO=${2}
SIT=${3}

if [ "${DIV}" != "" -a  "${PRO}" != "" -a  "${SIT}" != "" ] ; then
#-STA_IF_002 [DIVISION]

NODE_BASE=/brqx/run/react/${DIV}/${PRO}/${SIT}
CLUSTER_NAME=cluster_${SIT}.js
CURR_PATH=${PWD}


cd ${NODE_BASE}
ERR_COD=$?

if [ "${ERR_COD}" == "0" ] ; then
#-STA_IF_003 [CD PATH]
#Hemos entrado en la carpeta

#Numero de instancias del cluster
NUM_INST=$(forever list | grep "${CLUSTER_NAME}" | wc -l )

# echo "Numero de Instancias : ${NUM_INST} "

if [ "${NUM_INST}" == "0" ] ; then
## Hay que iniciarlo  
forever start "${CLUSTER_NAME}"   &> /dev/null
else
forever restart "${CLUSTER_NAME}" &> /dev/null  
fi

sleep 1

DEBUG_PATH=$(forever list --plain | grep -v "STOPPED" | grep "${CLUSTER_NAME}" | tr -s " " | cut -d " " -f8 )

#echo "Debug Path : -${DEBUG_PATH}-"

#DEBUG_FOLD=$(dirname ${DEBUG_PATH})
#DEBUG_FOLD="/home/composer/.forever/"

#DEBUG_FILE=$(basename ${DEBUG_PATH} |cut -d "." -f1 )
#DEBUG_FILE=$(basename ${DEBUG_PATH})

#echo "Debug File ${DEBUG_FILE} " 

#find "${DEBUG_FOLD}" -type f | grep "${DEBUG_FILE}"

#EXIST_FILE=$(ls -1 "${DEBUG_PATH}" | wc -l)

## No me funciona
if [ -f ${DEBUG_PATH} ] ; then
#-STA_IF_004 [FILE EXIST]

#if [ "${EXIST_FILE}" == "1" ] ; then
  
SOCK_NAME=$(tail -100 "${DEBUG_PATH}" | grep sock | tail -1 | cut -d " " -f3- )  

echo "Node Js Server ${DIV} ${PRO} ${SIT} working"
echo "-----------------------------------------------------------"
echo "Debug file : ${DEBUG_PATH}"
echo "Sock       : ${SOCK_NAME}"

else

nodejs_start_site_ERR="Error al acceder al fichero "${DEBUG_FILE}""  

echo "${nodejs_start_site_NFO}" "${nodejs_start_site_ERR}"

#-END_IF_004 [FILE EXIST]
fi


#-END_IF_003 [CD PATH]
fi
else


nodejs_start_site_ERR="Requiere de tres parametros"  

echo "${nodejs_start_site_NFO}" "${nodejs_start_site_ERR}"

# Footer error creo que es de arquitectura
#footer_error "${nodejs_start_site_NFO}" "${nodejs_start_site_ERR}"

#Return to old path
cd ${CURR_PATH}

# End if Proy
#-END_IF_002 [DIVISION]
fi


else
nodejs_start_site_ERR="Debe ejecutarse con composer"  

echo "${nodejs_start_site_NFO}" "${nodejs_start_site_ERR}"

#footer_error "${nodejs_start_site_NFO}" "${nodejs_start_site_ERR}"
# End if Composer
fi

fi
}
