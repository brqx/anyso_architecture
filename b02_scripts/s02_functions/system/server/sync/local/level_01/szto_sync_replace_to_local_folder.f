#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- szto
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T sync folders delete to
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P PATH [PATH2]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E szto PATH [PATH2] Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
szto()
{
VER="0.0.2"

szto_FUN="szto"
szto_NFO="Sincroniza unidireccional force delete [TO] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
szto_FMT="szto [VERSION] [PATH]"
szto_EXA="szto 50 PATH"

szto_OUT=0
szto_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${szto_NFO}" "${szto_FMT}" "${szto_EXA}"
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

rsync -av --delete --recursive --force ${SOURCE} ${TARGET}		&> /dev/null

rsync_COD=$?
szto_OUT=$(expr  ${szto_OUT} + ${rsync_COD})			

if [ "${rsync_COD}" != "0" ] ; then
szto_EER="#-E${rsync_COD}:Problem syncing Source : ${SOURCE} - Target : ${TARGET} ##"
szto_ERR="${szto_ERR}${szto_EER}"
fi


else
szto_EER="#-E31:Target is not folder : ${TARGET}  ##"
szto_COD=31

szto_OUT=$(expr  ${szto_OUT} + ${szto_COD})
szto_ERR="${szto_ERR}${szto_EER}"

fi
else

szto_EER="#-E32:Source is not folder : ${SOURCE} ##"
szto_COD=32

szto_OUT=$(expr  ${szto_OUT} + ${szto_COD})
szto_ERR="${szto_ERR}${szto_EER}"
fi


if [ "${szto_OUT}" != "0" ] ; then
szto_ERR="+${szto_FUN}::##${szto_ERR}"
footer_error "${szto_ERR}"
fi



fi

}
