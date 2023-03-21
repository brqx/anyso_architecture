#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- ssdfromram
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
#T sync ram to ssd
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ssdfromram PATH -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ssdfromram()
{
VER="0.0.2"

ssdfromram_FUN="ssdfromram"
ssdfromram_NFO="Sincroniza una ruta desde ram a dispositivo SSD [$VER]($DEP) @${QP}"
ssdfromram_FMT="ssdfromram [VERSION] [PATH]"
ssdfromram_EXA="ssdfromram 50 PATH"

ssdfromram_OUT=0
ssdfromram_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ssdfromram_NFO}" "${ssdfromram_FMT}" "${ssdfromram_EXA}"
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

RAM_PATH=$(echo ${PATH_TO_RAM} | sed "s/zssd/zram/g" )
SSD_PATH=$(echo ${PATH_TO_RAM} | sed "s/zram/zssd/g" )

#-Be sure to recreate SSD Path

mkp ${TARGET}


SOURCE=${RAM_PATH}
TARGET=${SSD_PATH}

#-I have doubth if I use sxto or szto
szto ${SOURCE} ${TARGET}

if [ "${ssdfromram_OUT}" != "0" ] ; then
ssdfromram="#+${ssdfromram_FUN}::##${ssdfromram_ERR}"
footer_error "${ssdfromram_NFO}" "${ssdfromram_ERR}"
fi

fi

}
