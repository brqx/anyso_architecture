#!/bin/bash
#
# Script version 0.0.4
#
#Importa por completo una BD mysql en una ruta indicada
#example myim database
myim()
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

##echo "ENTRANDO"

if [ "${INPUT_FOLDER}" == "" ] ; then
INPUT_FOLDER="/sata/dbs/"
fi

OLD_PATH=${PWD}

cd ${INPUT_FOLDER}

if [ "${INPUT_FILENAME}" == "" ] ; then
	#- Puede ser sql o tar.gz
	#Opcion si no funciona el ls
##	INPUT_FILENAME=$(find . -type f | grep  "${INPUT_FOLDER}" | grep "${INPUT_DB}" | tail -1 )
	INPUT_FILENAME=$(ls -1 "${INPUT_FOLDER}" | grep "${INPUT_DB}" | tail -1 )
	echo "${INPUT_FILENAME}"  | grep gz		2> /dev/null
	grep_OUT=$?
	if [ "${grep_OUT}" == "0"  ] ; then
	#es un tar
	tar zxvf ${INPUT_FILENAME}
	INPUT_FILENAME=$(ls -1 "${INPUT_FOLDER}" | grep -v "gz" | grep "${INPUT_DB}" | tail -1 )
	fi

fi

##echo "FILENAME : ${INPUT_FILENAME}"


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

NUM_DBS=$( mylist ${INPUT_DB} | wc -l )

if [ "${NUM_DBS}"  != "0" ]  ; then
echo "Error BD existe en el sistema. No la importamos"
else
#-1.Convert to InnoDb
#sed -i 's/MyISAM/INNODB/g' "${FULL_NAME}"
#-2.Remove @@GLOBAL.GTID_PURGED
#cat "${FULL_NAME}" | grep -v "GLOBAL.GTID_PURGED" > "${FULL_NAME}_bdd" 
#mv -f "${FULL_NAME}_bdd" "${FULL_NAME}"

#cat "${FULL_NAME}" | grep -v "@MYSQLDUMP " > "${FULL_NAME}_bdd"
#mv -f "${FULL_NAME}_bdd" "${FULL_NAME}"

echo "CREATE DATABASE ${INPUT_DB}" | mysql -u root 2> /dev/null

mysql -u root "${INPUT_DB}" < "${FULL_NAME}"
import_OUT=$?


if [ "${import_OUT}"  == "0" ]  ; then

if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "Importacion correcta"
fi

rm -f ${FULL_NAME}
fi

fi

if [ "${OUTOUT}" != "CLEAN" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==-"
fi

cd ${OLD_PATH}

fi

}
