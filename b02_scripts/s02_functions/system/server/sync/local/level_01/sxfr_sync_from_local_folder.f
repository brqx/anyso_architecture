#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- sxfr
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional [FROM] a nivel local dos rutas con rsync 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E sxram LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
sxfr()
{
VER="0.0.2"

sxfr_FUN="sxfr"
sxfr_NFO="Sincroniza unidireccional [FROM] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
sxfr_FMT="sxfr [VERSION] [PATH]"
sxfr_EXA="sxfr 50 PATH"

sxfr_OUT=0
sxfr_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${sxfr_NFO}" "${sxfr_FMT}" "${sxfr_EXA}"
#--------------------------------------------------------------------------------
else
 #-Si solo se pasa una ruta la otra es la ruta actual

SOURCE=${1}
TARGET=${2}

if [ "${TARGET}" == "" ] ; then
#-Solo se ha pasado una ruta
TARGET=${SOURCE}
SOURCE=${PWD}
fi

#-Path always with BAR ending
SOURCE=$(fix_bar_path ${SOURCE} )
TARGET=$(fix_bar_path ${TARGET} )

##rsync -av $/var/ramdisk-backup/ /mnt/ramdisk/

if [ -d "${SOURCE}" ] ; then
#--STA_IF_[01] -- [ CHECKING SOURCE ] -------------------------------------------

if [ -d "${TARGET}" ] ; then
#--STA_IF_[02] -- [ CHECKING TARGET ] -------------------------------------------


rsync -av  ${TARGET} ${SOURCE}						&>		/dev/null
rsync_COD=$?
sxfr_OUT=$(expr  ${sxfr_OUT} + ${rsync_COD})			

if [ "${rsync_COD}" != "0" ] ; then
sxfr_EER="#-E${rsync_COD}:Problem syncing Source : ${SOURCE} - Target : ${TARGET} ##"
sxfr_ERR="${sxfr_ERR}${sxfr_EER}"
fi


else
#--ELS_IF_[02] -- [ CHECKING TARGET ] -------------------------------------------

sxfr_EER="#-E31:Target is not folder : ${TARGET}  ##"
sxfr_COD=31

sxfr_OUT=$(expr  ${sxfr_OUT} + ${sxfr_COD})
sxfr_ERR="${sxfr_ERR}${sxfr_EER}"

#--END_IF_[02] -- [ CHECKING TARGET ] -------------------------------------------
fi
else

sxfr_EER="#-E32:Source is not folder : ${SOURCE} ##"
sxfr_COD=32

sxfr_OUT=$(expr  ${sxfr_OUT} + ${sxfr_COD})
sxfr_ERR="${sxfr_ERR}${sxfr_EER}"

#--STA_IF_[01] -- [ CHECKING SOURCE ] -------------------------------------------
fi


if [ "${sxfr_OUT}" != "0" ] ; then
sxfr_ERR="+${sxfr_FUN}::##${sxfr_ERR}"
footer_error "${sxfr_ERR}"
fi

fi
}
