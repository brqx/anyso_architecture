#!/bin/bash
#
# Script version 0.0.4
#
#Importa por completo una BD mysql en una ruta indicada
#example myim database
myim_myloader()
{
VER="0.0.4"
#-El nombre de la bd es una concatenacion
##"${1}" == "-?" -o

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Importa por completo una BD en formato SQL [$VER]	        "
echo "=========================================================="
echo "Format  : myim DB [SQL_FILENAME] [PATH]	                "
echo "----------------------------------------------------------"
echo "Example : myim mag_p20test mag_p20test.sql /sata/export	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else
INPUT_DB=${1}
INPUT_FOLDER=${2}
INPUT_FILENAME=${3}

if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/dbs/"
fi

OLD_PATH=${PWD}

cd ${INPUT_FOLDER}

if [ "${INPUT_FILENAME}" == "" ] ; then
#- Puede ser sql o tar.gz
INPUT_FILENAME=$(ls -1 "${INPUT_FOLDER}" | grep "${INPUT_DB}" | tail -1 )
echo "${INPUT_FILENAME}"  | grep gz
grep_OUT=$?
if [ "${grep_OUT}" == "0"  ] ; then
#es un tar
tar zxvf ${INPUT_FILENAME}
INPUT_FILENAME=$(ls -1 "${INPUT_FOLDER}" | grep -v "gz" | grep "${INPUT_DB}" | tail -1 )
fi

fi


# Cadenas de busqueda y reemplazo

if [ "${OUTOUT}" != "CLEAN" ] ; then

echo "==--==--==--==--==--==--==--==--==--==--==-"
echo "Importa una BD en formato SQL [$VER]					"
echo "-------------------------------------------"
echo "BD a importar           : ${INPUT_DB}				 "
echo "Fichero SQL a importar  : ${INPUT_FILENAME}	 "
echo "Ruta Importacion        : ${INPUT_FOLDER}		 "
echo "-------------------------------------------"

fi

USER="root"

#- Formato : 20151012.mag_d20test.sql

FULL_NAME=${INPUT_FILENAME}

echo "CREATE DATABASE ${INPUT_DB}" | mysql -u root 2> /dev/null
create_OUT="$?"
if [ "${create_OUT}"  != "0" ]  ; then
echo "Error BD existe en el sistema. No la importamos"
else

myloader \
--database=${INPUT_DB} \
--directory=${INPUT_FOLDER} \
--queries-per-transaction=50000 \
--threads=10 \
--compress-protocol \
--verbose=3

import_OUT=$?

if [ "${import_OUT}"  == "0" ]  ; then

if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "Importacion correcta"
fi

rm -f "${FULL_NAME}"
fi

fi

if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==-"
fi

cd ${OLD_PATH}

fi

}
