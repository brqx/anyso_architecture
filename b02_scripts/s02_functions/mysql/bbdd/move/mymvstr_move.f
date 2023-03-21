#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- mymvstr
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Ficheros
#--------------------------------------------------------------------------------
#--  
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Mueve bases de datos cambiando el nombre en base a los filtros de entrada
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T move database changing name
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FILTER COMMON TARGET
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E mymvstr rct main rcabello 	-- Mueve bbdd cambiando el nombre de las mismas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
mymvstr()
{
VER="0.0.8"
FUNC="mymvstr"

mymvstr_NFO="Mueve|Renombra bases de datos en base a patrones de entrada [$VER]"
mymvstr_FMT="mymvstr FILTER COMMON TARGET"
mymvstr_EXA="mymvstr rct main rcabello"


if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" -o  "${3}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mymvstr_NFO}" "${mymvstr_FMT}" "${mymvstr_EXA}"
#--------------------------------------------------------------------------------
else
FILTER_DB_IN=${1}		# rct_p50main_n_aa
COMMON=${2}				# rct_p50main 	
TARGET=${3}				# rct_p50rcabello 

for database in $( mystr ${FILTER_DB_IN} ) ; do
TARGET_DATABASE=$(echo ${database}| sed "s/${COMMON}/${TARGET}/g" )

mymv $database ${TARGET_DATABASE}
done

fi

}

