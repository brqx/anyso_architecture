#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- satatoram
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Estrutura Drupal Info para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E sxram LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
satatoram()
{
VER="0.0.2"

satatoram_FUN="satatoram"
satatoram_NFO="Sincroniza contenido desde memoria ram a un soport sata [$VER]($DEP) @${QP}"
satatoram_FMT="satatoram [PATH]"
satatoram_EXA="satatoram --> Sync current folder if is SATA folder"

satatoram_OUT=0
satatoram_ERR=""


SERVER=$1
BK_PATH=$2
PORT=$3

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${satatoram_NFO}" "${satatoram_FMT}" "${satatoram_EXA}"
#--------------------------------------------------------------------------------
else

#-Sync folder from SATA to ram 
PATH_TO_RAM=${1}

if [ "${PATH_TO_RAM}" == "" ] ; then
#-Solo se ha pasado una ruta
PATH_TO_RAM=${PWD}
fi

#-SATA PATH are like /brqx/ or /zcache/ but might to be like /zsata
#-So path might to be changed from zsata to zram

RAM_PATH=$(echo ${PATH_TO_RAM} | sed "s/zsata/zram/g" )
SATA_PATH=$(echo ${PATH_TO_RAM} | sed "s/zram/zsata/g" )

SOURCE=${SATA_PATH}
TARGET=${RAM_PATH}

mkp ${TARGET}

#-I have doubth if I use sxto or szto
szto ${SOURCE} ${TARGET}

satatoram_OUT=$(expr  ${satatoram_OUT} + ${szto_OUT})
satatoram_ERR="${satatoram_ERR}${szto_ERR}"


if [ "${satatoram_OUT}" != "0" ] ; then
satatoram="#+${satatoram_FUN}::##${satatoram_ERR}"
footer_error "${satatoram_NFO}" "${satatoram_ERR}"
fi


fi

}
