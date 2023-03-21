#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- sync_set_target
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- fix_bar_path - csd / SOURCE - TARGET 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Analiza parametros SOURCE y TARGET y define TARGET_STR 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check sync source target params
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E sync_set_target -- Analiza parametros SOURCE y TARGET y define TARGET_STR
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
sync_set_target()
{
VER="0.0.2"								;QP="Brqx Agile Architecture 2016"

sync_set_target_FUN="sync_set_target"
sync_set_target_NFO="Analiza parametros SOURCE y TARGET y define TARGET_STR [$VER]($DEP) @${QP}"
sync_set_target_FMT="sync_set_target [VERSION] [PATH]"
sync_set_target_EXA="sync_set_target 50 PATH"

sync_set_target_OUT=0
sync_set_target_ERR=""


if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${sync_set_target_NFO}" "${sync_set_target_FMT}" "${sync_set_target_EXA}"
#--------------------------------------------------------------------------------
else
 #-Analiza parametros SOURCE y TARGET y define TARGET_STR

if [ "${PORT}" == "" ] ; then
PORT=60022
fi

if [ "${USER}" == "" ] ; then
USER=root
fi

if 		[ "${SOURCE}" == "" ] ; then
#-Solo se ha pasado una ruta
SOURCE=${PWD}
TARGET=${SOURCE}
elif 	[ "${TARGET}" == "" ] ; then
#-Solo se ha pasado una ruta
TARGET=${SOURCE}
SOURCE=${PWD}
fi

#-Path always with BAR ending
SOURCE=$(fix_bar_path ${SOURCE} )
TARGET=$(fix_bar_path ${TARGET} )

TARGET_USR=${USER}@${SERVER}
TARGET_STR=${USER}@${SERVER}:${TARGET}

csd
sync_set_target_OUT=$(expr  ${csd_OUT} + ${csd_OUT})
sync_set_target_ERR="${sync_set_target_ERR}${sync_set_target_ERR}"


if [ "${sync_set_target_OUT}" != "0" ] ; then
sync_set_target_ERR="+${sync_set_target_FUN}::##${sync_set_target_ERR}"
footer_error "${sync_set_target_ERR}"
fi

fi
}
