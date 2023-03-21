#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- satafromram
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- szto
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
satafromram()
{
VER="0.0.2"

satafromram_FUN="satafromram"
satafromram_NFO="Genera estructura enlaces simbolicos info y server Drupal [$VER]($DEP) @${QP}"
satafromram_FMT="satafromram [VERSION] [PATH]"
satafromram_EXA="satafromram 50 PATH"

satafromram_OUT=0
satafromram_ERR=""


SERVER=$1
BK_PATH=$2
PORT=$3

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${satafromram_NFO}" "${satafromram_FMT}" "${satafromram_EXA}"
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

SOURCE=${RAM_PATH}
TARGET=${SATA_PATH}

#-I have doubth if I use sxto or szto
szto ${SOURCE} ${TARGET}

if [ "${satatoram_OUT}" != "0" ] ; then
satatoram="#+${satafromram_FUN}::##${satafromram_ERR}"
footer_error "${satafromram_NFO}" "${satafromram_ERR}"
fi

fi

}
