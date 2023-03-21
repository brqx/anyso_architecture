#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- sxto
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I  
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
#E sxto PATH [PATH2] Sincroniza unidireccional [TO] a nivel local dos rutas con rsync
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
sxto()
{
VER="0.0.2"

sxto_FUN="sxto"
sxto_NFO="Sincroniza unidireccional [TO] a nivel local dos rutas con rsync [$VER]($DEP) @${QP}"
sxto_FMT="sxto [VERSION] [PATH]"
sxto_EXA="sxto 50 PATH"

sxto_OUT=0
sxto_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${sxto_NFO}" "${sxto_FMT}" "${sxto_EXA}"
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


rsync -av ${SOURCE} ${TARGET}									&>	/dev/null
rsync_COD=$?
sxto_OUT=$(expr  ${sxto_OUT} + ${rsync_COD})			

if [ "${rsync_COD}" != "0" ] ; then
sxto_EER="#-E${rsync_COD}:Problem syncing Source : ${SOURCE} - Target : ${TARGET} ##"
sxto_ERR="${sxto_ERR}${sxto_EER}"
fi

else
sxto_EER="#-E31:Target is not folder : ${TARGET}  ##"
sxto_COD=31

sxto_OUT=$(expr  ${sxto_OUT} + ${sxto_COD})
sxto_ERR="${sxto_ERR}${sxto_EER}"

fi
else

sxto_EER="#-E32:Source is not folder : ${SOURCE} ##"
sxto_COD=32

sxto_OUT=$(expr  ${sxto_OUT} + ${sxto_COD})
sxto_ERR="${sxto_ERR}${sxto_EER}"
fi


if [ "${sxto_OUT}" != "0" ] ; then
sxto_ERR="+${sxto_FUN}::##${sxto_ERR}"
footer_error "${sxto_ERR}"
fi

fi
}
