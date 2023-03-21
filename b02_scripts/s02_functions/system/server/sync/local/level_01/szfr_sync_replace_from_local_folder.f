#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- szfr
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T sync folders delete from
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH1 [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E szfr PATH1 PATH2 -- Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
szfr()
{
VER="0.0.2"

szfr_FUN="szfr"
szfr_NFO="Sincroniza unidireccional force delete [FROM] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
szfr_FMT="szfr [VERSION] [PATH]"
szfr_EXA="szfr 50 PATH"

szfr_OUT=0
szfr_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${szfr_NFO}" "${szfr_FMT}" "${szfr_EXA}"
#--------------------------------------------------------------------------------
else
#-Si solo se pasa una ruta la otra es la ruta actual
#-Es Una sincronizacion sin borrar contenido sx (sincroniza) sz (sincroniza y borra) 

SOURCE=${1}
TARGET=${2}

if [ "${TARGET}" == "" ] ; then
#-Solo se ha pasado una ruta
TARGET=${SOURCE}
SOURCE=${PWD}
fi

#-Path always with BAR ending
#-Always absolute paths

SOURCE=$(fix_bar_path ${SOURCE} )
TARGET=$(fix_bar_path ${TARGET} )

##rsync -av $/var/ramdisk-backup/ /mnt/ramdisk/

if [ -d "${SOURCE}" ] ; then

if [ -d "${TARGET}" ] ; then

rsync -av --delete --recursive --force  ${TARGET} ${SOURCE}		&> /dev/null

rsync_COD=$?
szfr_OUT=$(expr  ${szfr_OUT} + ${rsync_COD})			

if [ "${rsync_COD}" != "0" ] ; then
szfr_EER="#-E${rsync_COD}:Problem syncing Source : ${SOURCE} - Target : ${TARGET} ##"
szfr_ERR="${szfr_ERR}${szfr_EER}"
fi


else
szfr_EER="#-E31:Target is not folder : ${TARGET}  ##"
szfr_COD=31

szfr_OUT=$(expr  ${szfr_OUT} + ${szfr_COD})
szfr_ERR="${szfr_ERR}${szfr_EER}"

fi
else

szfr_EER="#-E32:Source is not folder : ${SOURCE} ##"
szfr_COD=32

szfr_OUT=$(expr  ${szfr_OUT} + ${szfr_COD})
szfr_ERR="${szfr_ERR}${szfr_EER}"
fi


if [ "${szfr_OUT}" != "0" ] ; then
szfr_ERR="+${szfr_FUN}::##${szfr_ERR}"
footer_error "${szfr_ERR}"
fi

fi
}
