#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ssdtoram
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
ssdtoram()
{
VER="0.0.2"

ssdtoram_FUN="ssdtoram"
ssdtoram_NFO="Sincroniza contenido desde memoria ram a un soport ssd [$VER]($DEP) @${QP}"
ssdtoram_FMT="ssdtoram [PATH]"
ssdtoram_EXA="ssdtoram --> Sync current folder if is SSD folder"

ssdtoram_OUT=0
ssdtoram_ERR=""


SERVER=$1
BK_PATH=$2
PORT=$3

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ssdtoram_NFO}" "${ssdtoram_FMT}" "${ssdtoram_EXA}"
#--------------------------------------------------------------------------------
else

#-Sync folder from SSD to ram 
PATH_TO_RAM=${1}

if [ "${PATH_TO_RAM}" == "" ] ; then
#-Solo se ha pasado una ruta
PATH_TO_RAM=${PWD}
fi

#-SSD PATH are like /brqx/ or /zcache/ but might to be like /zssd
#-So path might to be changed from zssd to zram

SSD_PATH=$(echo ${PATH_TO_RAM} | sed "s/zram/zssd/g" )
RAM_PATH=$(echo ${PATH_TO_RAM} | sed "s/zssd/zram/g" )

SOURCE=${SSD_PATH}
TARGET=${RAM_PATH}

#-First Create RAM Path

mkp ${TARGET}

#-I have doubth if I use sxto or szto
szto ${SOURCE} ${TARGET}

ssdtoram_OUT=$(expr  ${ssdtoram_OUT} + ${szto_OUT})
ssdtoram_ERR="${ssdtoram_ERR}${szto_ERR}"


if [ "${ssdtoram_OUT}" != "0" ] ; then
ssdtoram="+${ssdtoram_FUN}::##${ssdtoram_ERR}"
footer_error "${ssdtoram_ERR}"
fi


fi

}
