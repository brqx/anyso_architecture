#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- mymv - mymv_slow
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Ficheros
#--------------------------------------------------------------------------------
#-- mycpin - mydr  
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Mueve| Renombra una bases de datos en base a los filtros de entrada
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T move rename database changing name
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FILTER COMMON TARGET
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E mymv rct_p50main rcabello_d51_tot 	-- Mueve bbdd cambiando el nombre
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
mymv()
{
VER="0.0.8"
FUNC="mymv"

mymv_NFO="Mueve|Renombra una base de datos en base a patrones de entrada [$VER]"
mymv_FMT="mymv FILTER COMMON TARGET"
mymv_EXA="mymv rct main rcabello"

if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mymv_NFO}" "${mymv_FMT}" "${mymv_EXA}"
#--------------------------------------------------------------------------------

else

DB_SOURCE=$1
DB_TARGET=$2


DBUSER=root
DBCONN=" -u ${DBUSER} "

echo "Renaming database ... ${DB_SOURCE} in ${DB_TARGET} (may take a while ...)"

echo "DROP DATABASE IF EXISTS ${DB_TARGET}" | mysql ${DBCONN}
echo "CREATE DATABASE ${DB_TARGET}" 		| mysql ${DBCONN}
# Preparamos los insert
for TABLE in $(mysql -u root -s -N -e "SHOW TABLES from ${DB_SOURCE}" ) ; do
mysql -u root -s -N -e "rename table ${DB_SOURCE}.${TABLE} to ${DB_TARGET}.${TABLE}";
done

mydr ${DB_SOURCE}
fi
}


#-Mueve/Renombra una bd en otra
#example mydr bd_01 
mymv_slow()
{
VER="0.0.1"
FUNC="mymv_slow"

mymv_slow_NFO="Mueve|Renombra una base de datos en base a patrones de entrada [$VER]"
mymv_slow_FMT="mymv_slow DB_SOURCE DB_TARGET"
mymv_slow_EXA="mymv_slow rct_p50main rct_p51main"


if [ "${1}" == "-?" -o  "${1}" == "" -o  "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${mymv_slow_NFO}" "${mymv_slow_FMT}" "${mymv_slow_EXA}"
#--------------------------------------------------------------------------------
else

DB_SOURCE=$1
DB_TARGET=$2

mycp ${DB_SOURCE} ${DB_TARGET}

mydr ${DB_SOURCE}

fi
}

